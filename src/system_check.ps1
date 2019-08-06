﻿
function Show-Menu
{
    param(
        [string]$Title = 'My Menu'
    )
    cls
    Write-Host "================ $Testing ================"

     Write-Host "1: Is the domain reachable?"
     Write-Host "2: OS info."
     Write-Host "3: Check disk space"
     Write-Host "4: Check Bitlocker Status"
     Write-Host "5: Placeholder"
     Write-Host "6: Placeholder"
     Write-Host "7: Placeholder"
     Write-Host "Q: Press 'Q' to quit."
}

function Run-Menu
{
do{ 
    Show-Menu
    $input = Read-Host "Please make a selection"
    switch ($input){
    '1'{
        cls
        'You chose option #1'
        Domain-Check
    } 
    '2'{
        cls
        'You chose option #2'
        Hostname
    } 
    '3'{
        cls
        'You chose option #3'
        Check-Diskspace
    }  
    '4'{
        cls
        'You chose option #4'
        Check-Encryption             
    }
    '5'{
                        
    }           
    '6'{
        
    }  
    '7'{
            
    } 
    'q'{
        return
}
    default{
        cls
        'Please enter 1-7'
    }
}
    pause
  }
    until ($input -eq 'q')
}

##Functions
Function Domain-Check{
##you can put your company's domain info here
    Test-ComputerSecureChannel -Server "test.domain" 
    if ('True'){
        'You can reach our domain!'
    } 
    Else{
        'Cannot reach it :('
    }
}

Function Hostname{
    (Get-CimInstance win32_operatingsystem).name
    (Get-CimInstance Win32_OperatingSystem).OSArchitecture
    (Get-CimInstance Win32_OperatingSystem).CSName
}

Function Check-Diskspace{
    (Get-CimInstance -Class Win32_logicaldisk -Filter "DriveType = '3'" | Select-Object -Property DeviceID, DriveType, VolumeName, 
    @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}},
    @{L="Capacity";E={"{0:N2}" -f ($_.Size/1GB)}})
}

Function Check-Encryption{
    (Get-BitLockerVolume -MountPoint "C:")
}

fun 
Run-Menu