/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

let someCollection: [Any] = [3.14, 7.92, 4, 20, "string", "anjtherString", false, false]

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
for value in someCollection {
    if value is Int { print("Целое число \(value)") }
    if value is Double { print("Вещественное число \(value)") }
    if value is String { print("Строка - \(value)") }
    if value is Bool { print("Логическое значение \(value)") }
}


/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */

// массивы тоже можно?  var потому что вставлю потом ключ-значение
var dict: [String: Any] = ["1": true, "2": 5.3, "3": 10, "4": 18, "5": false, "6": 21.3, "7": "name", "8": "surname", "9": [1,2,3]]
for (key, value) in dict {
    print("Ключ \(key) имеет значение \(value)")
}

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total: Double = 0
for (_, value) in dict {
    if value is Int {
        total += Double(value as! Int)
    } else if value is Double {
        total += value as! Double
    } else if value is String {
        total += 1
    } else if value is Bool {
        if value as! Bool {
            total += 2
        } else {
            total -= 3
        }
    }
}
// 9 ключ сюда не берет
print(total)


/*:
 Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0
dict["10"] = "10"
for (_, value) in dict {
    if value is Int {
        total += Double(value as! Int)
    } else if value is Double {
        total += value as! Double
    } else if value is String {
        if let stringNum = Double(value as! String) {
            total += stringNum
        }
    }
}

print(total)

