@echo off
cls
setlocal enabledelayedexpansion

set requirement_base_directory=<Path where you want to store all requirements>
set files_dir=<Path where you have saved files with BDEs and Channels>
set current_year=%date:~6,4%
IF NOT EXIST %requirement_base_directory%\%current_year% (
  mkdir %requirement_base_directory%\%current_year%
)

if "%1" == "" (
  goto benchmark1
)
if %1 == y (
  set custom_path=%requirement_base_directory%\%current_year%
  goto open
)

:benchmark1
set month-num=%date:~3,2%
IF "%month-num:~0,1%"=="0" SET month-num=%month-num:~1%
FOR /f "tokens=%month-num%" %%a in ("jan feb mar apr may jun jul aug sep oct nov dec") do set mo-name=%%a
:finis
if %month-num% lss 10 set month-num=0%month-num%

set current_month=%month-num%-%mo-name%
IF NOT EXIST %requirement_base_directory%\%current_year%\%current_month% (
  mkdir %requirement_base_directory%\%current_year%\%current_month%
)

if "%1" == "" (
  goto benchmark2
)
if %1 == m (
  set custom_path=%requirement_base_directory%\%current_year%\%current_month%
  goto open
)

:benchmark2
set /p requirement_name=Enter Requirement name: 
IF NOT EXIST %requirement_base_directory%\%current_year%\%current_month%\%requirement_name% (
  mkdir %requirement_base_directory%\%current_year%\%current_month%\%requirement_name%
) ELSE (
	ECHO ERROR: Directory already exists.
	GOTO exit
)
set custom_path=%requirement_base_directory%\%current_year%\%current_month%\%requirement_name%
echo Requirement on %date%>> %custom_path%\metadata.txt

for /f "delims=. tokens=1,2" %%G in (%files_dir%\bdes.txt) do (
	set bde[%%G]=%%H
	call echo %%G. %%H
)
set /p requirement_sender=Requirement sent by: 

echo Requirement from !bde[%requirement_sender%]!>> %custom_path%\metadata.txt

for /f "delims=. tokens=1,2" %%J in (%files_dir%\channels.txt) do (
	set sharing_channel[%%J]=%%K
	call echo %%J. %%K
)
set /p channel_used=Shared via: 

echo Shared via !sharing_channel[%channel_used%]!>> %custom_path%\metadata.txt

:open
%SystemRoot%\explorer.exe %custom_path%

:exit