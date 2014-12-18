class ghservice::ui {

    # Apply the UI class.
    class { '::ui':
        ui_root_dir     => hiera('ux_root_dir'),
        install_method  => hiera('ux_install_method', 'git'),
        install_config  => hiera('ux_install_config', {
            'source' => 'https://github.com/CUL-DigitalServices/grasshoppper-ui',
            'revision' => 'master'
        })
    }
}
