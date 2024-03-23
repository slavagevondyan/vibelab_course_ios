protocol GameDice {
    var numberDice: Int { get }
}                        // Создаем протокол GameDice

extension Int: GameDice {
    var numberDice: Int {
        print("Выпало \(self) на кубике")
        return self
    }
}                       // Расширяем протокол Int

                        // Пример использования
let diceCoub = 4
let result = diceCoub.numberDice
