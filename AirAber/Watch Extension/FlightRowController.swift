//
//  FlightRowController.swift
//  Watch Extension
//
//  Created by 이상협 on 01/11/2018.
//  Copyright © 2018 Mic Pringle. All rights reserved.
//

import WatchKit

class FlightRowController: NSObject {
  @IBOutlet var separator: WKInterfaceSeparator!
  @IBOutlet var originLabel: WKInterfaceLabel!
  @IBOutlet var destinationLabel: WKInterfaceLabel!
  @IBOutlet var flightNumberLabel: WKInterfaceLabel!
  @IBOutlet var statusLabel: WKInterfaceLabel!
  @IBOutlet var planeImage: WKInterfaceImage!

  

  var flight: Flight? {

    didSet {

      guard let flight = flight else { return }

      originLabel.setText(flight.origin)
      destinationLabel.setText(flight.destination)
      flightNumberLabel.setText(flight.number)
      if flight.onSchedule {
        statusLabel.setText("On Time")
      } else {
        statusLabel.setText("Delayed")
        statusLabel.setTextColor(.red)
      }
    }
  }
  
  func updateForCheckIn() {
    let color = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    planeImage.setTintColor(color)
    separator.setColor(color)
  }
  
  func cancelForCheckIn() {
    let color = UIColor(red: 250/255, green: 79/255, blue: 17/255, alpha: 1)
    planeImage.setTintColor(color)
    separator.setColor(color)
  }
}
