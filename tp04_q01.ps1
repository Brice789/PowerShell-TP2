# Question 01 - Report with Get-Process :

# Create a script named x tp04_q01.ps1 , which receives an input parameter of the
# number of listed processes ( nP ), that creates a folder named Processes and save
# the full report (using Get-Process nomProcess | Format-List * command) of the top nP
# processes ordered by the Process ID Number (the nP processes with the greater ID
# Number). 

#Each process report text file must be saved in the Processes folder, with
# filename containing the PID and the name of process. Ex.: chrome_12345.txt
# NOTE:
# 1. The script must clear all existing files in Processes folder in every execution.
# 2. The minimum number of processes to be listed is 5. If the user provided nP less
# than 5, the script mut replace this value with 5. 



#Kireche Brice


param (
    [int]$nP = 5
)

# Assurez-vous que nP est au moins 5
$nP = [Math]::Max($nP, 5)

# Créez le répertoire Processes s'il n'existe pas
$processDir = ".\Processes"
if (!(Test-Path $processDir)) {

    New-Item -ItemType Directory -Path $processDir
}

# Effacer les fichi ers existants dans le répertoire Processus
Get-ChildItem -Path $processDir -Filter *.txt | Remove-Item

#like in previous exercise, we can use the -First parameter of Select-Object to get the top nP processes
$processes = Get-Process | Sort-Object ID -Descending | Select-Object -First $nP

foreach ($process in $processes) {
    $fileName = "$($process.ProcessName)_$($process.Id).txt"
    $filePath = Join-Path $processDir $fileName
    

    $process | Format-List * | Out-File -FilePath $filePath
}