# Plain text configurations for GNOME

GNOME uses dconf for it's configuration which stores them in a binary format. But I want to save my configuration in a plaintext format so it can be organized in a GIT repository.

To do this I use the approch from this blog post: [Plain text configuration for GNOME](http://catern.com/2014/12/20/plain-text-configuration-gnome.html)

## Important commands

Dump config: `dconf dump /`
Watch for changes: `dconf watch /`
Load config: `cat *.conf | dconf load /`
