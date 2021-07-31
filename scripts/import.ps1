param ($path)

$ErrorActionPreference = "Stop"

Get-ChildItem -Path $path ".latest*" | Remove-Item

$csvs = Get-ChildItem *_Converted.csv -Path $path

:csv foreach ($csv in $csvs) {
    Write-Host $csv.FullName
    $rule = Read-Host "Choose a rule: [1 CMB Credit] [2 CMB Debit] [3 Sodexo] [4 CGB] [5 CMBC]"
    $rf = Switch ($rule)
	{
        1 { "rules\CMB Credit.rules" }
        2 { "rules\CMB Debit.rules" }
        3 { "rules\sodexo.rules" }
        4 { "rules\CGB.rules" }
        5 { "rules\CMBC.rules" }
        default { continue csv }
    }

    hledger import $csv.FullName --rules-file $rf -I
}

$csvs = Get-ChildItem sodexo.csv -Path $path

:csv foreach ($csv in $csvs) {
    Write-Host $csv.FullName
    $rule = Read-Host "Choose a rule: [1 CMBC] [2 CMBD] [3 Sodexo] [4 CGB] [5 CMBC]"
    $rf = Switch ($rule)
	{
        1 { "rules\CMB Credit.rules" }
        2 { "rules\CMB Debit.rules" }
        3 { "rules\sodexo.rules" }
        4 { "rules\CGB.rules" }
        5 { "rules\CMBC.rules" }
        default { continue csv }
    }

    hledger import $csv.FullName --rules-file $rf -I
}

Write-Host 'Complete Importing ... '

Pause