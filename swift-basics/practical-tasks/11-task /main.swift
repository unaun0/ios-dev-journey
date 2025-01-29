/*
Тема: Общая (00 - 11)

Техническое задание: Управление заказами в ресторане

1. Введение
    Разрабатывается система для управления заказами в ресторане.

2. Описание функционала
    2.1. Меню ресторана

        Меню ресторана представляет собой коллекцию блюд. 
        Каждое блюдо имеет следующие атрибуты:
            - Название блюда: строка, например, "Салат Цезарь".
            - Тип блюда: 
                    - Закуска
                    - Основное блюдо
                    - Десерт
            - Цена блюда

    2.2. Заказ

        Каждый заказ (как минимум) включает:
            - Номер заказа: уникальный идентификатор заказа.
            - Список блюд: массив блюд, выбранных пользователем.
            - Общая стоимость заказа: рассчитывается как сумма стоимости всех выбранных блюд с учётом 
            их количества в заказе.
        Заказ должен (как минимум) позволять:
             - Добавление блюда:
                Блюдо можно добавить в заказ только в том случае, если оно доступно в меню.
                Если блюдо отсутствует в меню, должна быть выведена ошибка.
                Блюдо добавляется в заказ с учётом того, что блюда могут повторяться, и в таком случае стоимость 
                    блюда увеличивается пропорционально количеству.
             - Удаление блюда:
                Блюдо можно удалить из заказа, если оно присутствует.
                Отображение информации о заказе:
                Информация о заказе должна включать номер заказа, перечень блюд с их типами и ценами, 
                    а также общую стоимость заказа.
*/

enum DishType {
    case appetizer
    case mainCourse
    case dessert

    func description() -> String {
        switch self {
            case .appetizer:
                return "Закуска"
            case .mainCourse:
                return "Основное блюдо"
            case .dessert:
                return "Десерт"
        }
    }
}

struct Dish {
    let name: String
    let type: DishType
    let price: Double

    func description() -> String {
        "Название: \(name) - Тип: \(type.description()) - Цена: \(price)"
    }
}

class Order {
    static private var nextOrderNumber: Int = 0
    private let orderNumber: Int
    private var dishes: [Dish] = []
    var discount: Double {
        get {
            return _discount
        }
        set {
            if newValue < 0 {
                _discount = 0
            } else if newValue > 100 {
                _discount = 100
            } else {
                _discount = newValue
            }
        }
    }
    var totalPrice: Double = 0
    private var isPaid: Bool = false
    private var _discount: Double = 0
    var finalPrice: Double {
        return totalPrice * (1 - discount / 100)
    }

    init() {
        orderNumber = Order.nextOrderNumber
        Order.nextOrderNumber += 1
        discount = 0
    }

    init(discount: Double) {
        orderNumber = Order.nextOrderNumber
        Order.nextOrderNumber += 1
        self.discount = discount
    }

    func description() -> String {
        var text: String = "Заказ № \(orderNumber)\nБлюда:\n"
        for dish in self.dishes {
            text += ("\t" + dish.description() + "\n")
        }
        text += "Общая стоимость заказа: \(totalPrice)\n"
        text += "Скидка: \(discount)%\n"
        text += "Итоговая стоимость заказа: \(finalPrice)\n"
        return text
    }

    @discardableResult
    func addDish(dish: Dish, from menu: [Dish]) -> Bool {
        if menu.contains(where: { $0.name == dish.name }) {
            dishes.append(dish)
            totalPrice += dish.price
            return true
        }
        return false
    }

    func removeDish(dishName: String) -> Void {
        dishes.removeAll { $0.name == dishName }
    }

    @discardableResult
    func processPayment(paidAmount: Double) -> Double {
        let change = paidAmount - finalPrice
        if change < 0 {
            print("Ошибка: недостаточно средств. Оплата не удалась.")
            return change
        }
        print("Оплата успешна! Итоговая стоимость заказа: \(finalPrice) руб.")
        print("Внесено: \(paidAmount) руб. Сдача: \(change) руб.")
        isPaid = true
        return change
    }
}

func createRandomOrders(numberOfOrders: Int, menu: [Dish]) -> [Order] {
    var orders: [Order] = []
    for _ in 1...numberOfOrders {
        let order = Order(discount: Double.random(in: 0.0...25.0))
        for _ in 1...(Int.random(in: 1...5)) {
            let randomDish = menu.randomElement()!
            order.addDish(dish: randomDish, from: menu)
        }
        orders.append(order)
    }
    return orders
}

let menu: [Dish] = [
    Dish(name: "Салат Цезарь", type: .appetizer, price: 250),
    Dish(name: "Борщ", type: .mainCourse, price: 300),
    Dish(name: "Стейк", type: .mainCourse, price: 600),
    Dish(name: "Тирамису", type: .dessert, price: 250),
    Dish(name: "Чизкейк", type: .dessert, price: 300)
]

let orders = createRandomOrders(numberOfOrders: 3, menu: menu)

for order in orders {
    print(order.description())
}

let sortedOrders = orders.sorted { $0.finalPrice > $1.finalPrice }
print("\n\nЗаказы, отсортированные по итоговой стоимости:")
for order in sortedOrders {
    print(order.description())
}

let expensiveOrders = orders.filter { $0.totalPrice > 1000 }
print("\n\nЗаказы с ценой более 1000 руб.:")
for order in expensiveOrders {
    print(order.description())
}
