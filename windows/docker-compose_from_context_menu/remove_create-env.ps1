# Определение пути реестра в пользовательском контексте (HKCU)
$registryPath = "HKCU:\Software\Classes\Directory\Background\shell\CreateEnvFile"

# Проверка, существует ли раздел, если да — удаляем
if (Test-Path $registryPath) {
    Remove-Item -Path $registryPath -Recurse
    Write-Host "Пункт 'Create env File' успешно удалён из контекстного меню."
} else {
    Write-Host "Пункт 'Create env File' не найден."
}
