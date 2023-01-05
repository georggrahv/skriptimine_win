$eesnimi = read-host "Sisestage kasutaja eesnimi: "
$eesnimi = $eesnimi
$perenimi = read-host "Sisestage kasutaja perenimi: "
$perenimi = $perenimi
Remove-LocalUser -Name "$eesnimi $perenimi"
if($?)
{   
echo "Kasutaja on edukalt kustutatud."

}
else
{
$ErrorActionPreference = 'SilentlyContinue'
echo "Kasutaja ei eksisteeri või kustutamisel tekkis muu viga, proovige uuesti."
}