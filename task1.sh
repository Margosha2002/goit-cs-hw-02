#!/bin/bash

# Масив з URL вебсайтів для перевірки
websites=(
    "https://www.google.com"
    "https://www.facebook.com"
    "https://www.twitter.com"
)

# Ім'я файлу логів
log_file="website_status.log"

# Перевірка доступності кожного сайту та запис результатів у файл
for website in "${websites[@]}"; do
    # Виконання запиту з використанням curl та отримання статусного коду
    status_code=$(curl -s -o /dev/null -L -w "%{http_code}" "$website")

    echo $status_code
    
    # Визначення статусу сайту (UP або DOWN) залежно від статусного коду
    if [ "$status_code" == "200" ]; then
        echo "$website is UP" >> "$log_file"
    else
        echo "$website is DOWN" >> "$log_file"
    fi
done

# Вивід повідомлення про запис результатів у файл
echo "Результати записано у файл логів $log_file"
