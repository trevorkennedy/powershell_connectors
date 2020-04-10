$driver = "C:\Users\Trevor\Downloads\Npgsql-2.2.3-net45\Npgsql.dll"
$connString = "Server=localhost;User Id=postgres;Database=postgres;Password=sk1dm4rk"
$query = "SELECT * FROM pg_catalog.pg_database;"

[Reflection.Assembly]::LoadFrom($driver) | out-null

[Npgsql.NpgsqlConnection] $conn = new-object Npgsql.NpgsqlConnection $connString
$conn.Open()

[Npgsql.NpgsqlCommand] $cmd = New-Object Npgsql.NpgsqlCommand ($query, $conn)
[Npgsql.NpgsqlDataReader] $dr = $cmd.ExecuteReader()

while ($dr.Read()) {
    Write-Host $dr[0]
}

$conn.Close()