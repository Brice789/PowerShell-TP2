# Question 02 - Manipulate CSV Files with Import-Csv :
# You received a table TP04-q2-Teams.csv , in .csv format, with the winning UEFA
# champions league winners since 1980.
# Create a script named tp04_q02.ps1 which receives the input csv table as a
# parameter and saves one output file uefa_cl_report.txt , containing a list of winners
# by country and the list and aggregate count of winning teams. An example of file
# contents is shown below:

#Kireche Brice


# To Run The Code, Please create file in the same folder as the script:
#"TP04-q2-Teams.csv" and "uefa_cl_report.txt"
#Output will be created in the "uefa_cl_report.txt" file and will be displayed in the console
$csvPath = "TP04-q2-Teams.csv"
$outputFile = "uefa_cl_report.txt"

write-host "Code From Brice"
write-host "Reading CSV file from $csvPath"

$a = "Code From Brice"| Out-File -FilePath $outputFile -Append
"Reading CSV file from $csvPath" | Out-File -FilePath $outputFile -Append

# Import the CSV file
$teams = Import-Csv -Path $csvPath

# Count winners -- country
$winnersByCountry = $teams | Group-Object winner_country | Select-Object @{Name="Country";Expression={$_.Name}}, @{Name="Winners";Expression={$_.Count}}

write-host $winnersByCountry + "is the first winner"

# Count wins by team
$winnersByTeam = $teams | Group-Object winner | Select-Object @{Name="Team";Expression={$_.Name}}, @{Name="Wins";Expression={$_.Count}}

# Write to the output file
"Count of winners by country" | Out-File -FilePath $outputFile
$winnersByCountry | ForEach-Object { "- $($_.Country), $($_.Winners) Victories" } | Out-File -FilePath $outputFile -Append

# Just for space....
Add-Content -Path $outputFile -Value ""

"List winning teams" | Add-Content -Path $outputFile
$winnersByTeam | ForEach-Object { "- $($_.Team), $($_.Wins) wins" } | Add-Content -Path $outputFile

# Just for space....
Add-Content -Path $outputFile -Value ""

# $SecondWinner = $teams | Group-Object winner_country | Select-Object @{Name="Country";Expression={$_.Name}}, @{Name="Winners";Expression={$_.Count}},@{Name="second_place";Expression={$_.Count}},@{Name="second_place_country";Expression={$_.Count} }

# "List winning teams that arrived Second" | Add-Content -Path $outputFile
# $SecondWinner | ForEach-Object { "- $($_.Team), $($_.Wins) win(s)" } | Add-Content -Path $outputFile

# Display the output file content
Get-Content -Path $outputFile | Out-Host



# param (
#     [string]$csvPath = ".\TP04-q2-Teams.csv"
# )

# # Read the CSV file
# $winnerlist = Import-Csv -Path $csvPath

# #declare winner Teams and Countries


# # Group and count winners by country and team
# $winnersByCountry = $winnerlist | Group-Object Country | Select-Object Name, @{Name="Wins";Expression={$_.Count}}
# $winnersByTeam = $winnerlist | Group-Object Team | Select-Object Name, @{Name="Wins";Expression={$_.Count}}

# $winnersByCountry
# $winnersByTeam

# for ($i = 0; $i -lt $array.Count; $i++) {
#     <# Action that will repeat until the condition is met #>
#     $NumberofCount = $winnerlist | Group-Object Country | Select-Object Name, @{Name="Wins";Expression={$_.Count}}
# }




# # Output file
# $outputFile = ".\uefa_cl_report.txt"

# # Write to the output file
# "Count of The Teams" | Out-File $outputFile
# $winnersByCountry | ForEach-Object { "- $($_.Name), $($_.Wins) Is" } | Out-File $outputFile -Append






