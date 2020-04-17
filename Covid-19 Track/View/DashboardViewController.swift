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
    @IBOutlet weak var dashboardTableview: UITableView!
    var dashboardTopView: DashboardHeader!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateStatewiseRecords()
        updateGraphData()
        updateDashboardData()
        updateLastUpdatedTime()
    }
    
    fileprivate func updateLastUpdatedTime() {
        dashboardVM.lastUpdatedTime.asObservable().subscribe(onNext: {(date) in
            DispatchQueue.main.async {
                self.dashboardTopView.lblLastUpdated.text = date.first
            }
        })
        .disposed(by: disBag)
    }
    
    fileprivate func updateStatewiseRecords() {
        dashboardTopView = UINib(nibName: "DashboardHeader", bundle: nil).instantiate(withOwner: self, options: nil).first as? DashboardHeader
        
        dashboardVM.caseTimeSeries.asObservable().subscribe(onNext: { (timeSeries) in
            guard timeSeries.count > 0 else {
                return
            }
            print("timeseries:\(timeSeries)")
        })
        .disposed(by: disBag)
        
        
        
        dashboardVM.testingData.asObservable().subscribe(onNext: { (testData) in
            if let freshData = testData.last {
                DispatchQueue.main.async {
                    self.dashboardTopView.latestTestedData.text = freshData?.totalsamplestested
                    self.dashboardTopView.lastTestingDate.text = self.dashboardVM.convertIntoFormat(dateString: freshData?.updatetimestamp)
                }
            }
            
        })
        .disposed(by: disBag)
        
        
    }
    
    fileprivate func updateDashboardData() {
        dashboardVM.statewise.asObservable().subscribe(onNext: { (statewise) in
            guard statewise.count > 0 else {
                return
            }
            if let countryData = statewise.first {
                DispatchQueue.main.async {
                    self.dashboardTopView.deltaIncreaseConfirmedField.text = "[+\(countryData.deltaconfirmed)]"
                    self.dashboardTopView.todaysConfirmedCount.text = countryData.confirmed
                    
                    self.dashboardTopView.deltaIncreaseRecovdField.text = "[+\(countryData.deltarecovered)]"
                    self.dashboardTopView.todaysRecovdCount.text = countryData.recovered
                    
                    self.dashboardTopView.deltaIncreaseDcsdField.text = "[+\(countryData.deltadeaths)]"
                    self.dashboardTopView.todaysDcsdCount.text = countryData.deaths
                    
                    self.dashboardTopView.todayActiveCount.text = countryData.active
                    
                    self.dashboardTopView.confirmedGrph.commonInit(dataPoints: [1,2,3], color: .red)
                }
            }
        })
        .disposed(by: disBag)
    }
    
    fileprivate func updateGraphData() {
        dashboardVM.graphData.asObservable().subscribe(onNext: { (graphData) in
            guard graphData.count > 0 else {
                return
            }
            
            DispatchQueue.main.async {
                
                
                self.dashboardTopView.confirmedGrph.commonInit(dataPoints: graphData[Constants.confirmedCases] ?? [], color: UIColor(rgb: Constants.cRed))
                
                self.dashboardTopView.activeGraph.commonInit(dataPoints: graphData[Constants.activeCases] ?? [], color: UIColor(rgb: Constants.cBlue))
                
                self.dashboardTopView.recoveredGraph.commonInit(dataPoints: graphData[Constants.recoveredCases] ?? [], color: UIColor(rgb: Constants.cGreen))
                
                self.dashboardTopView.deceasedGraph.commonInit(dataPoints: graphData[Constants.deceasedCases] ?? [], color: UIColor(rgb: Constants.cGrey))
            }
            
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

extension DashboardViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return dashboardTopView
    }
}
