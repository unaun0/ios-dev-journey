/*
Тема: Функции

Задание: 
    Напиши функцию, которая принимает массив чисел и возвращает два значения:
      -  сумму всех элементов,
      -  среднее арифметическое.
*/

func sumElems(_ arr: [Int]) -> Int {
    var sum = 0
    for elem in arr {
        sum += elem
    }
    return sum
}

func avgElems(_ arr: [Int]) -> Double {
    if arr.count == 0 {
        return 0
    }
    return Double(sumElems(arr)) / Double(arr.count)
}

let arr = [5, 4, 3, -10, 2, -2, 1, 10]
print("ARR: \(arr)")
print("SUM: \(sumElems(arr))")
print("AVG: \(avgElems(arr))")