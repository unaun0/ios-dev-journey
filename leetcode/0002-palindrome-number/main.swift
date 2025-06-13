/// Проверяет, является ли целое число палиндромом.
///
/// Палиндром - это число, которое читается одинаково
/// как слева направо, так и справа налево.
///
/// - Parameters:
///   - x: Целое число для проверки
/// - Returns: `true`, если число является палиндромом, иначе `false`
///
/// # Примеры:
/// ```
/// isPalindrome(121)   // → true (121 читается одинаково в обе стороны)
/// isPalindrome(-121)  // → false ("-121" != "121-")
/// isPalindrome(10)    // → false ("10" != "01")
/// ```
///
/// # Ограничения:
/// - -2^31 <= x <= 2^31 - 1
///
/// # Дополнительно:
/// Решение без преобразования числа в строку

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x != 0, x % 10 == 0 {
            return false
        }
        var orig = x
        var reversed = 0
        while orig > reversed {
            reversed = reversed * 10 + orig % 10
            orig /= 10
        }
        return orig == reversed || orig == reversed / 10
    }
}

let solution = Solution()

func testPalindrome(_ x: Int, expected: Bool) {
    let result = solution.isPalindrome(x)
    let status = result == expected ? "✅" : "❌"
    print("🧪 Тест для \(x): \(status)\n\t(ожидалось: \(expected), получили: \(result))")
}

testPalindrome(1, expected: true)        // Однозначное число
testPalindrome(11, expected: true)       // Двузначное палиндром
testPalindrome(10, expected: false)      // Двузначное не палиндром
testPalindrome(101, expected: true)      // Трехзначный палиндром
testPalindrome(0, expected: true)        // Ноль
testPalindrome(234, expected: false)     // Трехзначное не палиндром
testPalindrome(-121, expected: false)    // Отрицательное число
testPalindrome(12321, expected: true)    // Нечетное количество цифр
testPalindrome(1221, expected: true)     // Четное количество цифр
testPalindrome(1001, expected: true)     // Палиндром с нулями
testPalindrome(1234321, expected: true)  // Большой палиндром
testPalindrome(Int.max, expected: false) // Максимальное Int
testPalindrome(Int.min, expected: false) // Минимальное Int