/*
Создать консольное приложение 
для вычисления периметра трапеции на основе введённых пользователем значений: 
двух параллельных сторон (оснований) и высоты.
*/

import Foundation // это один из основных фреймворков (библиотек)
/*
Что включает в себя Foundation:
    1. Математические функции.
    2. Работа с датами и временем:
        Date — структура для представления времени и даты.
        Calendar, DateFormatter и другие классы для манипуляций с датами.
    3.Коллекции и управление данными:
        Стандартные коллекции (массивы, множества, словари).
        Классы для работы с текстами, такие как NSString, NSMutableString, 
        а также структуры типа Data для работы с двоичными данными.
    4.Работа с файлами и директориями:
        Классы для работы с файлами, такими как FileManager, для чтения и записи данных.
    5.Сетевые запросы и взаимодействие:
        URLSession для работы с HTTP-запросами и взаимодействия с веб-ресурсами.
    6.Обработка ошибок и исключений:
        Классы и функции для работы с ошибками и исключениями, например, NSError.
*/

func readDoubleInput(prompt: String) -> Double? {
    print(prompt)
    if let input = readLine(), let value = Double(input) {
        return value
    } else {
        print("Invalid input. Please enter a valid number.")
        return nil
    }
}

/*
guard — это ключевое слово, используемое для проверки условий. 
Оно позволяет выйти из текущего блока кода (например, функции, метода или цикла) 
при невыполнении условия, обеспечивая, 
что дальнейший код будет выполняться только при соблюдении условия.
*/
guard 
    let baseA = readDoubleInput(prompt: "Enter the base of the trapezoid (A):"),
    let baseB = readDoubleInput(prompt: "Enter the other base of the trapezoid (B):"),
    let height = readDoubleInput(prompt: "Enter the height of the trapezoid:"),
    baseA > 0.0, baseB > 0.0, height > 0.0
else {
    print("Failed to get valid inputs. Exiting program...")
    exit(1)
}

let side = sqrt(pow((baseB - baseA) / 2, 2) + pow(height, 2))
let perimeter = baseA + baseB + 2 * side

print(String(format: "The perimeter of the trapezoid is %.6f", perimeter))