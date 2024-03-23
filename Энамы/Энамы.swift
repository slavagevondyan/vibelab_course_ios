enum Weekday: Int {
    case monday = 1, tuesday, wednesday, thursday, friday
} // Создание enum с разными типами RawValue
enum Month: String {
    case january = "Январь", february = "Февраль", march = "Март", april = "Апрель"
}
enum Gender {
    case male, female
} // Энам для заполнения анкеты сотрудника
enum AgeCategory {
    case young, middle, senior
}
enum Experience {
    case junior, middle, senior
}
enum RainbowColor {
    case red, orange, yellow, green, blue, indigo, violet
}// Энам со всеми цветами радуги

func printEnumValues() {
    let fruitColor: (String, RainbowColor) = ("apple", .green)
    let skyColor: (String, RainbowColor) = ("sun", .red)
    
    print("\(fruitColor.0) \(skyColor.1), '\(skyColor.0) \(fruitColor.1)'")
} // Функция для вывода содержимого enum в консоль
enum Score: String {
    case excellent = "отлично", good = "хорошо", satisfactory = "удовлетворительно", poor = "неудовлетворительно"
    
    func assignGrade() -> Int {
        switch self {
        case .excellent:
            return 5
        case .good:
            return 4
        case .satisfactory:
            return 3
        case .poor:
            return 2
        }
    }
} // Функция для выставления оценок ученикам
enum Car {
    case bmw, mercedes, audi, toyota
    func printCar() {
        switch self {
        case .bmw:
            print("BMW стоит в гараже")
        case .mercedes:
            print("Mercedes стоит в гараже")
        case .audi:
            print("Audi стоит в гараже")
        case .toyota:
            print("Toyota стоит в гараже")
        }
    }
} // Метод для вывода автомобилей в гараже


printEnumValues()
let studentScore: Score = .good
print(studentScore.assignGrade())
let carInGarage: Car = .audi
carInGarage.printCar()
