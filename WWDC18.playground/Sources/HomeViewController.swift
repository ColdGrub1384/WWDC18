import UIKit
import SpriteKit

open class HomeViewController: UIViewController {
    
    var sceneView: SKView!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundView = UIImageView(frame: CGRect(x: 0 , y: 0, width: 640, height: 460))
        backgroundView.image = UIImage(named: "wallpaper.jpg")
        backgroundView.contentMode = .scaleAspectFill
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.frame = backgroundView.frame
        
        sceneView = SKView(frame: CGRect(origin: CGPoint(x: 0, y: 20), size: CGSize(width: backgroundView.frame.width, height: backgroundView.frame.height-20)))
        sceneView.clipsToBounds = true
        sceneView.layer.cornerRadius = 20
        sceneView.isOpaque = false
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 20, width: backgroundView.frame.width, height: 40))
        titleLabel.textColor = .white
        titleLabel.text = "How to play"
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        
        let instructions = UILabel(frame: CGRect(x: 10, y: 70, width: backgroundView.frame.width, height: 20))
        instructions.textColor = .white
        instructions.text = "Tap the screen to stop the car and don't pass with the red traffic light!"
        
        let playButton = UIButton(frame: CGRect(x: backgroundView.frame.width/2-150, y: backgroundView.frame.height/2-25, width: 300, height: 50))
        playButton.backgroundColor = view.tintColor
        playButton.tintColor = .white
        playButton.setTitle("Play", for: .normal)
        playButton.clipsToBounds = true
        playButton.layer.cornerRadius = 20
        playButton.addTarget(self, action: #selector(`continue`), for: .touchUpInside)
        
        view.addSubview(backgroundView)
        view.addSubview(blurView)
        view.addSubview(titleLabel)
        view.addSubview(instructions)
        view.addSubview(playButton)
    }
    
    @objc func `continue`() {
        
        for view in view.subviews {
            if view is UILabel || view is UIButton {
                view.removeFromSuperview()
            }
        }
        
        view.addSubview(sceneView)
        play(in: sceneView)
    }
}

