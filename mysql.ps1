using namespace MySql.Data.MySqlClient

$driver = "C:\Users\Trevor\Downloads\mysql-connector-net-6.10.4-noinstall\v4.5.2\MySql.Data.dll"
$query = "SELECT * FROM information_schema.ENGINES order by ENGINE asc"
$server = "localhost"
$db = "mysql"
$usr = "root"
$pwd = "root"

[void][Reflection.Assembly]::LoadFrom($driver)

Try {
    [MySqlConnection] $conn = New-Object MySqlConnection "Server=$server;User=$usr;Database=$db;Password=$pwd"
    $conn.Open()

    [MySqlCommand] $cmd = New-Object MySqlCommand ($query, $conn)
    [MySqlDataReader] $dr = $cmd.ExecuteReader()

    while ($dr.Read()) {
        Write-Host $dr["ENGINE"]
    }
}
Catch {
  Write-Host "ERROR : Unable to run query : $query"
}
Finally {
  $conn.Close()
}