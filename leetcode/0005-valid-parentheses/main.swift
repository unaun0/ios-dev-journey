///
/// Строка считается валидной если:
/// 1. Каждая открывающая скобка имеет закрывающую того же типа
/// 2. Скобки закрываются в правильном порядке
/// 3. Для каждой закрывающей скобки есть соответствующая открывающая
///
/// Алгоритм:
/// 1. Используем стек для отслеживания открывающих скобок
/// 2. При встрече закрывающей скобки проверяем соответствие
///    с последней открывающей в стеке
/// 3. В конце стек должен быть пустым
///
/// Примеры:
/// isValid("()") → true
/// isValid("()[]{}") → true
/// isValid("(]") → false
/// isValid("([)]") → false
/// isValid("{[]}") → true
///
/// - Parameter s: Строка содержащая только скобки '()[]{}'
/// - Returns: true если последовательность валидна, иначе false

class Solution {
    func isValid(_ s: String) -> Bool {
        let bracketPairs: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        var stack = [Character]()
        for char in s {
            if let openBracket = bracketPairs[char] {
                if stack.isEmpty || stack.removeLast() != openBracket {
                    return false
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}
