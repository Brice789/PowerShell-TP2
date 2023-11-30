# Question 03 - Manipulating Text Files and ConvertToHtml
# You have been hired by a company to streamline internal processes. This company
# operates an e-book platform and they need to organize some Alexandre Dumas
# books. 
#Create a script that manipulates the text files present in books.zip file and
# produce a new HTML file for all txt files, inside a folder named Alexandre Dumas , with
# filenames equal to the each booktitle (Ex.: Le comte de Monte-Cristo.html ).
# NOTE: the book title names are inside each .txt file. 


#Kireche Brice

#Please, create a file Alexandre Dumas in the same folder as the script
#Please, provide a file books.zip or book in the same folder as the script

# Extract books.zip to a temporary folder
$zipPath = ".\books.zip"
$tempFolder = ".\temp_books"

#Can do with the dizip file too without this cmd 
Expand-Archive -Path $zipPath -DestinationPath $tempFolder

# Alexandre Dumas 
$destFolder = ".\Alexandre Dumas"

# Convert each text file to HTML :)
Get-ChildItem -Path $tempFolder -Filter *.txt | ForEach-Object {
    $textContent = Get-Content -Path $_.FullName
    $bookTitle = $textContent[0].Trim() 
    $htmlContent = "<html><body><pre>$($textContent -join "`n")</pre></body></html>"
    $htmlFilePath = Join-Path $destFolder "$bookTitle.html"
    $htmlContent | Out-File -FilePath $htmlFilePath
}


Remove-Item -Path $tempFolder -Recurse -Force



