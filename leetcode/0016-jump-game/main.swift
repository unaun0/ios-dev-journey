// Вам дан массив целых чисел nums. Вы начинаете с первого индекса массива, 
// и каждый элемент массива представляет максимальную длину прыжка с этой позиции.
// Верните true, если вы можете достичь последнего индекса, и false в противном случае.
//
// Пример 1:
// Входные данные: nums = [2, 3, 1, 1, 4]
// Выходные данные: true
// Объяснение:
// Прыгаем на 1 шаг с индекса 0 на индекс 1.
// Затем прыгаем на 3 шага с индекса 1 на последний индекс (4).
//
// Пример 2:
// Входные данные: nums = [3, 2, 1, 0, 4]
// Выходные данные: false
// Объяснение:
// Как бы вы ни прыгали, вы всегда окажетесь на индексе 3.
// Максимальная длина прыжка с индекса 3 равна 0, поэтому достичь последнего индекса невозможно.
//
// Ограничения:
//
// 1 <= nums.length <= 10^4
// 0 <= nums[i] <= 10^5
//
// Формулировка задачи простыми словами:
// Вы начинаете с начала массива и можете прыгать на любое количество шагов 
// от 1 до значения nums[i] на текущей позиции. Нужно определить, можно ли допрыгать до конца массива.

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxReach = 0
        for i in 0..<nums.count {
            if i > maxReach { return false }
            maxReach = max(maxReach, i + nums[i])
            if maxReach >= nums.count - 1 { return true }
        }
        return true
    }
}

/*
Жадный алгоритм (Greedy Algorithm) — это алгоритм, который на каждом шаге принимает 
локально оптимальное решение в надежде, что в итоге получится глобально оптимальное решение. 
Такой алгоритм не пересматривает предыдущие выборы и не заглядывает далеко вперёд, 
а действует по принципу «выбирай лучшее здесь и сейчас».
*/
