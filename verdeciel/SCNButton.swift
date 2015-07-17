//
//  SCNButton.swift
//  Verreciel
//
//  Created by Devine Lu Linvega on 2015-07-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import Foundation

class SCNButton : SCNNode
{
	var outline1:SCNNode!
	var outline2:SCNNode!
	var outline3:SCNNode!
	var outline4:SCNNode!
	
	var panelName:String = ""
	
	init(newName:String)
	{
		super.init()
		panelName = newName
		addGeometry()
		update()
	}
	
	func addGeometry()
	{
		let optionPanel = SCNNode(geometry: SCNPlane(width: 1, height: 1))
		optionPanel.geometry?.firstMaterial?.diffuse.contents = clear
		optionPanel.position = position
		optionPanel.name = "trigger.\(panelName)"
		
		optionPanel.addChildNode(line(SCNVector3(x: 0, y: 0.75, z: 0),SCNVector3(x: 0.75, y: 0, z: 0)))
		optionPanel.addChildNode(line(SCNVector3(x: 0.75, y: 0, z: 0),SCNVector3(x: 0, y: -0.75, z: 0)))
		optionPanel.addChildNode(line(SCNVector3(x: -0.75, y: 0, z: 0),SCNVector3(x: 0, y: 0.75, z: 0)))
		optionPanel.addChildNode(line(SCNVector3(x: -0.75, y: 0, z: 0),SCNVector3(x: 0, y: -0.75, z: 0)))
		
		outline1 = redLine(SCNVector3(x: 0, y: 0.5, z: 0),SCNVector3(x: 0.5, y: 0, z: 0))
		optionPanel.addChildNode(outline1)
		outline2 = redLine(SCNVector3(x: 0.5, y: 0, z: 0),SCNVector3(x: 0, y: -0.5, z: 0))
		optionPanel.addChildNode(outline2)
		outline3 = redLine(SCNVector3(x: -0.5, y: 0, z: 0),SCNVector3(x: 0, y: 0.5, z: 0))
		optionPanel.addChildNode(outline3)
		outline4 = redLine(SCNVector3(x: -0.5, y: 0, z: 0),SCNVector3(x: 0, y: -0.5, z: 0))
		optionPanel.addChildNode(outline4)
		
		self.addChildNode(optionPanel)
		
	}
	
	func touch()
	{
		update()
	}
	
	func update()
	{
	}
	
	required init(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}