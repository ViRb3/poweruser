@echo off

rem unique name
title PKDJHDSPKHJOSKJMJBOSD

rem run code with poetry environmental variables
echo cmd /c code . | poetry shell

rem cannot exit before code, so just kill self
taskkill /F /FI "WindowTitle eq PKDJHDSPKHJOSKJMJBOSD" /T
