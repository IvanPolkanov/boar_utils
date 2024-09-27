# Определение пути реестра в пользовательском контексте (HKCU)
$registryPath = "HKCU:\Software\Classes\Directory\Background\shell\DockerComposeUp"

# Получение текущей директории, где находятся скрипты
$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Путь к иконке в той же директории
$iconPath = "$currentDir\icon.ico"

# Проверка, существует ли раздел, если нет — создаём
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Установка отображаемого текста для контекстного меню
Set-ItemProperty -Path $registryPath -Name "(Default)" -Value "Run Docker Compose Up"

# Добавление иконки для пункта контекстного меню
# Иконка из текущей директории, где находятся скрипты
Set-ItemProperty -Path $registryPath -Name "Icon" -Value $iconPath

# Создание раздела для команды, если его ещё нет
$commandPath = "$registryPath\command"
if (-not (Test-Path $commandPath)) {
    New-Item -Path $commandPath -Force
}

# Установка команды для выполнения через cmd.exe
# %V - это специальная переменная для передачи пути к текущей директории
$command = 'cmd.exe /k "cd /d %V && docker-compose up -d"'
Set-ItemProperty -Path $commandPath -Name "(Default)" -Value $command

Write-Host "Пункт 'Run Docker Compose Up' с иконкой успешно добавлен в контекстное меню."
