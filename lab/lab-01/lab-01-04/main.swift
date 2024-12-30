/*
Разработать программу, 
которая будет 
    принимать от пользователя количество монет в центах (пени) и 
    вычислять, сколько бутылок можно купить на эти деньги, 
если одна бутылка стоит 25 центов, а также нужно учитывать, 
что для покупки бутылки требуется как минимум 20 центов.
*/

func readIntInput(promt: String) -> Int? {
    print(promt)
    if let input = readLine(), let value = Int(input) {
        return value
    } else {
        print("Invalid input. Please enter a valid number")
        return nil
    }
}

guard
    let pennies = readIntInput(promt: "Enter number of pennies:"),
    pennies >= 0
else {
    print("Failed to get valid inputs. Exiting program...")
    exit(1)
}

var bottles = max((pennies - 20) / 25, 0)

print("Number of bottles: \(bottles)")