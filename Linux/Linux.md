## Linux
### Delete shell history on exit
- `apt install secure-delete`
- `~/.bash_logout`:
```bash
srm ~/.bash_history 2> /dev/null
# will prevent saving buffer to ~/.bash_history
history -c
```
