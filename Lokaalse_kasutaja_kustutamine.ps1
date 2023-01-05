$eesnimi = Read-Host "Sisesta oma eesnimi"
$perekonnanimi = Read-Host "Sisesta oma perekonnanimi"
New-LocalUser "$eesnimi.ToLower().$perekonnanimi.ToLower()" -Password $KasutajaParool -FullName "$eesnimi $perekonnanimi"