protocol GameProtocol {
    var gameName: String { get }
    var gameDescription: String? { get }                    // делаем одно свойство необязательным
    
    func startGame()
}


extension GameProtocol {
    var gameDescription: String? {
        return nil
    }
}
                                                         // Создаем класс Game и подписываем его на протокол GameProtocol
class Game: GameProtocol { 
    var gameName: String
    
    init(name: String) {
        self.gameName = name
    }
    func startGame() {
        print("Игра \(gameName) начата!")
    }
}

                                                          // Использование
let game = Game(name: "Шахматы")
game.startGame()
