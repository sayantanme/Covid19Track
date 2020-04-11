//
//  ViewController.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 08/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class DashboardViewController: UIViewController {

    let dashboardVM = DashboardViewModel()
    let disBag = DisposeBag()
    var overViewDisplayVC: OverViewDisplayViewController? {
        return children.compactMap({ $0 as? OverViewDisplayViewController }).first
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dashboardVM.caseTimeSeries.asObservable().subscribe(onNext: { (timeSeries) in
            guard timeSeries.count > 0 else {
                return
            }
            print("timeseries:\(timeSeries)")
        })
        .disposed(by: disBag)
        
        dashboardVM.statewise.asObservable().subscribe(onNext: { (statewise) in
            guard statewise.count > 0 else {
                return
            }
            if let countryData = statewise.first {
                DispatchQueue.main.async {
                    self.overViewDisplayVC?.deltaIncreaseConfirmedField.text = "[+\(countryData.deltaconfirmed)]"
                    self.overViewDisplayVC?.todaysConfirmedCount.text = countryData.confirmed
                    
                    self.overViewDisplayVC?.deltaIncreaseRecovdField.text = "[+\(countryData.deltarecovered)]"
                    self.overViewDisplayVC?.todaysRecovdCount.text = countryData.recovered
                    
                    self.overViewDisplayVC?.deltaIncreaseDcsdField.text = "[+\(countryData.deltadeaths)]"
                    self.overViewDisplayVC?.todaysDcsdCount.text = countryData.deaths
                    
                    self.overViewDisplayVC?.todayActiveCount.text = countryData.active
                    
                }
            }
        })
        .disposed(by: disBag)
        
        dashboardVM.testingData.asObservable().subscribe(onNext: { (testData) in
            guard testData.count > 0 else {
                return
            }
            print("testData:\(testData)")
        })
        .disposed(by: disBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dashboardVM.getOverViewData(url: "https://api.covid19india.org/data.json")
    }

    @IBAction func refreshDashboard(_ sender: UIBarButtonItem) {
        dashboardVM.getOverViewData(url: "https://api.covid19india.org/data.json")
    }
}

