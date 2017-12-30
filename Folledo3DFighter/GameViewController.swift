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
        spawnShape()
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func setUpView() {
        scnView = self.view as! SCNView //cast self.view to a SCNView and store it in the scnView property so you don’t have to re-cast it every time you need to reference the view in Main.storyboard
        
        scnView.showsStatistics = true //showStatistics enables a real-time statistics panel at the bottom of your scene
        scnView.allowsCameraControl = true //allowsCameraControl lets you manually control the active camera through simple gestures. Single finger swipe, two finger swipe, two finger pinch, and double tap
        scnView.autoenablesDefaultLighting = true //autoenablesDefaultLighting creates a generic omnidirectional light in your scene so you don’t have to worry about adding your own light sources
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
    
    func spawnShape() {
        var geometry: SCNGeometry //create a placeholder geometry variable
        switch ShapeType.random() { //define a switch statement to handle the returned shape from ShapeType.random()
        default:
            geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0) //create an SCNBox object and store it in geometry. You specify the width, height and length, along with the chamfer radius (which is a fancy way of saying rounded corners)
        }
        let geometryNode = SCNNode(geometry: geometry) // you create an instance of SCNNode named geometryNode. This time, you make use of the SCNNode initializer which takes a geometry parameter to create a node and automatically attach the supplied geometry.
        scnScene.rootNode.addChildNode(geometryNode) //add the node
        //Dont forget to call it in the viewDidLoad()
    }

}
