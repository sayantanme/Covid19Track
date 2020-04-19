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
        //dashboardTableview.rx.setDataSource(self).disposed(by: disBag)
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
        
        dashboardVM.statewise.bind(to: dashboardTableview.rx.items(cellIdentifier: "stateData", cellType: RecordCell.self)) {row,item,cell in
            cell.setupCell(st: item)
        }
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
        dashboardVM.overallData.asObservable().subscribe(onNext: { (statewise) in
            guard statewise.count > 0 else {
                return
            }
            if let countryData = statewise.first, let cData = countryData {
                DispatchQueue.main.async {
                    self.dashboardTopView.deltaIncreaseConfirmedField.text = "[+\(cData.deltaconfirmed)]"
                    self.dashboardTopView.todaysConfirmedCount.text = cData.confirmed
                    
                    self.dashboardTopView.deltaIncreaseRecovdField.text = "[+\(cData.deltarecovered)]"
                    self.dashboardTopView.todaysRecovdCount.text = cData.recovered
                    
                    self.dashboardTopView.deltaIncreaseDcsdField.text = "[+\(cData.deltadeaths)]"
                    self.dashboardTopView.todaysDcsdCount.text = cData.deaths
                    
                    self.dashboardTopView.todayActiveCount.text = cData.active
                    
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

extension DashboardViewController : UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 290
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return dashboardTopView
        }
        let stateHeader = UINib(nibName: "DashboardHeader", bundle: nil).instantiate(withOwner: self, options: nil) as? [UIView]
        return stateHeader?.filter { $0 as? DashboardHeader == nil } .first
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        dashboardTableview.reloadData()
    }
}
