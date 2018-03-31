//: # WWDC Scholarship Playground
//: Don't pass with the red traffic light! Tap to stop or continue the car.
//:
//: Be sure to open the assistant editor!

//: ## ReferenceNode
//: `ReferenceNode` is a subclass of `SKReferenceNode` that contains a variable `childNode` that has as value the node contained by the Reference node.
//:
//:     let reference = ReferenceNode(fileNamed: "carPlayer")
//:     let car = reference.childNode

//: ## HomeViewController
//: `HomeViewController` is a subclass of `UIViewController` that contains the game guide and the game view itself.

//: ## Road
//: `Road` is a subclass of `SKScene` and is basically the game itself loaded inside a view of `HomeViewController`. This scene needs to be initialised from the `"road.sks"` file.
//:
//:     let scene = Road(fileNamed: "road")

//: ## TrafficLight
//: `TrafficLight` is a subclass of `SKReferenceNode` and is the traffic light presented randomly in the road with a car and another road. This reference needs to be initialised from the `"trafficLight.sks"` file.
//:
//:     let trafficLight = TrafficLight(fileNamed: "trafficLight")

//: ## GameOver
//: `GameOver` is a subclass of `SKScene` and is presented when the user loses. When the player taps the screen, the game is reset.

import PlaygroundSupport
import SpriteKit

let viewController = HomeViewController()
viewController.preferredContentSize = CGSize(width: 640, height: 460)

PlaygroundPage.current.liveView = viewController


