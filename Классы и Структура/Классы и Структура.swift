class House {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func create() {
        print("Дом: \(width * height) кв.м")
    }
    
    func destroy() {
        print("Дом удален!")
    }
}

// Создать класс родитель и 2 класса наследника
// Создать класс *House* в нем несколько свойств - *width*, *height* и несколько методов: *create*(выводит площадь),*destroy*(отображает что дом удалился)
// Создаем класс родителя
// Создаем классы-наследники

class BigHouse: House {
    override init(width: Double, height: Double) {
        super.init(width: width, height: height)
    }
    
    func showOff() {
        print("Этот дом больших размеров")
    }
}

class SmallHouse: House {
    override init(width: Double, height: Double) {
        super.init(width: width, height: height)
    }
    
    func cozy() {
        print("Этот дом маленьких размеров")
    }
}

let bigHouse = BigHouse(width: 10, height: 20)
bigHouse.create() // Теперь можем создать экземпляры классов и использовать их методы
bigHouse.showOff()

let smallHouse = SmallHouse(width: 5, height: 10)
smallHouse.create()
smallHouse.cozy()
smallHouse.destroy()

class Student {
    var name: String
    var grade: Int
    
    init(name: String, grade: Int) {
        self.name = name
        self.grade = grade
    }
}//Создайте класс с методами, которые сортируют массив учеников по разным параметрам
// Создаем класс для ученика
class StudentsSorter {
    
    func sortByGrade(students: [Student]) -> [Student] {
        let sortedStudents = students.sorted { $0.grade > $1.grade }
        return sortedStudents
    }
} // Создаем класс для сортировки учеников

let student1 = Student(name: "Аня", grade: 4)
let student2 = Student(name: "Петя", grade: 5)
let student3 = Student(name: "Вася", grade: 3)// Создаем учеников
let students = [student1, student2, student3]

let sorter = StudentsSorter()// Используем класс для сортировки
let sortedStudents = sorter.sortByGrade(students: students)

for student in sortedStudents {
    print("Имя: \(student.name), Оценка: \(student.grade)") // Выводим отсортированных учеников
}
struct Point {
    var x: Double
    var y: Double
}
// Написать свою структуру и класс, и пояснить в комментариях - чем отличаются структуры от классов
// Структура Point представляет точку на плоскости
class Shape {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    // Класс Shape представляет геометрическую фигуру
    func getArea() -> Double {
        return 0.0
    }
}

class Circle: Shape {
    var radius: Double
    
    init(name: String, radius: Double) {
        self.radius = radius
        super.init(name: name)
    }
    // Класс Circle - подкласс фигуры, представляющий круг
    override func getArea() -> Double {
        return Double.pi * radius * radius
    }
}

// Создаем экземпляр структуры Point и выводим значения координат x и y
let point = Point(x: 3.0, y: 4.0)
print("Точка: (\(point.x), \(point.y))")
// Создаем экземпляр структуры Point и выводим значения координат x и y

let circle = Circle(name: "Круг", radius: 5.0)
print("Площадь круга: \(circle.getArea())")
// Создаем экземпляр класса Circle и выводим его площадь
// Структуры - значения передаются по значению, т.е. копируются при передаче в функции или присваивании. Структуры являются value types.
// Классы - значения передаются по ссылке, т.е. передается ссылка на объект. Классы являются reference types.

//Напишите простую программу, которая отбирает комбинации в покере из рандомно выбранных 5 карт
// Создаем структуру для карт
struct Card {
    var rank: String
    var suit: String
}



extension Array where Element == Card {
    
    func checkPokerCombination() -> String {
        let combinations = ["Пара", "Две пары", "Тройка", "Сет (тройка одного достоинства)", "Стрит", "Флеш", "Фулл хаус", "Каре", "Стрит-флеш"]
        
        var ranks = [String]()
        var suits = [String]()
        
        for card in self {
            ranks.append(card.rank)
            suits.append(card.suit)
        }
        
        if Set(suits).count == 1 {
            if isStraight(ranks) {
                return "У вас \(combinations[8])"
            } else {
                return "У вас \(combinations[5])"
            }
        } else {
            if isFourOfAKind(ranks) {
                return "У вас \(combinations[7])"
            } else if isFullHouse(ranks) {
                return "У вас \(combinations[6])"
            } else if isThreeOfAKind(ranks) {
                return "У вас \(combinations[3])"
            } else if isTwoPairs(ranks) {
                return "У вас \(combinations[1])"
            } else if isOnePair(ranks) {
                return "У вас \(combinations[0])"
            } else if isStraight(ranks) {
                return "У вас \(combinations[4])"
            } else {
                return "У вас Ничего"
            }
        }
    }
    
    private func isStraight(_ ranks: [String]) -> Bool {
        let orderedRanks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
        let rankSet = Set(ranks)
        
        var consecutiveCount = 0
        
        for rank in orderedRanks {
            if rankSet.contains(rank) {
                consecutiveCount += 1
                if consecutiveCount == 5 {
                    return true
                }
            } else {
                consecutiveCount = 0
            }
        }
        
        return false
    }
    
    private func isFourOfAKind(_ ranks: [String]) -> Bool {
        let rankSet = Set(ranks)
        
        for rank in rankSet {
            if ranks.filter({ $0 == rank }).count == 4 {
                return true
            }
        }
        
        return false
    }
    
    private func isFullHouse(_ ranks: [String]) -> Bool {
        let rankSet = Set(ranks)
        
        if rankSet.count == 2 {
            for rank in rankSet {
                if ranks.filter({ $0 == rank }).count != 2 && ranks.filter({ $0 == rank }).count != 3 {
                    return false
                }
            }
            return true
        }
        
        return false
    }
    
    private func isThreeOfAKind(_ ranks: [String]) -> Bool {
        let rankSet = Set(ranks)
        
        for rank in rankSet {
            if ranks.filter({ $0 == rank }).count == 3 {
                return true
            }
        }
        
        return false
    }
    
    private func isTwoPairs(_ ranks: [String]) -> Bool {
        var pairCount = 0
        
        let rankSet = Set(ranks)
        
        for rank in rankSet {
            if ranks.filter({ $0 == rank }).count == 2 {
                pairCount += 1
            }
        }
        
        return pairCount == 2
    }
    
    private func isOnePair(_ ranks: [String]) -> Bool {
        let rankSet = Set(ranks)
        
        for rank in rankSet {
            if ranks.filter({ $0 == rank }).count == 2 {
                return true
            }
        }
        
        return false
    }
}

import Foundation

// Создание колоды из 52 карт
var deck: [Card] = []
let ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
let suits = ["♠️", "♣️", "♥️", "♦️"]

for rank in ranks {
    for suit in suits {
        deck.append(Card(rank: rank, suit: suit))
    }
}

// Функция для перемешивания колоды
func shuffleDeck(_ deck: [Card]) -> [Card] {
    return deck.shuffled()
}

// Перемешивание колоды
let shuffledDeck = shuffleDeck(deck)

// Выбор пяти случайных карт
var selectedCards: [Card] = []
while selectedCards.count < 5 {
    let randomIndex = Int.random(in: 0..<shuffledDeck.count)
    let randomCard = shuffledDeck[randomIndex]

    if !selectedCards.contains(where: { $0.rank == randomCard.rank && $0.suit == randomCard.suit }) {
        selectedCards.append(randomCard)
    }
}

// Печать выбранных карт
for card in selectedCards {
    print("Card(rank: \"\(card.rank)\", suit: \"\(card.suit)\")")
}

print(selectedCards.checkPokerCombination())
