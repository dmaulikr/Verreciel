//  Created by Devine Lu Linvega on 2015-07-18.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import UIKit
import QuartzCore
import SceneKit
import Foundation

class CoreUniverse : SCNNode
{
	override init()
	{
		super.init()
		
		print("@ UNIVERSE | Init")
		
		addLoiqe()
		addUsul()
		addnevic()
		addValen()
		addSenni()
		addFalvet()
		
		connectPaths()
		connectPortals()
	}
	
	override func _start()
	{
		unlock(.loiqe)
		
		valen_bank.port1.addEvent(items.loiqePortalKey)
		valen_bank.port1.addEvent(items.record1)
		
		valen_bank.port2.addEvent(items.waste)
		valen_bank.port3.addEvent(items.cell2)
	}
	
	// MARK: Loiqe -
	
	var loiqe = locations.loiqe.star()
	var loiqe_spawn = locations.loiqe.spawn()
	var loiqe_harvest = locations.loiqe.harvest()
	var loiqe_city = locations.loiqe.city()
	var loiqe_horadric = locations.loiqe.horadric()
	var loiqe_portal = locations.loiqe.portal()
	var loiqe_satellite = locations.loiqe.satellite()
	var loiqe_port = locations.loiqe.port()
	var loiqe_cargo = locations.loiqe.cargo()
	
	func addLoiqe()
	{
		addChildNode(loiqe)
		addChildNode(loiqe_spawn)
		addChildNode(loiqe_harvest)
		addChildNode(loiqe_city)
		addChildNode(loiqe_horadric)
		addChildNode(loiqe_portal)
		addChildNode(loiqe_satellite)
		addChildNode(loiqe_port)
		addChildNode(loiqe_cargo)
	}
	
	// MARK: Usul -
	
	var usul = locations.usul.star()
	var usul_station = locations.usul.station()
	var usul_portal = locations.usul.portal()
	var usul_satellite = locations.usul.satellite()
	
	func addUsul()
	{
		addChildNode(usul)
		addChildNode(usul_station)
		addChildNode(usul_portal)
		addChildNode(usul_satellite)
	}
	
	// MARK: Valen -
	
	var valen = locations.valen.star()
	var valen_bank = locations.valen.bank()
	var valen_station = locations.valen.station()
	var valen_portal = locations.valen.portal()
	var valen_satellite = locations.valen.satellite()
	var valen_harvest = locations.valen.harvest()
	var valen_port = locations.valen.port()
	var valen_cargo = locations.valen.cargo()
	
	func addValen()
	{
		addChildNode(valen)
		addChildNode(valen_bank)
		addChildNode(valen_station)
		addChildNode(valen_portal)
		addChildNode(valen_satellite)
		addChildNode(valen_harvest)
		addChildNode(valen_port)
		addChildNode(valen_cargo)
	}
	
	// MARK: nevic -
	
	var nevic = locations.nevic.star()
	var nevic_station = locations.nevic.station()
	var nevic_satellite = locations.nevic.satellite()
	var nevic_beacon = locations.nevic.beacon()
	var nevic_cargo = locations.nevic.cargo()
	var nevic_city = locations.nevic.city()
	var nevic_port = locations.nevic.port()
	
	func addnevic()
	{
		addChildNode(nevic)
		addChildNode(nevic_station)
		addChildNode(nevic_satellite)
		addChildNode(nevic_beacon)
		addChildNode(nevic_cargo)
		addChildNode(nevic_city)
		addChildNode(nevic_port)
	}
	
	// MARK: Senni -
	
	var senni = locations.senni.star()
	var senni_city = locations.senni.city()
	var senni_station = locations.senni.portal()
	var senni_port = locations.senni.port()
	var senni_portal = locations.senni.portal()
	var senni_service = locations.senni.service()
	var senni_spawn = locations.senni.spawn()
	
	func addSenni()
	{
		addChildNode(senni)
		addChildNode(senni_city)
		addChildNode(senni_station)
		addChildNode(senni_port)
		addChildNode(senni_portal)
		addChildNode(senni_service)
		addChildNode(senni_spawn)
	}
	
	// MARK: Falvet -
	
	var falvet = locations.falvet.star()
	var falvet_toUsul = locations.falvet.toUsul()
	var falvet_toSenni = locations.falvet.toSenni()
	var falvet_toValen = locations.falvet.toValen()
	var falvet_toLoiqe = locations.falvet.toLoiqe()
	
	var falvet_service1 = locations.falvet.service1()
	var falvet_service2 = locations.falvet.service2()
	var falvet_service3 = locations.falvet.service3()
	var falvet_service4 = locations.falvet.service4()
	
	func addFalvet()
	{
		addChildNode(falvet)
		addChildNode(falvet_toUsul)
		addChildNode(falvet_toSenni)
		addChildNode(falvet_toValen)
		addChildNode(falvet_toLoiqe)
		
		addChildNode(falvet_service1)
		addChildNode(falvet_service2)
		addChildNode(falvet_service3)
		addChildNode(falvet_service4)
	}

	// MARK: Misc -
	
	func connectPortals()
	{
		usul_portal.addPortals(loiqe_portal, left: senni_portal)
		senni_portal.addPortals(usul_portal, left: valen_portal)
		valen_portal.addPortals(senni_portal, left: loiqe_portal)
		loiqe_portal.addPortals(valen_portal, left: usul_portal)
	}
	
	func connectPaths()
	{
		loiqe_city.connect(loiqe_satellite)
		loiqe_satellite.connect(loiqe_portal)
		loiqe_horadric.connect(loiqe_satellite)
		
		nevic_city.connect(nevic_satellite)
		nevic_satellite.connect(nevic_station)
		nevic_beacon.connect(nevic_cargo)
		nevic_cargo.connect(nevic_station)
		
		falvet_toUsul.connect(usul_portal)
		falvet_toValen.connect(valen_portal)
		falvet_toSenni.connect(senni_portal)
		
		valen_satellite.connect(valen_bank)
		valen_bank.connect(valen_portal)
		valen_station.connect(valen_portal)
		valen_harvest.connect(valen_station)
		
		falvet_service1.connect(falvet_toValen)
		falvet_service2.connect(falvet_toSenni)
		falvet_service3.connect(falvet_toLoiqe)
		falvet_service4.connect(falvet_toUsul)
		
		senni_port.connect(senni_service)
		senni_spawn.connect(senni_portal)
		senni_service.connect(senni_portal)
		senni_portal.connect(senni_portal)
	}
	
	func unlock(system:Systems)
	{
		print("! SYSTEM(Unlock) \(system)")
		for location in self.childNodes {
			let location = location as! Location
			if location.system != system { continue }
			print("  > \(location.name!)")
			location.isAccessible = true
		}
	}
	
	// Default
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}