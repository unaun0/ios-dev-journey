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