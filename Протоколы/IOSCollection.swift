import Foundation


func address(of object: UnsafeRawPointer) -> String {
    let addr = Int(bitPattern: object)
    return String(format: "%p", addr)
}

func address(off value: AnyObject) -> String {
    return "\(Unmanaged.passUnretained(value).toOpaque())"
}


struct Identifier {
    var id = 1
}



class Ref<T> {
    var value: T
    init( value: T) {
        self.value = value
    }
}

struct Container<T> {
    var ref: Ref<T>
    init( value: T) {
        self.ref = Ref(value: value)
    }

    var value: T {
        get {
            ref.value
        }
        set {
            guard (isKnownUniquelyReferenced(&ref)) else {
                ref = Ref(value: newValue)
                return 
            }
            ref.value = newValue
        }
    }
}

var id = Identifier()
var container1 = Container(value: id)
var container2 = container1


print("Copy до write:")
print(address(off: container1.ref))
print(address(off: container2.ref))

container2.value.id = 21

print("После write:")
print(address(off: container1.ref))
print(address(off: container2.ref), "- адрес изменен")
