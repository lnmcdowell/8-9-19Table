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
