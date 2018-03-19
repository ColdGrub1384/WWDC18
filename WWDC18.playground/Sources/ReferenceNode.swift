import SpriteKit

open class ReferenceNode: SKReferenceNode {
    
    open var childNode: SKNode?
    
    open override func didLoad(_ node: SKNode?) {
        super.didLoad(node)
        
        print("Load")
        childNode = node
    }
    
    public override init(fileNamed fileName: String?) {
        super.init(fileNamed: fileName)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported!")
    }
    
}
