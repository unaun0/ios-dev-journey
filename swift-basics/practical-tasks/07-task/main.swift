/*
Тема: Перечисления

Задание: 
    Создай enum для направлений движения (вверх, вниз, влево, вправо). Напиши функцию, 
    которая принимает направление и выводит соответствующее сообщение, например, 
    "Вы двигаетесь вверх".
*/

enum Direction {
    case Up, Down, Left, Right
}

func printDir(_ dir: Direction) -> Void {
    switch dir {
        case .Up:
            print("Вы двигаетесь вверх")
        case .Down:
            print("Вы двигаетесь вниз")
        case .Left:
            print("Вы двигаетесь влево")
        case .Right:
            print("Вы двигаетесь вправо")
    }
}

var dir = Direction.Up
printDir(dir)