/// Объединяет два отсортированных связных списка в один отсортированный список.
///
/// Даны головы двух связных списков `list1` и `list2`, отсортированных в порядке неубывания.
/// Необходимо объединить эти два списка в один отсортированный список, соединив узлы исходных списков.
/// Возвращается голова объединенного списка.
///
/// # Примеры
/// ```
/// Вход: list1 = [1,2,4], list2 = [1,3,4]
/// Выход: [1,1,2,3,4,4]
///
/// Вход: list1 = [], list2 = []
/// Выход: []
///
/// Вход: list1 = [], list2 = [0]
/// Выход: [0]
/// ```
///
/// # Ограничения
/// - Количество узлов в обоих списках находится в диапазоне [0, 50]
/// - Значения узлов: -100 <= Node.val <= 100
/// - Оба списка отсортированы в порядке неубывания

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }

        let dummy = ListNode()
        var current: ListNode? = dummy
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                current?.next = l1
                l1 = l1?.next
            } else {
                current?.next = l2
                l2 = l2?.next
            }
            current = current?.next
        }
        current?.next = l1 ?? l2
        
        return dummy.next
    }
}

func createList(from array: [Int]) -> ListNode? {
    guard !array.isEmpty else { return nil }
    let head = ListNode(array[0])
    var current = head
    for value in array.dropFirst() {
        current.next = ListNode(value)
        current = current.next!
    }
    return head
}

func listToArray(_ head: ListNode?) -> [Int] {
    var result = [Int]()
    var current = head
    while current != nil {
        result.append(current!.val)
        current = current?.next
    }
    return result
}

let solution = Solution()

let list1 = createList(from: [1, 2, 4])
let list2 = createList(from: [1, 3, 4])
let merged1 = solution.mergeTwoLists(list1, list2)
print("Тест 1:", listToArray(merged1)) // Ожидаемый результат: [1, 1, 2, 3, 4, 4]

let list3 = createList(from: [])
let list4 = createList(from: [0])
let merged2 = solution.mergeTwoLists(list3, list4)
print("Тест 2:", listToArray(merged2)) // Ожидаемый результат: [0]

let list5 = createList(from: [1, 3, 5])
let list6 = createList(from: [])
let merged3 = solution.mergeTwoLists(list5, list6)
print("Тест 3:", listToArray(merged3)) // Ожидаемый результат: [1, 3, 5]

let list7 = createList(from: [])
let list8 = createList(from: [])
let merged4 = solution.mergeTwoLists(list7, list8)
print("Тест 4:", listToArray(merged4)) // Ожидаемый результат: []

let list9 = createList(from: [2, 4, 6, 8])
let list10 = createList(from: [1, 3, 5])
let merged5 = solution.mergeTwoLists(list9, list10)
print("Тест 5:", listToArray(merged5)) // Ожидаемый результат: [1, 2, 3, 4, 5, 6, 8]

let list11 = createList(from: [-5, -3, 0])
let list12 = createList(from: [-4, -2, 1])
let merged6 = solution.mergeTwoLists(list11, list12)
print("Тест 6:", listToArray(merged6)) // Ожидаемый результат: [-5, -4, -3, -2, 0, 1]