/*
Тема: Управление потоком

Задание: 
    Напиши программу, которая генерирует случайное число от 1 до 100 и 
    просит пользователя угадать его, используя while или repeat-while. 
    Подсказывай пользователю, больше или меньше его число.
*/

let randomNumber = Int.random(in: 0...100)
var answerNumber: Int = -1
while answerNumber != randomNumber {
    print("Угадайте число от 1 до 100")
    answerNumber = Int(readLine() ?? "-1") ?? -1
    if answerNumber < randomNumber {
        print("Ваше число меньше")
    } else if answerNumber > randomNumber {
        print("Ваше число больше")
    }
}
print("Вы ввели верное число - \(answerNumber)")