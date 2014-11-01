@echo off

echo Delete all "SoftwareDistribution"...
cd /d "%WINDIR%"\SoftwareDistribution\Download && del /s /q *.*
echo Done.
echo.

echo Delete all "Recent Documents"...
cd /d "%APPDATA%"\Microsoft\Windows\Recent && del /s /q *.*
echo Done.
echo.
