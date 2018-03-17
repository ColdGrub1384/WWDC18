//: Don't pass with the red traffic light!

// BE SURE TO OPEN THE ASSISTANT EDITOR!

import PlaygroundSupport
import SpriteKit

let viewController = UIViewController()

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))

viewController.preferredContentSize = sceneView.frame.size
viewController.view = sceneView

// Instructions
let instructions = UIAlertController(title: "How to play", message: "Tap the screen to stop the car and don't pass with the red traffic light!", preferredStyle: .alert)
instructions.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
    
    // Load the SKScene from 'road.sks'
    play(in: sceneView)
}))

PlaygroundPage.current.liveView = viewController

viewController.present(instructions, animated: true, completion: nil)
