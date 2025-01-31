/*
Макросы
*/

// Макросы в Swift — это мощный инструмент для автоматизации и упрощения написания кода. 
// Они позволяют расширять код во время компиляции, добавляя функциональность или 
// повторяющийся код, не вмешиваясь в исходную логику программы. 

/* Типы макросов в Swift */

// Автономные макросы (freestanding macros):    
    // Эти макросы не привязаны к объявлениям и могут использоваться в любом месте кода.
    // Они вызываются с использованием символа # перед именем макроса.

func myFunction() {
    print("Currently running \(#function)")
    #warning("Something's wrong")
}
// #function — макрос, который вставляет имя текущей функции, так что при вызове 
    // myFunction() будет выведено: "Currently running myFunction()".
// #warning("Something's wrong") — макрос для генерации предупреждения на этапе 
    // компиляции.

// Прикрепленные макросы (attached macros): 
    // Эти макросы применяются непосредственно к декларациям типов или других элементов 
    // кода. Они изменяют поведение этих элементов, добавляя новые свойства, методы или 
    // соответствия протоколам.

struct SundaeToppings: OptionSet {
    let rawValue: Int
    static let nuts = SundaeToppings(rawValue: 1 << 0)
    static let cherry = SundaeToppings(rawValue: 1 << 1)
    static let fudge = SundaeToppings(rawValue: 1 << 2)
}
// Эта структура SundaeToppings реализует протокол OptionSet и описывает возможные 
// топпинги для мороженого (например, орехи, вишня, шоколадный сироп). 
// Она позволяет комбинировать несколько топпингов для мороженого, 
// используя битовые флаги.

// Протокол OptionSet позволяет создавать типы, которые могут представлять собой 
// множество возможных значений, объединённых с использованием побитовых операций 
// (например, OR или AND). Каждое значение, объявленное в OptionSet, будет 
// соответствовать одному из флагов (битов).

// Каждый топпинг получает уникальное значение через сдвиг битов. В этом случае:
// nuts = 1 << 0 — орехи, соответствуют первому биту (1).
// cherry = 1 << 1 — вишня, соответствует второму биту (2).
// fudge = 1 << 2 — шоколадный сироп, соответствует третьему биту (4).

// Таким образом, SundaeToppings — это набор флагов, который позволяет комбинировать 
// эти значения через побитовые операции.

/*
@OptionSet
struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }
} */
// @OptionSet — макрос, который автоматически добавляет нужные инициализаторы и 
// соответствие протоколу OptionSet, не требуя от программиста вручную создавать 
// все эти элементы.

/* Объявление макросов */

// Для создания макроса необходимо его объявить. 
// Объявление включает название макроса, его параметры, типы, 
// с которыми он может работать, и код, который он будет генерировать.

@attached(member)
@attached(conformance)
public macro OptionSet<RawType>() =
    #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")

// @attached(member) — указывает, что макрос добавляет новые элементы в тип.
// @attached(conformance) — указывает, что макрос добавляет соответствие протоколу.
// #externalMacro(module:type:) — указывает на внешнюю реализацию макроса, 
//                                которая будет использоваться для расширения.

/* Расширение макросов */

// Когда компилятор обрабатывает код, содержащий макросы, он сначала строит абстрактное 
// синтаксическое дерево (AST), затем передает части этого дерева в реализацию макроса, 
// чтобы тот мог их расширить. После того как макрос расширяет код, компилятор заменяет 
// вызов макроса на его расширенную форму и продолжает компиляцию.

/* Пример реализации макроса */

public struct FourCharacterCode: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression,
              let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
              segments.count == 1,
              case .stringSegment(let literalSegment)? = segments.first
        else {
            throw CustomError.message("Need a static string")
        }
        let string = literalSegment.content.text
        guard let result = fourCharacterCode(for: string) else {
            throw CustomError.message("Invalid four-character code")
        }
        return "\(raw: result)"
    }
}

private func fourCharacterCode(for characters: String) -> UInt32? {
    guard characters.count == 4 else { return nil }
    
    var result: UInt32 = 0
    for character in characters {
        result = result << 8
        guard let asciiValue = character.asciiValue else { return nil }
        result += UInt32(asciiValue)
    }
    return result.bigEndian
}

enum CustomError: Error { case message(String) }

// FourCharacterCode — это реализация макроса, который вычисляет четырехсимвольный код, 
//                     основываясь на переданной строке.
// Метод expansion отвечает за расширение макроса: он извлекает строку из переданного 
// аргумента, вычисляет ASCII-коды символов и создает соответствующее целочисленное 
// значение.

/* Составление пакета макросов */

// Чтобы использовать макросы в Swift, создайте специальный пакет с помощью команды 
// swift package init --type macro. 
// Этот пакет будет содержать все необходимые файлы для объявления и реализации макросов.

/* Пример структуры файла Package.swift для добавления макросов 

targets: [
    .macro(
        name: "MyProjectMacros",
        dependencies: [
            .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
            .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
        ]
    ),
    .target(name: "MyProject", dependencies: ["MyProjectMacros"]),
] */

// MyProjectMacros содержит реализацию макросов.
// MyProject использует эти макросы.

