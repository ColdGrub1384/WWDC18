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
        
        
        var count = 0
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            
            node?.childNode(withName: "car")?.position.x -= 30
            
            count += 1
            
            if count >= 8000 {
                timer.invalidate()
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
