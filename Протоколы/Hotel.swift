                                         // Создаем протокол Hotel
protocol Hotel {
    init(roomCount: Int)
}

                                         // Создаем класс HotelAlfa, подписываем его на протокол Hotel
class HotelAlfa: Hotel {
    var roomCount: Int
    
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
}

                                          // Пример использования
let hotelAlfa = HotelAlfa(roomCount: 50)
print("Hotel Alfa room count: \(hotelAlfa.roomCount)")
