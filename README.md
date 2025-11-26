# .gokey

> Gokey wrapper for password generation and clipboard copying.

## Prerequisites

- [Gokey](https://github.com/cloudflare/gokey)
- [cross-copy](https://github.com/hwhang0917/dotfiles/blob/master/scripts/.local/bin/cross-copy) for clipboard support, you can use your own method to copy to clipboard.

## Install

```bash
# Clone the repository to $HOME/.gokey
git clone https://github.com/hwhang0917/.gokey.git $HOME/.gokey

# Generate master password using method of your choice, I used openssl
openssl rand -hex 32 > $HOME/.gokey/master-password

# Generate seedfile using gokey
gokey -P $HOME/.gokey/master-password -t seed -o $HOME/.gokey/seedfile

# Symlink fpass script to your local bin directory (or any directory in your PATH)
ln -s $HOME/.gokey/fpass $HOME/.local/bin/fpass
```

## Usage

```bash
# Runs `gokey -P ~/.gokey/master-password -s ~/.gokey/seedfile -t pass -r <realm> -l <length>` and copies the result to clipboard.
#
#   if length is not provided, defaults to 10.
#   if realm is not provided, prompts for it.
fpass <realm> -l <length>
```
