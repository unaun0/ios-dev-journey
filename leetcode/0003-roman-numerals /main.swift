/// Конвертирует число в римской записи в целое число
///
/// Римские цифры представляются семью символами:
/// I = 1, 
/// V = 5, 
/// X = 10, 
/// L = 50,
/// C = 100, 
/// D = 500,
/// M = 1000
///
/// Основные правила:
/// 1. Обычно цифры записываются от больших к меньшим слева направо
/// 2. Если меньшая цифра стоит перед большей, она вычитается (IV = 4, IX = 9)
///
/// Особые случаи вычитания:
/// - I перед V (4) или X (9)
/// - X перед L (40) или C (90)
/// - C перед D (400) или M (900)
///
/// Примеры:
/// convertRomanToInt("III") → 3
/// convertRomanToInt("LVIII") → 58
/// convertRomanToInt("MCMXCIV") → 1994
///
/// - Parameter s: Строка с римским числом
/// - Returns: Соответствующее целое число

class Solution {
    func romanToInt(_ str: String) -> Int {
        let nums: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var prev = 0
        var num = 0
        for s in str {
            let t = nums[s] ?? 0
            num += t + ((prev < t) ? (-prev * 2) : 0)
            prev = t
        }
        return num
    }
}

let solution = Solution()

func runRomanTest(_ input: String, expected: Int) {
    let result = solution.romanToInt(input)
    let status = result == expected ? "✅ PASSED" : "❌ FAILED"
    
    print("""
    \(status)
    Input: "\(input)"
    Expected: \(expected)
    Result: \(result)
    """)
}

runRomanTest("III", expected: 3)
runRomanTest("IV", expected: 4)
runRomanTest("IX", expected: 9)
runRomanTest("LVIII", expected: 58)
runRomanTest("MCMXCIV", expected: 1994)
runRomanTest("CDXLIV", expected: 444)
runRomanTest("MMMCMXCIX", expected: 3999)
runRomanTest("I", expected: 1)
runRomanTest("MMM", expected: 3000)
runRomanTest("XLIX", expected: 49)