###set location of csv
$csv = "..."

### set input folder
$source = "..."      

### set output folder
$dest = "..."     

### create array for csvs
$fileName = @()

### position in array
$position = 0

### import csv and create array
Import-Csv $csv\list.csv |
	ForEach-Object {
		$fileName += $_.file
	}

### find length of array
$length = $fileName.count

###copy item from source to destination
for ($i=0; $i -lt $length; $i++) {
	$loopFileName = $fileName[$position]
	$fullFilePath = "$source\$loopFileName"
	Copy-Item $fullFilePath -Destination "$dest"
	$position++
}
