# tunblkctl
Command-line frontend for [Tunnelblick](https://tunnelblick.net/).

## Features
- **Lightweight**: Under **15KB** uncompressed.
- **Tab-Completion**: Includes scripts for ZSH and Bash.
- **Rapid Installation**: [Quick setup](#installing) with Homebrew.
- **Zero Dependencies**: No additional installations required.
- **Customizable**: Tailor output using environment variables and switches.
- **Well-Documented**: Complete manual pages.
- **Command Aliases**: Efficient and fewer keystrokes.
- **Open License**: Freedom with MIT license.

## Installing
The easiest way to install the tool is using [Homebrew](https://brew.sh/):

`$ brew install azhuchkov/tools/tunblkctl`

## Usage
There are various ways **tunblkctl** can be used to automate **VPN** management. 

### Overview
```
Usage: tunblkctl list
       tunblkctl status [--strip] [--no-strip]
       tunblkctl connect [--wait] <VPN>
       tunblkctl disconnect [VPN]
       tunblkctl quit
```

### Get information about installed configurations
```shell
# Enumerate installed configurations
$ tunblkctl list
cloud		corporate
```

```shell
# Show status report for installed configurations
$ tunblkctl status
CONFIGURATION  STATUS     IN     OUT
cloud          CONNECTED  4.91M  888.84K
corporate      EXITING    6.35K  4.76K
```

### Establish a connection to a VPN
```shell
# Begin connecting to a VPN
$ tunblkctl connect <VPN>

# Begin connecting to a VPN and wait until connection is established
$ tunblkctl connect --wait <VPN>
```

### Shutdown VPN connections
```shell
# Disconnect from some particular VPN
$ tunblkctl disconnect <VPN>

# Disconnect all the established connections
$ tunblkctl disconnect

# Quit Tunnelblick (includes active connections shutting down)
$ tunblkctl quit
```
> [!NOTE]
> Feel free to create shell **aliases** for frequently-used commands.

## License
`tunblkctl` is licensed under the terms of the MIT license.
See [LICENSE](https://github.com/azhuchkov/tunblkctl/blob/main/LICENSE)
for more information.
