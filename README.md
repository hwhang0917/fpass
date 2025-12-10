# FPass

FPass is a Gokey wrapper for password generation and clipboard copying.

## Prerequisites

- [gokey](https://github.com/cloudflare/gokey)

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/hwhang0917/fpass/refs/heads/main/install.sh | bash
```

## Setup

```bash
# Generate master password
openssl rand -hex 32 > ~/.gokey/master-password

# Generate seedfile
gokey -P ~/.gokey/master-password -t seed -o ~/.gokey/seedfile
```

## Usage
```bash
fpass [OPTIONS] [REALM]
```

| Option | Description |
|--------|-------------|
| `-l LENGTH` | Password length (default: gokey default) |
| `-v` | Verbose mode |
| `-h` | Show help |

If `REALM` is omitted, you'll be prompted to enter it.

### Examples
```bash
fpass github.com           # Generate password for github.com
fpass github.com -l 32     # Generate 32-character password
fpass                      # Interactive prompt for realm
```
