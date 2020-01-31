## Virtual Machine Setup
### Third party
- Replace Windows Firewall with [simplewall](https://github.com/henrypp/simplewall)
  - Load on system startup
  - Start minimized
  - Skip UAC prompt
- If not using [simplewall](https://github.com/henrypp/simplewall), manually [disable Windows telemetry](https://github.com/crazy-max/WindowsSpyBlocker)
- Disable [CompatTelRunner](Regs/Disable%Disable%20CompatTelRunner.reg)

### Configurations
- Apply [group policies](Group%20Policies.md)
- Disable animations from `Ease of Access`
- Set power plan to `High performance`
- Set `Turn off display` to `Never`

### Folder options
- Disable all in `Privacy`
- Show hidden files
- Don't hide known extensions