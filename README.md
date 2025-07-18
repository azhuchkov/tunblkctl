# tunblkctl

<img src="https://github.com/azhuchkov/tunblkctl/assets/765471/25bf7e5a-e53b-4c8d-b99f-e96da1dae6bc" alt="logo" align="right"/>

![GitHub release (with filter)](https://img.shields.io/github/v/release/azhuchkov/tunblkctl)
![GitHub commits since latest release (by SemVer including pre-releases)](https://img.shields.io/github/commits-since/azhuchkov/tunblkctl/latest)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/azhuchkov/tunblkctl/makefile.yml)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/azhuchkov/tunblkctl)
![GitHub License](https://img.shields.io/github/license/azhuchkov/tunblkctl)
![GitHub Repo stars](https://img.shields.io/github/stars/azhuchkov/tunblkctl?style=flat)

A streamlined command-line frontend for [Tunnelblick], designed to automate VPN-related 
workflows. Perfect for integrating VPN management into command-line driven tasks.

<br clear="right"/>

## Highlights
- **Lightweight**: Under **15KB** uncompressed.
- **Tab-Completion**: Includes scripts for ZSH, Bash and Fish.
- **Rapid Installation**: [Quick setup](#installing) with Homebrew.
- **Zero Dependencies**: Only macOS and Tunnelblick are required.
- **Configurable**: Tailor output using environment variables and switches.
- **Well-Documented**: Complete [user manual][man].
- **Open License**: Freedom with MIT license.

## Usage
`tunblkctl` is very _easy_ to use. Thanks to tab-completion and aliases, 
`tunblkctl` is even simpler and more convenient. 

```console
$ tunblkctl ls
cloudvpn		workvpn

$ tunblkctl connect --wait cloudvpn

$ tunblkctl status
VPN        IN     OUT      AUTO
cloudvpn   4.91M  888.84K  -
workvpn    6.35K  4.76K    -

$ tunblkctl disconnect
```
Find more commands and options in the [full manual][man].

## Installing
The easiest way to install the tool is using [Homebrew](https://brew.sh/):

`$ brew install azhuchkov/tools/tunblkctl` ([formula source][brew-tap])

Or to install the latest (**unstable**) version:

`$ brew install --HEAD azhuchkov/tools/tunblkctl` ([formula source][brew-tap])

## FAQ
**Q: I installed the software using the recommended method, but tab-completion doesn't work. Why?**  
A: Try using a new shell session by opening a new terminal tab or window.

**Q: My shell session is restarted, but tab-completion still isn't working. What should I do?**  
A: Ensure that your shell is on the list of supported shells and is [properly configured](https://docs.brew.sh/Shell-Completion). 

## License
`tunblkctl` is licensed under the terms of the MIT License.
See [LICENSE](https://github.com/azhuchkov/tunblkctl/blob/main/LICENSE)
for more information.


[man]: https://github.com/azhuchkov/tunblkctl/wiki/User-Manual
[Tunnelblick]: https://tunnelblick.net
[brew-tap]: https://github.com/azhuchkov/homebrew-tools/blob/main/Formula/tunblkctl.rb
