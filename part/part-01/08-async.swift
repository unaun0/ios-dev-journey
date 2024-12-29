// ex.8.1

func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

// ex.8.2
// await - подожди, пока результат будет готов, прежде чем продолжить выполнение

func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

// ex.8.3
// Ключевое слово async let позволяет запускать несколько асинхронных операций одновременно.
// userID и username запрашиваются параллельно.
// Когда нужно использовать результаты, добавляется await, чтобы дождаться завершения операций.

func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}

// Task - это структура, которая представляет асинхронную задачу, 
// запускаемую для выполнения какого-либо кода.

Task {
    await connectUser(to: "primary")
}
