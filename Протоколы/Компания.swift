protocol Coding {
    var time: Int { get set }
    var linesOfCode: Int { get set }
    func writeCode(platform: Platform, numberOfSpecialists: Int)
}                                                                                             // Создание двух протоколов

protocol Testing {
    func stopCoding()
}

enum Platform {
    case iOS
    case Android
    case Web
}

class Company: Coding, Testing {
    var numberOfProgrammers: Int
    var specializations: [String]

    init(numberOfProgrammers: Int, specializations: [String]) {
        self.numberOfProgrammers = numberOfProgrammers
        self.specializations = specializations
    }                                                                                         // Создание класса Компания

    var time: Int = 0
    var linesOfCode: Int = 0

    func writeCode(platform: Platform, numberOfSpecialists: Int) {
        print("Разработка началась. Пишем код для \(platform)")
                                                                                             // Здесь мог бы быть код генерации кода 
        self.time += 1 // Увеличиваем время на единицу
        self.linesOfCode += 100                                                             // Добавляем 100 строк кода

        print("Работа закончена. Сдаю в тестирование")
    }

    func stopCoding() {
        if self.time > 5 {
            print("Превышено время разработки!")
        } else {
            print("Остановка разработки выполнена.")
        }
    }
}

                                                                                             // Создание экземпляра класса Компания и подключение к протоколам
let company = Company(numberOfProgrammers: 10, specializations: ["iOS", "Android", "Web"])
company.writeCode(platform: .iOS, numberOfSpecialists: 5)
company.stopCoding()
