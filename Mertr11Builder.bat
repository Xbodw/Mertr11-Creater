@echo off
if '%1' equ '/Active:Yes' goto pre
mshta vbscript:createobject("shell.application").shellexecute("%~s0","/Active:Yes","","runas",1^)(window.close^) & exit /b
:pre
cls
setlocal EnableExtensions EnableDelayedExpansion
attrib -s -h -r %cd%
cd /d %~dp0
FOR /F "tokens=2 delims==" %%a IN ('wmic os get OSLanguage /Value') DO set lg=%%a
if %lg% equ 2052 (title Mertr 11ϵͳ������������) else (title Mertr 11 System streamlining Image Marker)
if %lg% equ 2052 (echo Mertr 11 & echo ϵͳ������������) else (echo Mertr 11 & echo  System streamlining Image Marker)
echo By Xbodw.
set "mountp="
if %lg% equ 2052 (set /p mountp=������ISO�����̷�:) else (set /p mountp=Press the ISO Mount Drive:)
if not exist %mountp% (
  if %lg% equ 2052 (
    start /wait "" "mshta.exe" vbscript:CreateObject("Wscript.Shell"^).popup("��Ч��Windows�������������ļ���: %mountp%",7,"Mertr 11ϵͳ������������",48^)(window.close^) 
    goto pre
  ) else (
    start /wait "" "mshta.exe" vbscript:CreateObject("Wscript.Shell"^).popup("Invaild a Drive of The WindowsImage or Dirctory: %mountp%",7,"Mertr 11 System streamlining Image Marker",48^)(window.close^) 
    goto pre
  )
)
if not exist %mountp%\sources\boot.wim (
  if %lg% equ 2052 (
    start /wait "" "mshta.exe" vbscript:CreateObject("Wscript.Shell"^).popup("��Ч��Windows�������������ļ���: %mountp%,��%mountp%\sources���Ҳ���boot.wim",7,"Mertr 11ϵͳ������������",48^)(window.close^) 
    goto pre
  ) else (
    start /wait "" "mshta.exe" vbscript:CreateObject("Wscript.Shell"^).popup("Invaild a Drive of The WindowsImage or Dirctory: %mountp%,Not Found boot.wim in %mountp%\sources",7,"Mertr 11 System streamlining Image Marker",48^)(window.close^) 
    goto pre
  )
)
if not exist %mountp%\sources\install.wim (
  if %lg% equ 2052 (
    start /wait "" "mshta.exe" vbscript:CreateObject("Wscript.Shell"^).popup("��Ч��Windows�������������ļ���: %mountp%,��%mountp%\sources���Ҳ���install.wim,�벻Ҫʹ��esd����",7,"Mertr 11ϵͳ������������",48^)(window.close^) 
    goto pre
  ) else (
    start /wait "" "mshta.exe" vbscript:CreateObject("Wscript.Shell"^).popup("Invaild a Drive of The WindowsImage or Dirctory: %mountp%,Not Found install.wim in %mountp%\sources,Please not use the esd Image",7,"Mertr 11 System streamlining Image Marker",48^)(window.close^) 
    goto pre
  )
)
if not exist MakeDir md MakeDir
if not exist Moud md Moud
xcopy /s /i /e /y /o "%mountp%" MakeDir
cls
if %lg% equ 2052 (title Mertr 11ϵͳ������������) else (title Mertr 11 System streamlining Image Marker)
if %lg% equ 2052 (echo Mertr 11 & echo ϵͳ������������) else (echo Mertr 11 & echo  System streamlining Image Marker)
echo By Xbodw.
dism /Get-WimInfo /WimFile:MakeDir\sources\install.wim
set "index=1"
if %lg% equ 2052 (set /p index=�����뾵������:) else (set /p index=Press The Image Index:)
cls
if %lg% equ 2052 (title Mertr 11ϵͳ������������) else (title Mertr 11 System streamlining Image Marker)
if %lg% equ 2052 (echo Mertr 11 & echo ϵͳ������������) else (echo Mertr 11 & echo  System streamlining Image Marker)
echo By Xbodw.
dism /Mount-Wim /WimFile:MakeDir\sources\install.wim /index:%index% /MountDir:Moud
if %lg% equ 2052 (echo ����ж�س�������޸�ע���... ) else (echo Removeing Packages and Change Registry...)
for /f "tokens=2 delims=:| " %%s in ('dism /Image:Moud /Get-ProvisionedAppxPackages^|Find /i "_"') do (
  echo %%s|Find /i "Microsoft.WindowsStore" && echo off || dism /Image:Moud /Remove-ProvisionedAppxPackage /PackageName:%%s   >nul  2>nul
)
rd "Moud\Program Files (x86)\Microsoft\Edge" /s /q
rd "Moud\Program Files (x86)\Microsoft\EdgeUpdate" /s /q
Reg load HKLM\tSYSTEM "Moud\Windows\System32\config\System" >nul
Reg add "HKLM\tSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\tSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\tSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\tSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\tSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\tSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1
reg unload HKLM\tSYSTEM >nul
cls
if %lg% equ 2052 (title Mertr 11ϵͳ������������) else (title Mertr 11 System streamlining Image Marker)
if %lg% equ 2052 (echo Mertr 11 & echo ϵͳ������������) else (echo Mertr 11 & echo  System streamlining Image Marker)
echo By Xbodw.
dism /UnMount-Wim /MountDir:Moud /commit
dism /Export-Image /SourceImageFile:MakeDir\sources\install.wim /SourceIndex:%index% /DestinationImageFile:MakeDir\sources\install-new.wim
del /f /q MakeDir\sources\install.wim
ren MakeDir\sources\install-new.wim install.wim
rd /s /q Moud
copy /y autounattend.xml MakeDir\sources\autounattend.xml
if exist MakeDir\sources\appraiserres.dll del /f /q MakeDir\sources\appraiserres.dll
isomk.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bMakeDir\boot\etfsboot.com#pEF,e,bMakeDir\efi\microsoft\boot\efisys.bin MakeDir "%cd%\Mertr11.iso"
rd /s /q MakeDir
cls
if %lg% equ 2052 (title Mertr 11ϵͳ������������) else (title Mertr 11 System streamlining Image Marker)
if %lg% equ 2052 (echo Mertr 11 & echo ϵͳ������������) else (echo Mertr 11 & echo  System streamlining Image Marker)
if %lg% equ 2052 (echo ���) else (echo Complate.)
pause