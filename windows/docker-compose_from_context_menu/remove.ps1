# Определение пути реестра для удаления пункта контекстного меню
$registryPath = "HKCU:\Software\Classes\Directory\Background\shell\DockerComposeUp"

# Проверка, существует ли путь
if (Test-Path $registryPath) {
    # Удаление раздела и всех его вложенных разделов
    Remove-Item -Path $registryPath -Recurse
    Write-Host "Пункт 'Docker Compose Up' был удалён из контекстного меню."
} else {
    Write-Host "Пункт 'Docker Compose Up' не найден."
}
