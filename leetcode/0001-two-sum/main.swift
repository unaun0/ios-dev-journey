/// Даны массив целых чисел `nums` и целое число `target`, необходимо вернуть индексы двух чисел таких, что их сумма равна `target`.
/// Можно предположить, что для каждого набора входных данных существует ровно одно решение,
/// и нельзя использовать один и тот же элемент дважды.
/// Ответ можно вернуть в любом порядке.
///
/// Пример 1:
///
/// Вход: nums = [2,7,11,15], target = 9
/// Выход: [0,1]
/// Пояснение: Поскольку nums[0] + nums[1] == 9, возвращаем [0, 1].
///
/// Пример 2:
///
/// Вход: nums = [3,2,4], target = 6
/// Выход: [1,2]
///
/// Пример 3:
///
/// Вход: nums = [3,3], target = 6
/// Выход: [0,1]
///
/// Ограничения:
///
/// - 2 <= nums.length <= 104
/// - -109 <= nums[i] <= 109
/// - -109 <= target <= 109
/// - Существует только один верный ответ.
///
/// Дополнительно: Можете ли вы предложить алгоритм со сложностью менее O(n^2)?

import Foundation

class Solution {

    // Решение 1 - два цикла 

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let len = nums.count
        for i in 0..<(len - 1) {
            for j in (i + 1)..<len {
                if nums[i] + nums[j] == target { return [i, j] }
            }
        }
        return []
    }

    // Решение 2 - словарь и один цикл
    
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            let diff = target - num
            if let j = dict[diff] {
                return [j, i]
            }
            if dict[num] == nil {
                dict[num] = i
            }
        }
        return []
    }
}

let solution = Solution()

func runTest(name: String, nums: [Int], target: Int, expected: [Int]) {
    let startTime1 = DispatchTime.now()
    let result1 = solution.twoSum(nums, target)
    let endTime1 = DispatchTime.now()
    let nanoTime1 = endTime1.uptimeNanoseconds - startTime1.uptimeNanoseconds
    let time1 = Double(nanoTime1) / 1_000_000

    let startTime2 = DispatchTime.now()
    let result2 = solution.twoSum2(nums, target)
    let endTime2 = DispatchTime.now()
    let nanoTime2 = endTime2.uptimeNanoseconds - startTime2.uptimeNanoseconds
    let time2 = Double(nanoTime2) / 1_000_000
    
    print("🧪 Тест: \(name)")
    print("Вход: \(nums.count > 10 ? "массив из \(nums.count) элементов" : "\(nums)"), target: \(target)")
    print("Ожидаемый результат: \(expected)")
    
    print("twoSum результат: \(result1) \(result1 == expected ? "✅" : "❌")")
    print("Время выполнения: \(String(format: "%.4f", time1)) мс")
    
    print("twoSum2 результат: \(result2) \(result2 == expected ? "✅" : "❌")")
    print("Время выполнения: \(String(format: "%.4f", time2)) мс")
    
    if time1 > 0 && time2 > 0 {
        let ratio = time1/time2
        print("Отношение скоростей: twoSum2 быстрее в \(String(format: "%.1f", ratio)) раз")
    }
    if result1 != expected || result2 != expected {
        print("!!! ТЕСТ НЕ ПРОЙДЕН !!!")
    }
}

runTest(name: "Базовый случай", 
        nums: [2, 7, 11, 15], 
        target: 9, 
        expected: [0, 1])
runTest(name: "Элементы в середине", 
        nums: [3, 2, 4], 
        target: 6, 
        expected: [1, 2])
runTest(name: "Два одинаковых элемента", 
        nums: [3, 3], 
        target: 6, 
        expected: [0, 1])
runTest(name: "Отрицательные числа", 
        nums: [-1, -2, -3, -4], 
        target: -6, 
        expected: [1, 3])
runTest(name: "Положительные и отрицательные", 
        nums: [-1, 2, 5, -3], 
        target: 1, 
        expected: [0, 1])
runTest(name: "Минимальный массив", 
        nums: [1, 1], 
        target: 2, 
        expected: [0, 1])
runTest(name: "Большой массив", 
        nums: Array(1...10000), 
        target: 19999, 
        expected: [9998, 9999])
runTest(name: "Нули в массиве", 
        nums: [0, 4, 3, 0], 
        target: 0, 
        expected: [0, 3])

print("\nВсе тесты выполнены!")