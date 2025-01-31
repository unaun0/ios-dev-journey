/*
Приведение типов
*/

// Приведение типов в Swift — это механизм для проверки типа экземпляра и/или 
// преобразования его в другой тип, особенно в контексте иерархий классов, 
// подклассов или протоколов. 
// Это помогает работать с экземплярами разных типов, избегая ошибок, и предоставляет 
// дополнительные возможности для работы с переменными.

// Основные операторы для приведения типов: is и as

// is — используется для проверки, является ли экземпляр конкретного типа или 
//      его подкласса.
// as? — опциональное приведение типов, которое может вернуть nil, 
//       если приведение невозможно.
// as! — принудительное приведение типов, которое вызывает ошибку в случае неудачного
//       приведения.

/* Пример приведения типов на иерархии классов */

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
// Массив, содержащий экземпляры Movie и Song:
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

// Оператор is позволяет проверить, 
// является ли объект экземпляром определенного класса или его подкласса

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("В Media библиотеке содержится \(movieCount) фильма и \(songCount) песни")
// В Media библиотеке содержится 2 фильма и 3 песни

/* Понижающее приведение (downcasting) */

// Для того чтобы работать с объектами как с конкретными подклассами, 
// нужно провести понижающее приведение

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
/*
Movie: Casablanca, dir. Michael Curtiz
Song: Blue Suede Shoes, by Elvis Presley
Movie: Citizen Kane, dir. Orson Welles
Song: The One And Only, by Chesney Hawkes
Song: Never Gonna Give You Up, by Rick Astley
*/

// Здесь as? пытается преобразовать тип item в Movie или Song. 
// Если приведение удачно, объект можно использовать в соответствующем блоке кода.
