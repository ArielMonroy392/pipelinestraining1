$reportPath = "..\myApp\reports\report"

# Leer el contenido JSON
$jsonContent = Get-Content -Path $reportPath -Raw

# Parsear como JSON (SARIF)
$sarif = $jsonContent | ConvertFrom-Json

# Extraer los resultados del primer "run"
$issues = $sarif.runs[0].results

# Extraer los niveles de severidad (level)
$issueLevels = $issues | ForEach-Object { $_.level }
$issueMessages = $issues | ForEach-Object { $_.message.text }

# Verificar si hay errores o advertencias
if ($issueLevels -contains "error" -or $issueLevels -contains "warning") {
    Throw ($issueMessages -join "`n")
} else {
    Write-Host "No High Severity Issues Found."
    Write-Host ($issueMessages -join "`n")
    exit 0
}
