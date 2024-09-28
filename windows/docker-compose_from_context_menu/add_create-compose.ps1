# Определение пути реестра в пользовательском контексте (HKCU)
$registryPath = "HKCU:\Software\Classes\Directory\Background\shell\CreateComposeFile"

# Проверка, существует ли раздел, если нет — создаём
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Установка отображаемого текста для контекстного меню
Set-ItemProperty -Path $registryPath -Name "(Default)" -Value "Create Docker Compose File"

# Добавление иконки (если требуется)
$iconPath = "$PSScriptRoot\Icon.ico"
if (Test-Path $iconPath) {
    Set-ItemProperty -Path $registryPath -Name "Icon" -Value $iconPath
}

# Создание раздела для команды, если его ещё нет
$commandPath = "$registryPath\command"
if (-not (Test-Path $commandPath)) {
    New-Item -Path $commandPath -Force
}

# Команда для создания compose файла из буфера обмена (без открытия консоли)
$command = 'powershell.exe -WindowStyle Hidden -Command "$path = ''%V\\docker-compose.yml''; Get-Clipboard | Out-File -FilePath $path"'
Set-ItemProperty -Path $commandPath -Name "(Default)" -Value $command

Write-Host "Пункт 'Create Docker Compose File' успешно добавлен в контекстное меню."
