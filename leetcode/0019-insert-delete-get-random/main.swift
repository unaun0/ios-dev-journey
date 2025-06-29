// Вставка, Удаление, Получение случайного элемента за O(1)

// Условие задачи

// Необходимо реализовать класс RandomizedSet со следующими функциями:

// RandomizedSet() - Инициализирует объект RandomizedSet.

// bool insert(int val) - Вставляет элемент val в множество, если его там нет. 
// Возвращает true, если элемент был успешно добавлен, и false в противном случае.

// bool remove(int val) - Удаляет элемент val из множества, если он там присутствует. 
// Возвращает true, если элемент был успешно удален, и false в противном случае.

// int getRandom() - Возвращает случайный элемент из текущего множества 
// (гарантируется, что при вызове этого метода множество не пусто).

// Каждый элемент должен иметь одинаковую вероятность быть выбранным.

// Пример

// Ввод
// [
//  "RandomizedSet", 
//  "insert", 
//  "remove", 
//  "insert", 
//  "getRandom", 
//  "remove",
//  "insert", 
//  "getRandom"
// ]  
// [[], [1], [2], [2], [], [1], [2], []]  
// Вывод
// [null, true, false, true, 2, true, false, 2]  
// Объяснение

// text
// RandomizedSet randomizedSet = new RandomizedSet();  
// randomizedSet.insert(1); // Вставляет 1 в множество. Возвращает true, так как 1 был успешно добавлен.  
// randomizedSet.remove(2); // Возвращает false, так как 2 нет в множестве.  
// randomizedSet.insert(2); // Вставляет 2 в множество, возвращает true. Теперь множество содержит [1, 2].  
// randomizedSet.getRandom(); // getRandom() должен случайно вернуть либо 1, либо 2.  
// randomizedSet.remove(1); // Удаляет 1 из множества, возвращает true. Теперь множество содержит [2].  
// randomizedSet.insert(2); // 2 уже есть в множестве, поэтому возвращает false.  
// randomizedSet.getRandom(); // Поскольку 2 — единственный элемент в множестве, getRandom() всегда вернет 2.  

// Ограничения
// -2^31 <= val <= 2^31 - 1
// Количество вызовов insert, remove и getRandom не превышает 2 * 10^5.
// При вызове getRandom в структуре данных гарантированно есть хотя бы один элемент.

// Требование
// Все операции должны выполняться в среднем за O(1).

class RandomizedSet {
    private var elems = [Int]()
    private var map = [Int:Int]()

    init() { }
    
    func insert(_ val: Int) -> Bool {
        if map[val] != nil {
            return false
        }
        map[val] = elems.count
        elems.append(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        if let idx = map[val] {
            let lidx = elems.count - 1
            elems[idx] = elems[lidx]
            map[elems[idx]] = idx
            elems.remove(at: lidx)
            map[val] = nil
            return true
        } 
        return false
    }
    
    func getRandom() -> Int {
        return elems[
            Int.random(
                in: 0..<elems.count
            )
        ]
    }
}