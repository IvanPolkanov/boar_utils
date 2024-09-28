# Загрузка сборок для Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Создание формы
$form = New-Object system.Windows.Forms.Form
$form.Text = "Component Installer"
$form.Width = 420  # Увеличиваем ширину формы
$form.Height = 300

# Создание метки
$label = New-Object system.Windows.Forms.Label
$label.Text = "Select a component to install or remove:"
$label.AutoSize = $true
$label.Top = 20
$label.Left = 20
$form.Controls.Add($label)

# Создание чекбоксов для компонентов
$checkBox1 = New-Object system.Windows.Forms.CheckBox
$checkBox1.Text = "Docker Compose Up"
$checkBox1.Top = 60
$checkBox1.Left = 20
$checkBox1.Width = 150  # Расширяем чекбокс
$form.Controls.Add($checkBox1)

$checkBox2 = New-Object system.Windows.Forms.CheckBox
$checkBox2.Text = "Create Compose File"
$checkBox2.Top = 90
$checkBox2.Left = 20
$checkBox2.Width = 150  # Расширяем чекбокс
$form.Controls.Add($checkBox2)

$checkBox3 = New-Object system.Windows.Forms.CheckBox
$checkBox3.Text = "Create Env File"
$checkBox3.Top = 120
$checkBox3.Left = 20
$checkBox3.Width = 150  # Расширяем чекбокс
$form.Controls.Add($checkBox3)

# Создание кнопки для установки
$installButton = New-Object system.Windows.Forms.Button
$installButton.Text = "Install"
$installButton.Top = 170
$installButton.Left = 20
$installButton.Add_Click({
    if ($checkBox1.Checked) { 
        Start-Process -FilePath "add_docker-run.cmd" 
    }
    if ($checkBox2.Checked) { 
        Start-Process -FilePath "add_create-compose.cmd" 
    }
    if ($checkBox3.Checked) { 
        Start-Process -FilePath "add_create-env.cmd" 
    }
    $form.Close()
})
$form.Controls.Add($installButton)

# Создание кнопки для удаления
$removeButton = New-Object system.Windows.Forms.Button
$removeButton.Text = "Remove"
$removeButton.Top = 170
$removeButton.Left = 120
$removeButton.Add_Click({
    if ($checkBox1.Checked) { 
        Start-Process -FilePath "remove_docker-run.cmd" 
    }
    if ($checkBox2.Checked) { 
        Start-Process -FilePath "remove_create-compose.cmd" 
    }
    if ($checkBox3.Checked) { 
        Start-Process -FilePath "remove_create-env.cmd" 
    }
    $form.Close()
})
$form.Controls.Add($removeButton)

# Запуск формы
$form.ShowDialog()
