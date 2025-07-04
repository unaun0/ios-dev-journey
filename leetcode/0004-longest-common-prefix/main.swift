/// Находит наибольший общий префикс среди массива строк
///
/// Алгоритм работает следующим образом:
/// 1. Берем первую строку как исходный префикс
/// 2. Последовательно сравниваем его с каждой следующей строкой
/// 3. Укорачиваем префикс, пока он не станет началом текущей строки
/// 4. Если префикс становится пустым - возвращаем ""
///
/// Примеры:
/// longestCommonPrefix(["flower","flow","flight"]) → "fl"
/// longestCommonPrefix(["dog","racecar","car"]) → ""
///
/// - Parameter strs: Массив строк для поиска общего префикса
/// - Returns: Наибольший общий префикс или пустая строка, если префикса нет

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var pref = strs[0]
        for i in 1..<strs.count {
            let t = strs[i]
            var j = 0
            while j < min(pref.count, t.count) {
                if t[
                    t.index(
                        t.startIndex, 
                        offsetBy: j
                    )
                ] != pref[
                    pref.index(
                        pref.startIndex, 
                        offsetBy: j
                    )
                ] { break }
                j += 1;
            }
            pref = String(
                pref[
                    ..<pref.index(
                        pref.startIndex, 
                        offsetBy: j
                    )
                ]
            )
        }
        return pref
    }
}

let solution = Solution()
print(solution.longestCommonPrefix(["flower","flow","flight"])) // "fl"
print(solution.longestCommonPrefix(["dog","racecar","car"])) // ""