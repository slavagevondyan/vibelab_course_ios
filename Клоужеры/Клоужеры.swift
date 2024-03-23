var friends = ["Саша", "Леша", "Игорь", "Андрей", "Вика"]                         // Сортировка массива с помощью замыкания

let sortedForward = friends.sorted { $0.count < $1.count }
print("Сортировка по возрастанию кол-ва символов: \(sortedForward)")              // Сортировка по возрастанию кол-ва символов

let sortedBackward = friends.sorted { $0.count > $1.count }
print("Сортировка убыванию кол-ва символов: \(sortedBackward)")                   // Сортировка убыванию кол-ва символов


var friendsDictionary = [Int: String]()                                           // Создание списка с именами

for friend in friends {
    friendsDictionary[friend.count] = friend
}                                                                                 // Заполнение списка

func printKeyValue(key: Int) {
    if let value = friendsDictionary[key] {
        print("Ключ: \(key), Значение: \(value)")
    } else {
        print("Нет значения для ключа \(key)")
    }
}                                                                                 // Функция для вывода ключа и значения

printKeyValue(key: 3)                                                             // Вызов функции для ключа 3
           
func checkArraysAndPrint(array1: inout [String], array2: inout [Int]) {
    if array1.isEmpty {
        array1.append("Новое значение1")
    }
    if array2.isEmpty {
        array2.append(42)
    }
    
    print("Первый массив: \(array1)")
    print("Второй массив: \(array2)")
}                                                                                 // Функция для проверки и вывода массивов 

var emptyArray1 = [String]()                                                      // Пустые массивы для проверки
var emptyArray2 = [Int]()

checkArraysAndPrint(array1: &emptyArray1, array2: &emptyArray2)                   // Вызов функции для проверки и вывода массивов
