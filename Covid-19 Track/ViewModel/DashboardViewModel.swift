//
//  DashboardViewModel.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 11/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Constants {
    static let confirmedCases = "ConfirmedCases"
    static let activeCases = "ActiveCases"
    static let recoveredCases = "RecoveredCases"
    static let deceasedCases = "DeceasedCases"
    
    static let cRed = 0xDD444A
    static let cBlue = 0x017FF7
    static let cGreen = 0x01A753
    static let cGrey = 0x6D767D
    static let cPurple = 0x423CA8
    
    static let suffixLength = 30
}

struct DashboardViewModel {
    let bag = DisposeBag()
    let caseTimeSeries = BehaviorRelay<[CasesTimeSery?]>(value: [])
    let testingData = BehaviorRelay<[Tested?]>(value: [])
    let statewise = BehaviorRelay<[Statewise?]>(value: [])
    let overallData = BehaviorRelay<[Statewise?]>(value: [])
    let graphData = BehaviorRelay<[String: [Int]]>(value: [:])
    let lastUpdatedTime = BehaviorRelay<[String]>(value: [])
    
    func getOverViewData(url: String){
        
        let response = Observable.from([url])
            .map { (urlString) -> URL in
                return URL(string: "\(url)")!
        }
        .distinctUntilChanged()
        .map { url -> URLRequest in
            return URLRequest(url: url)
        }
        .flatMap { request -> Observable<(response:HTTPURLResponse, data:Data)> in
            return URLSession.shared.rx.response(request: request)
        }
        
        response
            .filter { (response, data)  in
                return 200..<300 ~= response.statusCode
        }.map { data -> TimeSeriesWithStateAndTesting in
            //let fData = data.data.fla
            return try! JSONDecoder().decode(TimeSeriesWithStateAndTesting.self, from: data.data)
        }.map { data -> [TimeSeriesWithStateAndTesting] in
            return [data]
        }.filter { data -> Bool in
            data.count > 0
        }
        .subscribe(onNext: { (items) in
            self.setUpRelays(items: items)
        })
            .disposed(by: bag)
    }
    
    fileprivate func setUpRelays(items: [TimeSeriesWithStateAndTesting]) {
        if let it = items.first {
            var confirmedCases = [Int]()
            var activeCases = [Int]()
            var recoveredCases = [Int]()
            var dcsdCases = [Int]()
            it.casesTimeSeries.forEach { (item) in
                let totConfirmed = Int(item.dailyconfirmed) ?? 0
                let totDecsd = Int(item.dailydeceased) ?? 0
                let totRecvd = Int(item.dailyrecovered) ?? 0
                confirmedCases.append(Int(item.dailyconfirmed) ?? 0)
                activeCases.append(totConfirmed - totDecsd - totRecvd)
                recoveredCases.append(Int(item.dailyrecovered) ?? 0)
                dcsdCases.append(Int(item.dailydeceased) ?? 0)
            }
            self.caseTimeSeries.accept([it.casesTimeSeries.last])
            self.testingData.accept([it.tested.last])
            self.overallData.accept([it.statewise.first])
            self.statewise.accept(Array(it.statewise.dropFirst()))
            self.graphData.accept([Constants.confirmedCases:confirmedCases.dropLast().suffix(Constants.suffixLength), Constants.activeCases: activeCases.dropLast().suffix(Constants.suffixLength), Constants.recoveredCases: recoveredCases.dropLast().suffix(Constants.suffixLength), Constants.deceasedCases: dcsdCases.dropLast().suffix(Constants.suffixLength)])
            
            self.lastUpdatedTime.accept([convertIntoFormat(dateString: it.statewise.first?.lastupdatedtime)])
        }
    }
    
    func convertIntoFormat(dateString: String?) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy HH:mm:ss"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy HH:mm"
        if let str = dateString , let date = dateFormatterGet.date(from: str) {
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
}
