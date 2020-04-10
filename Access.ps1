$query = "select * from Customers"
$file = "C:\Users\Trevor\Documents\Northwind.mdb"
$output = "C:\Users\Trevor\Documents\Northwind.xlsx"

$conn = New-Object System.Data.Odbc.OdbcConnection
$conn.ConnectionString= "Driver={Microsoft Access Driver (*.mdb)};DBQ=$file"
$conn.open()
$cmd = new-object System.Data.Odbc.OdbcCommand($query, $conn)
$da = New-Object System.Data.Odbc.OdbcDataAdapter($cmd)
$dt = New-Object System.Data.DataTable
$da.fill($dt) | out-null
$conn.close()

Write-Host "Rows: " $dt.Rows.Count

# create excel instance here
$excel.Visible = $true
$workbook = $excel.Workbooks.Add()
$sheet= $workbook.Worksheets.Item(1)
$sheet.Name = "Northwind"

$i = 1

foreach($row in $dt.Rows)
{
    $excel.cells.item($i,1) = $row.CustomerID
    $excel.cells.item($i,2) = $row.CompanyName
    $excel.cells.item($i,3) = $row.City
    $i++
} 

#adjusting the column width so all data's properly visible
$usedRange = $sheet.UsedRange
$usedRange.EntireColumn.AutoFit() | Out-Null

$workbook.SaveAs($output)
$excel.Quit()