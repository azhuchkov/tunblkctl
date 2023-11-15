# tunblkctl
Command-line frontend for [Tunnelblick](https://tunnelblick.net/).

## Features
- **Lightweight**: Under **15KB** uncompressed.
- **Tab-Completion**: Includes scripts for ZSH and Bash.
- **Rapid Installation**: [Quick setup](#installing) with Homebrew.
- **Zero Dependencies**: Only macOS and Tunnelblick are required.
- **Configurable**: Tailor output using environment variables and switches.
- **Well-Documented**: Complete [user manual](wiki/User-Manual).
- **Open License**: Freedom with MIT license.

## Usage
**tunblkctl** is very _easy_ to use. Thanks to tab-completion and aliases, 
it's even simpler and more convenient. 

```console
$ tunblkctl ls
cloudvpn		workvpn

$ tunblkctl connect --wait cloudvpn

$ tunblkctl status
CONFIGURATION  STATUS     IN     OUT
cloudvpn       CONNECTED  4.91M  888.84K
workvpn        EXITING    6.35K  4.76K

$ tunblkctl disconnect
```
Find more commands and options in the [full manual](wiki/User-Manual).

## Installing
The easiest way to install the tool is using [Homebrew](https://brew.sh/):

`$ brew install azhuchkov/tools/tunblkctl`

## FAQ
**Q: I installed the software using the recommended method, but tab-completion doesn't work. Why?**  
A: Try using a new shell session by opening a new terminal tab or window.

**Q: My shell session is restarted, but tab-completion still isn't working. What should I do?**  
A: Ensure that your shell is on the list of supported shells and is [properly configured](https://docs.brew.sh/Shell-Completion). 

## License
`tunblkctl` is licensed under the terms of the MIT license.
See [LICENSE](https://github.com/azhuchkov/tunblkctl/blob/main/LICENSE)
for more information.
