param (
	[String]$root,
    [String]$output = "list"
)

$csv_array = @("dir1,dir2,name,updated,path")
# $files = ls $root -Include *.mp3, *.m4a -Recurse
$files = ls $root -Recurse | ? {-not $_.PSIsContainer}
foreach ($file in $files) {
	$name = $file.name
    $update = $file.LastWriteTime.ToString("yyyy/MM/dd")
	$parentdir1 = Split-Path $file.fullname -Parent
	$parentdirname1 = Split-Path $parentdir1 -Leaf
	$parentdir2 = Split-Path $parentdir1 -Parent
	$parentdirname2 = Split-Path $parentdir2 -Leaf
	$csv_array += "`"$parentdirname2`"" + "," + "`"$parentdirname1`"" + "," + "`"$name`"" + "," + "`"$update`"" + "," + "`"$parentdir1`""
}

# $suffix = get-date -Format yyyyMMdd.hhss
# if ($output -match "\.") {
#     $output = $output -replace "\.[^\.]+$", ".$suffix.csv"
# } else {
#     $output += ".$suffix.csv"
# }

$csv_array | Out-File $output -Encoding default
