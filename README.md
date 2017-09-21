tmux-scratch
============

A persistent scratchpad shell session always one keystroke away.

# Description

Opens a new tmux split containing a persistent shell session inside it.

# Requirements

* [tmux](https://tmux.github.io/)
* [tpm](https://github.com/tmux-plugins/tpm)
* [abduco](https://github.com/martanne/abduco/)
* bash >= 4.x

# Install

Install tpm and add the following line to your `~/.tmux.conf`.

```bash
set-option -g @plugin 'doomhammer/tmux-scratch'
```

then, press `Prefix + I` in tmux session.

# Usage

Default key binding is `Prefix + b`. If you want to change this key binding, set the following line in your `~/.tmux.conf`.

```bash
set-option -g @scratch-key 'x' # or your favorite key binding
```

Default `split-window` size is 20. If you want to change this size, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @scratch-size 15 # or your favorite size
```

or

```bash
set-option -g @scratch-size 20% # if you like to keep things relative
```

Default `split-window` orientation is vertical. If you want to change this orientation, set the following line in your `~/.tmux.conf`.

```bash
set-option -g @scratch-orientation 'h'
```

Default command run as the session is `$(getent passwd $(whoami)| sed -e 's/.*://')`. If you want to change this orientation, set the following line in your `~/.tmux.conf`.

```bash
set-option -g @scratch-cmd '/bin/zsh'
```

# License

MIT

# Author

[DoomHammer](https://github.com/DoomHammer)

# Credits

Thanks to:

* [knakayama](https://github.com/knakayama) for the `tmux-man` that inspired
  this
