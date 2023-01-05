# kasutaja andmed käsurea parameetritena
param(
$Kasutajanimi,
$TaisNimi,
$KontoKirjeldus
)
# Määrame kasutajale parooli, konverteerides turvatud tekstiks
$KasutahaParool = ConvertTo-SecureString 'Parool1' -AsPlainText -Force
# Loome kasutaja kasutades loodud parooli
New-LocalUser $Kasutajanimi -Password $KasutahaParool -FullName $TaisNimi -Description $KontoKirjeldus
