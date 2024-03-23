class Person {
    let name: String
    lazy var greeting: () -> String = { [weak self] in
        guard let self = self else { return "lost" }
        return "My name is \(self.name)!"
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) delete")
    }
}

var person: Person? = Person(name: "Slava")
print(person?.greeting() ?? "Error")
person = nil
