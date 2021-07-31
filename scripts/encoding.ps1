param ($path)

$ErrorActionPreference = "Stop"

$csvs = Get-ChildItem *.csv -Path $path

foreach ($csv in $csvs) {
    if ($csv.Name -match "sodexo") {
        continue
    }
    if ($csv.Name -match "_converted.csv") {
        continue
    }
    $newName = $csv.FullName -replace ".csv", "_converted.csv"
    [System.IO.File]::WriteAllBytes($newName, [System.Text.Encoding]::Convert([System.Text.Encoding]::GetEncoding('GB18030'), [System.Text.Encoding]::UTF8, [System.IO.File]::ReadAllBytes($csv.FullName)))
}

Write-Host 'Complete Conversion ... '

Pause