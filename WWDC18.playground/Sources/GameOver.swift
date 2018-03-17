import SpriteKit

class GameOver: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let view = view {
            play(in: view)
        }
    }
}

