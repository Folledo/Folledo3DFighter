//
//  GameViewController.swift
//  Folledo3DFighter
//
//  Created by Samuel Folledo on 12/21/17.
//  Copyright © 2017 Samuel Folledo. All rights reserved.
//

import UIKit
//import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode! //property for camera
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupScene()
        setupCamera()
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func setUpView() {
        scnView = self.view as! SCNView //cast self.view to a SCNView and store it in the scnView property so you don’t have to re-cast it every time you need to reference the view in Main.storyboard
    }
    
    func setupScene() {
        scnScene = SCNScene() //creates a new blank instance of SCNScene and stores it in scnScene
        scnView.scene = scnScene //sets this blank scene as the one for scnView to use
        
        scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png" //sets background to an image selected from a folder
    }
    
    func setupCamera() {
        cameraNode = SCNNode() //First, you create an empty SCNNode and assign it to cameraNode.
        cameraNode.camera = SCNCamera() //Next, you create a new SCNCamera object and assign it to the camera property of cameraNode.
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10) //Then, you set the position of the camera.
        scnScene.rootNode.addChildNode(cameraNode) //Finally, you add cameraNode to the scene as a child node of the scene’s root node.

        
    }

}
