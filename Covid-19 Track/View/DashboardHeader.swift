//
//  DashboardHeader.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 12/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import UIKit

class DashboardHeader: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var deltaIncreaseConfirmedField: UILabel!
    @IBOutlet weak var todaysConfirmedCount: UILabel!
    
    @IBOutlet weak var deltaIncreaseActiveField: UILabel!
    @IBOutlet weak var todayActiveCount: UILabel!
    
    @IBOutlet weak var deltaIncreaseRecovdField: UILabel!
    @IBOutlet weak var todaysRecovdCount: UILabel!
    
    @IBOutlet weak var deltaIncreaseDcsdField: UILabel!
    @IBOutlet weak var todaysDcsdCount: UILabel!
    @IBOutlet weak var confirmedGrph: LineGraph!
    @IBOutlet weak var activeGraph: LineGraph!
    @IBOutlet weak var recoveredGraph: LineGraph!
    
    @IBOutlet weak var deceasedGraph: LineGraph!
    @IBOutlet weak var lblLastUpdated: UILabel!
    @IBOutlet weak var latestTestedData: UILabel!
    @IBOutlet weak var lastTestingDate: UILabel!
}
