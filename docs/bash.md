# :simple-gnubash: Linux commands Cheat Sheet

## Keyboard Shortcuts

- ++ctrl+"a"++ : Begin of command line
- ++ctrl+"e"++ : End of command line
- ++ctrl+"w"++ : Delete word of command line
- ++ctrl+"u"++ : Delete full line of command line
- ++ctrl+"r"++ : Search in the command history
- ++ctrl+"l"++ : Clear console
- ++f11++ :  Full screen
- ++ctrl+shift+plus++ : Increase font size
- ++ctrl+shift+minus++ : Descrease font size

## Move in console

```bash
--8<-- "code/bash/move-in-console.sh"
```

## File commands

```bash
--8<-- "code/bash/files-basics.sh"
```

### File Permissions

```bash
--8<-- "code/bash/files-permissions.sh"
```

## Process Management

```bash
--8<-- "code/bash/process-management.sh"
```

## SSH

```bash
--8<-- "code/bash/ssh.sh"
```

## Searching

```bash
--8<-- "code/bash/searching.sh"
```

## System info

```bash
--8<-- "code/bash/system-info.sh"
```

## Network

```bash
--8<-- "code/bash/network-basics.sh"
```

## Compression

```bash
--8<-- "code/bash/compression.sh"
```

## Miscellany

```bash
# Edit the user session bash to add the date on the history commands output
vim ~/.bashrc
> HISTTIMEFORMAT="%T-%m-%d %T "

# Not useful, just looks cool
cmatrix

```

## References

- [Pattern Matching In Bash](https://www.linuxjournal.com/content/pattern-matching-bash)
