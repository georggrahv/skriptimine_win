echo "Sisestage oma eesnimi:"
    $eesnimi = Read-Host
echo "Sisestage oma perenimi:"
    $perenimi = Read-Host
#---------------------------------
$ErrorActionPreference = "SilentlyContinue"
#---------------------------------
$kasutajanimi = $eesnimi + "." + $perenimi
$kasutajanimi = $kasutajanimi.ToLower()
$kasutajanimi = TransLit($kasutajanimi)

Remove-ADUser $kasutajanimi -Confirm:$false 
#--------------------------------
    if (!$?)
    {
    echo "Kasutaja $kasutajanimi ei eksisteeri"
    }
    else
    {
    echo "Kasutaja $kasutajanimi on kustutatud edukalt!"
    }
#--------------------------------
# Täpitähe fix
function Translit {
    param(
        [string] $inputString
    )
    #
        $TransLit = @{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
        }
    #
    $outputString=""
    #
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        if ($TransLit[$character] -cne $Null ){
            $outputString += $TransLit[$character]
        } else {
            $outputString += $character
        }
    }
    write-Output $outputString
}