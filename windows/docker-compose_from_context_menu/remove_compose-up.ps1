# Определение пути реестра в пользовательском контексте (HKCU)
$registryPath = "HKCU:\Software\Classes\Directory\Background\shell\DockerComposeUp"

# Проверка, существует ли раздел, если да — удаляем
if (Test-Path $registryPath) {
    Remove-Item -Path $registryPath -Recurse
    Write-Host "Пункт 'Run Docker Compose Up' успешно удалён из контекстного меню."
} else {
    Write-Host "Пункт 'Run Docker Compose Up' не найден."
}
