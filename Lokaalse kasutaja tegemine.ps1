# Määrame kasutajale parooli, konverteerides ruvatud tekstiks
$KasutahaParool = ConvertTo-SecureString 'Parool1' -AsPlainText -Force
# Loome kasutaja kasutades loodud parooli
New-LocalUser "kasutaja" -Password $KasutahaParool -FullName "Esmane tavakasutaja" -Description "Local Account - kasutaja1"
