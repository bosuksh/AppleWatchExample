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
    
    override func awake(withContext context: Any?) {
      
      flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
      for index in 0 ..< flightsTable.numberOfRows {
        guard let controller = flightsTable.rowController(at: index) as? FlightRowController else {return}
        controller.flight = flights[index]
      }
    }
  
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    let flight = flights[rowIndex]
    presentController(withName: "Flight", context: flight)
    
  }
}
