import Foundation

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
    var heading: Float = 0.0
    var sunroof = Sunroof()

    mutating func run() {
        position.x += Float(speed) * sin(heading)
        position.y += Float(speed) * cos(heading)
        print("Ferrari running at speed \(speed), heading \(heading) rad, position (\(position.x), \(position.y))")
    }

    mutating func retract() {
        sunroof.isOpen.toggle()
        print("Ferrari sunroof is now \(sunroof.isOpen ? "open" : "closed")")
    }
}

// MARK: - Example Usage

var wrapper = CarWrapper(Ferrari())
wrapper.run()                  // heading 0.0 rad → position (0.0, 60.0)
wrapper.car.heading = .pi / 4  // 45 degrees
wrapper.run()                  // heading π/4 rad → position (~42.4, ~102.4)
wrapper.car.retract()          // Ferrari sunroof is now open
wrapper.car.retract()          // Ferrari sunroof is now closed
