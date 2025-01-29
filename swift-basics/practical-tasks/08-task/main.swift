/*
Тема: Структуры и классы

Задание: 
    Создай структуру Книга с полями название, автор, год издания. 
    Сделай функцию, которая создает массив книг и выводит информацию о них.
*/

struct Book {
    var title: String
    var author: String
    var year: Int

    func printInfo() {
        print("📖 \(title) — \(author) (\(year))")
    }
}

func createBooks() -> [Book] {
    return [
        Book(title: "1984", author: "Джордж Оруэлл", year: 1949),
        Book(title: "Мастер и Маргарита", author: "Михаил Булгаков", year: 1966),
        Book(title: "Преступление и наказание", author: "Фёдор Достоевский", year: 1866)
    ]
}

let books = createBooks()
for book in books {
    book.printInfo()
}