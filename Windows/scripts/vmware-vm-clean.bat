@echo off

echo.
echo Please ensure:
echo   * VMs are stopped and closed
echo   * VMWare is not running
echo.
pause
echo.

rem logs
for /R %%f in (*.log) do echo Deleting "%%f" && del "%%f"
rem backup of the VM's paging file
for /R %%f in (*.vmem) do echo Deleting "%%f" && del "%%f"
rem crash dump
for /R %%f in (*.dmp) do echo Deleting "%%f" && del "%%f"

echo Done
echo.
pause