/*
Присваивание значения для self внутри изменяющего метода
*/

// Изменяющие методы могут присваивать полностью новый экземпляр неявному 
// свойству self.

struct Point {
   var x = 0.0, y = 0.0
   mutating func moveBy(x deltaX: Double, y deltaY: Double) {
      self = Point(x: x + deltaX, y: y + deltaY)
   }
}

// Такая версия изменяющего метода moveBy(x:y:) создает абсолютно новую структуру,
// чьим значениям x, y присвоены значения конечной точки. 

// Изменяющие методы для перечислений могут установить отдельный член перечисления
// как неявный параметр self:

enum TriStateSwitch {
   case off, low, high
   mutating func next() {
      switch self {
         case .off:
            self = .low
         case .low:
            self = .high
         case .high:
            self = .off
      }
   }
}
var ovenLight = TriStateSwitch.low
ovenLight.next() // ovenLight равен .high
ovenLight.next() // ovenLight равен .off

