@echo off
cls
setlocal enabledelayedexpansion
set requirement_base_directory=F:\repo\office\inqueries
set current_year=20%date:~7,4%
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
set current_month_partial=%date:~3,3%
set nbr=0
for %%1 in (Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec) do (
  set /a nbr+=1
  echo %current_month_partial%|findstr /i /b "%%1" >nul&& goto finis
)

:finis
if %nbr% lss 10 set nbr=0%nbr%

set current_month=%nbr%-%current_month_partial%
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
)
set custom_path=%requirement_base_directory%\%current_year%\%current_month%\%requirement_name%

:open
%SystemRoot%\explorer.exe %custom_path%