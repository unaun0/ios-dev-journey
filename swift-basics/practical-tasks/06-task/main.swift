/*
Тема: Замыкания

Задание: 
    Напиши программу, которая использует замыкание для фильтрации четных чисел из массива.
*/

func filterEvenNumbers(_ arr: [Int]) -> [Int] {
    return arr.filter({ $0 % 2 == 0 })
}

var arr = [1, 2, 3, 4, 5, 6]
print(filterEvenNumbers(arr))