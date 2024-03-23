                                                                       //В данном примере ошибка возникает из-за отсутствия проверки на наличие паспорта.
class Man {
    var pasport: (() -> Passport?)?                                     // По заданию, использование слабых или неинициализированных захватов запрещено.
    
    deinit {
                                                                       // Выведем в консоль уведомление о том, что объект был удален
        print("мужчина удален из памяти")
    }
}

class Passport {
    let man: Man
    
    init(man: Man){
        self.man = man
    }
    
    deinit {
                                                                      // Выводим в консоль сообщение о том, что объект был удалён.
        print("паспорт удален из памяти")
    }
}

var man: Man? = Man()
var passport: Passport? = Passport(man: man!)
man?.pasport = { [weak passport] in
    return passport 
}
passport = nil                                                       // Объект ещё не удалён, так как удерживается мужчиной
man = nil // Удалены
