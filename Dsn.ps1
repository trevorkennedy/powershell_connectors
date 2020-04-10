$dsn = "Northwind"
Add-OdbcDsn -Name $dsn -DriverName "Microsoft Access Driver (*.mdb)" -DsnType "User" -Platform "32-bit" -SetPropertyValue "Dbq=$file"
Remove-OdbcDsn -Name $dsn -DsnType "User" -Platform "32-bit"