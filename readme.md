# Dotfiles

This repo contains my configuration files.
Each directory corresponds to a program.
The content of each directory directly maps
the hierarchy of files from the home directory.

Some configurations require the use of powerline fonts / nerdfonts.
You can use the already patched nerdfont [Ubuntu Mono][ubuntu-mono-font].
Make sure to use it in your terminal preferences.

[ubuntu-mono-font]: https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/UbuntuMono.zip

## Install
To install all packages
```shell
./install.sh 
```

To install packages foo and bar
```shell
./install.sh foo bar
```

## Uninstall
To uninstall all packages
```shell
./uninstall.sh 
```

To uninstall packages foo and bar
```shell
./uninstall.sh foo bar
```

