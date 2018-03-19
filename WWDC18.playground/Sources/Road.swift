import SpriteKit

open class Road: SKScene {
    
    var car: SKNode?
    var isCarPaused = false
    var lastTrafficLight: TrafficLight?
    
    var startPoint: SKNode {
        if let node = childNode(withName: "startPoint") {
            return node
        } else {
            fatalError("Start point not found!")
        }
    }
    
    var endPoint: SKNode {
        if let node = childNode(withName: "endPoint") {
            return node
        } else {
            fatalError("End point not found!")
        }
    }
    
    open override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        guard let car = car else {
            return
        }
        
        if !car.hasActions() && !isCarPaused {
            car.run(SKAction.moveBy(x: 0, y: 1000, duration: 10))
        }
        
        if car.position.y >= endPoint.position.y {
            car.position.y = startPoint.position.y
            
            for child in children {
                if child is TrafficLight {
                    child.removeFromParent()
                }
            }
        }
        
        if let lastTrafficLight = lastTrafficLight {
            if car.position.y > lastTrafficLight.position.y {
                
                if lastTrafficLight.canContinue {
                    lastTrafficLight.passed = true
                } else if !lastTrafficLight.passed {
                    _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                        self.view?.presentScene(GameOver(fileNamed: "gameOver"))
                    })
                }
            }
        }
        
        guard let camera = camera else {
            return
        }
        
        camera.position = car.position
        
        if Int(arc4random_uniform(50)) == 0 {
            
            if let lastTrafficLight = lastTrafficLight {
                
                guard car.position.y-lastTrafficLight.position.y > 300 else {
                    return
                }
            }
            
            // Put a traffic light
            let trafficLight = TrafficLight(fileNamed: "trafficLight")
            trafficLight.position.y = car.position.y+200
            trafficLight.position.x = car.position.x+100
            addChild(trafficLight)
            lastTrafficLight = trafficLight
        }
        
        if let car = car as? ReferenceNode {
            if (car.childNode?.childNode(withName: "car")?.zRotation ?? 0) != 0 {
                _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                    self.view?.presentScene(GameOver(fileNamed: "gameOver"))
                })
            }
        }
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if car?.hasActions() ?? false {
            isCarPaused = true
            car?.removeAllActions()
        } else {
            isCarPaused = false
            car?.run(SKAction.moveBy(x: 0, y: 1000, duration: 5))
        }
    }
}
