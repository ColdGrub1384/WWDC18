import SpriteKit

open class TrafficLight: SKReferenceNode {
    
    var passed = false
    
    private var node: SKNode?
    
    var red: SKSpriteNode? {
        return node?.childNode(withName: "red") as? SKSpriteNode
    }
    
    var orange: SKSpriteNode? {
        return node?.childNode(withName: "orange") as? SKSpriteNode
    }
    
    var green: SKSpriteNode? {
        return node?.childNode(withName: "green") as? SKSpriteNode
    }
    
    var canContinue: Bool {
        return red?.color != .red
    }
    
    open override func didLoad(_ node: SKNode?) {
        super.didLoad(node)
        
        self.node = node
        
        func changeState() {
            _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (_) in
                
                self.red?.color = UIColor.red.withAlphaComponent(0.3)
                self.orange?.color = UIColor.orange.withAlphaComponent(0.3)
                self.green?.color = .green
            })
            
            _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (_) in
                
                self.red?.color = UIColor.red.withAlphaComponent(0.3)
                self.orange?.color = .orange
                self.green?.color = UIColor.green.withAlphaComponent(0.3)
            })
            
            _ = Timer.scheduledTimer(withTimeInterval: 6, repeats: false, block: { (_) in
                
                self.red?.color = .red
                self.orange?.color = UIColor.orange.withAlphaComponent(0.3)
                self.green?.color = UIColor.green.withAlphaComponent(0.3)
            })
        }
        
        changeState()
        
        _ = Timer.scheduledTimer(withTimeInterval: 6, repeats: true, block: { (_) in
            
            changeState()
        })
        
        
        guard let car = node?.childNode(withName: "car") else {
            return
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            
            car.position.x -= 30
            
            if car.position.x <= -290 {
                timer.invalidate()
                
                car.zRotation += 1.5708
                
                _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
                    
                    car.position.y -= 30
                    
                    if car.parent == nil {
                        timer.invalidate()
                    }
                })
            }
        })
        
    }
    
    override init(fileNamed fileName: String?) {
        super.init(fileNamed: fileName)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
