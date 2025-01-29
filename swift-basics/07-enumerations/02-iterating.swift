/*
Итерация по кейсам перечисления
*/

// Для некоторых перечислений можно получить коллекцию всех кейсов перечисления. 
// Нужно лишь написать : CaseIterable после имени перечисления. 
// Swift предоставляет коллекцию всех кейсов, как свойство allCases типа перечисления.

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available") // "3 beverages available"
print(Beverage.allCases) // [main.Beverage.coffee, main.Beverage.tea, main.Beverage.juice]

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice