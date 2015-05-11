class ui (
    $ui_root_dir        = '/opt/grasshopper-ui',

    $install_method     = 'git',
    $install_config     = {
        'source' => 'https://github.com/CUL-DigitalServices/grasshopper-ui',
        'revision' => 'master'
    }) {

    # Create a command for generating the production build
    $production_build_cmd = hiera('do_production_build') ? {
        'true'  => 'npm install -d && node ./node_modules/.bin/grunt',
        'false' => 'true',
        default => 'true',
    }

    class { "::ui::install::${install_method}":
        install_config  => $install_config,
        ui_root_dir     => $ui_root_dir
    } ->

    # Install the git submodules and, if enabled, run a production build
    exec { 'install_git_submodules':
        cwd        => $ui_root_dir,
        command    => 'git submodule update --init --recursive'
    } ->

    # Do a production build, if it's enabled
    exec { 'do_production_build':
        cwd        => $ui_root_dir,
        command    => $production_build_cmd
    }
}
