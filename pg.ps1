$driver = "C:\Users\Trevor\Downloads\Npgsql-2.2.3-net45\Npgsql.dll"
$connString = "Server=localhost;User Id=postgres;Database=test;Password=my_pass"
$query = "INSERT INTO public.customers(id, name) VALUES (2, 'Trevor');"

[Reflection.Assembly]::LoadFrom($driver) | out-null

[Npgsql.NpgsqlConnection] $conn = new-object Npgsql.NpgsqlConnection $connString
$conn.Open()

[Npgsql.NpgsqlCommand] $cmd = New-Object Npgsql.NpgsqlCommand ($query, $conn)
$cmd.ExecuteNonQuery()

$conn.Close()