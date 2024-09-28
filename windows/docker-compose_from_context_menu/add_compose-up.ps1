# Определение пути реестра в пользовательском контексте (HKCU)
$registryPath = "HKCU:\Software\Classes\Directory\Background\shell\DockerComposeUp"

# Проверка, существует ли раздел, если нет — создаём
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Установка отображаемого текста для контекстного меню
Set-ItemProperty -Path $registryPath -Name "(Default)" -Value "Run Docker Compose Up"

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

# Команда для запуска docker-compose up -d
$command = 'cmd.exe /k "cd /d %V && docker-compose up -d"'
Set-ItemProperty -Path $commandPath -Name "(Default)" -Value $command

Write-Host "Пункт 'Run Docker Compose Up' успешно добавлен в контекстное меню."
