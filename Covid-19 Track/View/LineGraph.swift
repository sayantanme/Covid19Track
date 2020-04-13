//
//  LineGraph.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 12/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import UIKit
import Charts

class LineGraph: LineChartView {

    var lineChartEntry = [ChartDataEntry]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit(dataPoints: [Int], color: UIColor) {
        
        lineChartEntry.removeAll()
        for i in 0..<dataPoints.count {
            let v = ChartDataEntry(x: Double(i), y: Double(dataPoints[i]))
            lineChartEntry.append(v)
        }
        
        let line = LineChartDataSet(entries: lineChartEntry)
        //let color = UIColor(rgb: 0xDD444A)
        line.lineWidth = 2
        line.colors = [color]
        line.drawCirclesEnabled = false
        line.mode = .cubicBezier
        
        let data = LineChartData()
        data.addDataSet(line)
        
        self.data = data
        self.leftAxis.enabled = false
        self.rightAxis.enabled = false
        self.xAxis.enabled = false
        self.legend.enabled = false
        data.setDrawValues(false)
        self.isUserInteractionEnabled = false
        
    }
}
