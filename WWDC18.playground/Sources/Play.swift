import SpriteKit

public func play(in view: SKView) {
    let scene = Road(fileNamed: "road")!
    
    // Present the scene
    view.presentScene(scene)
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Init the car
    if let car = SKReferenceNode(fileNamed: "carPlayer") {
        car.position = scene.startPoint.position
        scene.addChild(car)
        scene.car = car
        car.run(SKAction.moveBy(x: 0, y: 1000, duration: 5))
    }
}

