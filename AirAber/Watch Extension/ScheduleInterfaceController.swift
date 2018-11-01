//
//  ScheduleInterfaceController.swift
//  Watch Extension
//
//  Created by 이상협 on 01/11/2018.
//  Copyright © 2018 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet weak var flightsTable: WKInterfaceTable!
    var flights = Flight.allFlights()
    var selectedIndex = 0
  
    override func awake(withContext context: Any?) {
      
      flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
      for index in 0 ..< flightsTable.numberOfRows {
        guard let controller = flightsTable.rowController(at: index) as? FlightRowController else {return}
        controller.flight = flights[index]
      }
    }
  
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    let flight = flights[rowIndex]
    let controllers = ["Flight", "CheckIn"]
    selectedIndex = rowIndex
    presentController(withNames: controllers, contexts: [flight,flight])
    
  }
  
  override func didAppear() {
    super.didAppear()
    
    guard let controller = flightsTable.rowController(at: selectedIndex) as? FlightRowController else
    { return }
    
    
    animate(withDuration: 0.35){
      if  self.flights[self.selectedIndex].checkedIn {
        controller.updateForCheckIn()
      }
      else {
        controller.cancelForCheckIn()
      }
    }
  }
}
