defmodule Mix.Tasks.Mandrag do
  defmodule Deploy do
    use Mix.Task

    @shortdoc "Deploys an exrm release."

    def run(_) do
      case initial_deploy? do
        true -> prepare; build; start
        false -> build; upgrade
      end
    end

    defp prepare, do: _prepare(location)
    defp build, do: _build(location)

    defp _prepare(:local) do
      Mix.Task.run "ecto.setup"
      ssh "mkdir -p #{name}"
      scp "rel/#{name}/releases/#{version}/#{name}.tar.gz", "#{name}/#{name}.tar.gz"
      ssh "cd #{name} && tar xf #{name}.tar.gz && rm #{name}.tar.gz"
    end

    defp _prepare(:remote) do
      ssh "git clone #{repo} #{name}"
      ssh "mkdir #{name}/priv/static"
      scp "config/prod.secret.exs", "#{name}/config/prod.secret.exs"
      ssh "cd #{name} && MIX_ENV=#{Mix.env} mix deps.get"
      ssh "cd #{name} && npm install"
      ssh "cd #{name} && node_modules/bower/bin/bower install -p"
    end

    defp _build(:local) do
      Mix.Task.run "compile"
      Mix.Shell.IO.cmd "brunch build"
      Mix.Task.run "phoenix.digest", []
      Mix.Task.run "release", []
    end

    defp _build(:remote) do
      ssh "cd #{name} && git pull"
      ssh "cd #{name} && MIX_ENV=#{Mix.env} mix compile"
      ssh "cd #{name} && node_modules/brunch/bin/brunch build"
      ssh "cd #{name} && MIX_ENV=#{Mix.env} mix phoenix.digest"
      ssh "cd #{name} && MIX_ENV=#{Mix.env} mix release"
    end

    defp start do
      case location do
        :local -> Mix.Task.run "ecto.setup", []
        :remote -> ssh "cd #{name} && MIX_ENV=#{Mix.env} mix ecto.setup"
      end
      _run("start")
    end

    defp upgrade do
      case location do
        :local ->
          scp "rel/#{name}/releases/#{version}/#{name}.tar.gz", "#{user}@#{host}:#{name}/releases/#{version}/"
          Mix.Task.run "ecto.migrate", []
        :remote -> scp "config/prod.secret.exs", "#{name}/config/prod.secret.exs"
      end
      _run("upgrade '#{version}'")
    end

    defp _run(command) do
      path = (location == :local) && "#{name}/bin/#{name}" || "#{name}/rel/#{name}/bin/#{name}"
      ssh("#{path} #{command}")
    end

    defp initial_deploy?, do: ssh("ls #{name} &>/dev/null") != 0

    # ssh helpers
    defp ssh_options, do: "-i#{key} -oStrictHostKeyChecking=no"
    defp ssh(command), do: Mix.Shell.IO.cmd "ssh #{user}@#{host} #{ssh_options} '#{command}'"
    defp scp(source, destination), do: Mix.Shell.IO.cmd "scp #{ssh_options} #{source} #{user}@#{host}:#{destination}"

    # config helpers
    defp location, do: Application.get_env(:mandrag, :build_location)
    defp user, do: Application.get_env(:mandrag, :user)
    defp host, do: Application.get_env(:mandrag, :host)
    defp key, do: Application.get_env(:mandrag, :key)
    defp name, do: Application.get_env(:mandrag, :name)
    defp version, do: Application.get_env(:mandrag, :version)
    defp repo, do: Application.get_env(:mandrag, :repo)
  end
end
