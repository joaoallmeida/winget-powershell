Write-Output "--- Installation of apps by winget ---"

# Some predefined apps for developers
# To add more apps, just add a new parameter with the app's id. You can get the id using the following command "winget.exe search --name app-name"

$apps = @(
  @{appName = "dbeaver.dbeaver"},
  @{appName = "Discord.Discord"},
  @{appName = "Git.Git"},
  @{appName = "Microsoft.AzureStorageEmulator"},
  @{appName = "Microsoft.WindowsTerminal"},
  @{appName = "Notepad++.Notepad++"},
  @{appName = "OBSProject.OBSStudio"},
  @{appName = "JanDeDobbeleer.OhMyPosh"},
  @{appName = "Postman.Postman"},
  @{appName = "Microsoft.Teams"},  
  @{appName = "RARLab.WinRAR"},
  @{appName = "Microsoft.VisualStudio.2019.Community"},
  @{appName = "WinSCP.WinSCP"},
  @{appName = "Amazon.SAM-CLI"},
  @{appName = "Skillbrains.Lightshot"},
  @{appName = "Microsoft.SQLServerManagementStudio"},
  @{appName = "Microsoft.PowerToys"},
  @{appName = "Microsoft.VisualStudioCode"},
  @{appName = "Google.Chrome"},
  @{appName = "Microsoft.AzureStorageExplaorer"},
  @{appName = "Amazon.AWSCLI"},
  @{appName = "CPUID.CPU-Z"}
  @{appName = "JetBrains.PyCharm.Community"}
  @{appName = "SublimeHQ.SublimeText.4"}
  @{appName = "21090PaddyXu.QuickLook_egxr34yet59cg"}
);

foreach ( $item in $apps ) {

    $instaledAppsList = winget list --exact -q $item.appName

    if ([String]::Join("", $instaledAppsList).Contains($item.appName)) {
        
        Write-Host "Already Installed ->" $item.appName -ForegroundColor Green
    }
    else {
        Write-Host "Installing ->" $item.appName -ForegroundColor Yellow
        winget install -e -h --id $item.appName
    }
}