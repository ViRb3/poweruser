scriptdir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
Set oShell = CreateObject("Shell.Application")  
oShell.ShellExecute "powershell.exe", "-ep bypass -file """ & scriptdir & "\intel-graphics-control.ps1""", "", "runas", 0
