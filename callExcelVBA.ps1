param (
    $fileExcelVBA,
    $funcVBA,
    $fileCsv,
    $fileOut
)

$xlsApp = New-Object -comobject Excel.Application  
$xlsApp.Visible = $false
$xlsBookVBA = $xlsApp.Workbooks.open($fileExcelVBA)
$xlsApp.Run($funcVBA, $fileCsv, $fileOut)
$xlsApp.Quit()
