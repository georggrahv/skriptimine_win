# Kasutajate Fail
$fail = "C:\Users\Administrator\Documents\skriptimine\adkasutajad2.csv"
# Importimine
$kasutajad = Import-Csv $fail -Encoding Default -Delimiter ";"
#
foreach ($kasutaja in $kasutajad){
    $kasutajanimi = $kasutaja.FirstName + "." + $kasutaja.LastName
    $kasutajanimi = $kasutajanimi.ToLower()
    $kasutajanimi = TransLit($kasutajanimi)
    #
    $upname = $kasutajanimi + "@sv-kool.local"
    #
    $ErrorActionPreference = "SilentlyContinue"
    #
    # Import System.Web assembly
    Add-Type -AssemblyName System.Web
    #
    $Password = [System.Web.Security.Membership]::GeneratePassword(8,2)
    #
    $displayname = $kasutaja.FirstName + " " + $kasutaja.LastName
    New-ADUser -Name $kasutajanimi `
        -DisplayName $displayname `
        -GivenName $kasutaja.FirstName `
        -Surname $kasutaja.LastName `
        -Department $kasutaja.Department `
        -Title $kasutaja.Role `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true
    if (!$?)
    {
    echo "Kasutaja $kasutajanimi on juba olemas"
    }
    else
    {
    echo "Kasutaja $kasutajanimi on loodud edukalt!"
    $kasutajanimi + ";" + $Password | Out-File -Append -FilePath C:\Users\Administrator\Documents\skriptimine\kasutajanimi.csv
    }
}
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