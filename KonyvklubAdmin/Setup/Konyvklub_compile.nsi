!define regPath "Software\Microsoft\Windows\CurrentVersion\Uninstall\KonyvklubAdmin"
!define appName "K${U+00F6}nyvklub - Admin"
!define fileName "KonyvklubAdmin"
!define iconName "icon.ico"

Unicode true
Name "${appName}"
Outfile "${fileName}_Install.exe"
InstallDir "C:\Program Files\${fileName}"
Icon "${iconName}"
UninstallIcon "${iconName}"

Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "Main"
    SetOutPath $INSTDIR
    File /a /r "..\KonyvklubAdmin\bin\Release\net6.0-windows\"
    CreateShortCut "$DESKTOP\${appName}.lnk" "$INSTDIR\${fileName}.exe"
    WriteUninstaller $INSTDIR\KonyvklubAdmin_Uninstall.exe
    WriteRegStr HKLM "${regPath}" "DisplayName" "${appName}"
    WriteRegStr HKLM "${regPath}" "DisplayVersion" "1.2.1"
    WriteRegStr HKLM "${regPath}" "DisplayIcon" "$INSTDIR\${fileName}.exe"
    WriteRegStr HKLM "${regPath}" "Publisher" "TA - NV"
    WriteRegStr HKLM "${regPath}" "UninstallString" "$\"$INSTDIR\${fileName}_Uninstall.exe$\""
SectionEnd

!define NETVersion "6.0.11"
!define NETInstaller "windowsdesktop-runtime-6.0.11-win-x64.exe"
Section "MS .NET Framework v${NETVersion}" SecFramework
    IfFileExists "C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App\${NETVersion}" NETFrameworkInstalled 0
    File /oname=$TEMP\${NETInstaller} ${NETInstaller}

    DetailPrint "Installing Microsoft .NET Framework v${NETVersion}..."
    ExecWait "$TEMP\${NETInstaller}"
    DetailPrint "Microsoft .NET Framework v${NETVersion} installed successfully!"
    Return

    NETFrameworkInstalled:
    DetailPrint "Microsoft .NET Framework is already installed!"
SectionEnd

Section "Uninstall"
    Delete $INSTDIR\KonyvklubAdmin_Uninstall.exe
    Delete "$DESKTOP\${appName}.lnk"
    RMDir /r $INSTDIR
    DeleteRegKey HKLM "${regPath}"
SectionEnd
