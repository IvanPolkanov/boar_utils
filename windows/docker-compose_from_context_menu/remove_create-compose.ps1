# Определение пути реестра в пользовательском контексте (HKCU)
$registryPath = "HKCU:\Software\Classes\Directory\Background\shell\CreateComposeFile"

# Проверка, существует ли раздел, если да — удаляем
if (Test-Path $registryPath) {
    Remove-Item -Path $registryPath -Recurse
    Write-Host "Пункт 'Create Docker Compose File' успешно удалён из контекстного меню."
} else {
    Write-Host "Пункт 'Create Docker Compose File' не найден."
}
