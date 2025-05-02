$jsonFilePath = "..\myApp.Tests\reports\coverage.cobertura.json"

# Leer el contenido JSON
$jsonContent = Get-Content -Path $jsonFilePath -Raw

# Parsear JSON
$jsonObject = $jsonContent | ConvertFrom-Json

# Asumimos que la tasa de cobertura está en una propiedad tipo:
# $jsonObject.coverage.lineRate o similar — adapta esto según tu JSON real
[float]$lineRate = $jsonObject.coverage.'line-rate'

[int32]$rate = $lineRate * 100

If ($lineRate -lt 0.8) {
    Throw "Lines rate coverage is less than $rate%"
} else {
    Write-Host "Lines rate coverage is $rate%"
    exit 0
}
