protocol Car {
    var speed: Int { get }
    var position: (x: Float, y: Float) { get set }
    mutating func run()
}

struct CarWrapper<T: Car> {
    var car: T

    init(_ car: T) {
        self.car = car
    }

    var speed: Int { car.speed }
    var position: (x: Float, y: Float) { car.position }

    mutating func run() {
        car.run()
    }
}

// MARK: - Ferrari

struct Sunroof {
    var isOpen: Bool = false
}

struct Ferrari: Car {
    var speed: Int = 60
    var position: (x: Float, y: Float) = (0.0, 0.0)
    var sunroof = Sunroof()

    mutating func run() {
        position.x += Float(speed)
        print("Ferrari running at speed \(speed), position (\(position.x), \(position.y))")
    }

    mutating func retract() {
        sunroof.isOpen.toggle()
        print("Ferrari sunroof is now \(sunroof.isOpen ? "open" : "closed")")
    }
}

// MARK: - Example Usage

var wrapper = CarWrapper(Ferrari())
wrapper.run()                  // Ferrari running at speed 60, position (60.0, 0.0)
wrapper.run()                  // Ferrari running at speed 60, position (120.0, 0.0)
wrapper.car.retract()          // Ferrari sunroof is now open
wrapper.car.retract()          // Ferrari sunroof is now closed
