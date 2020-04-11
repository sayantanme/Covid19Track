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

struct DashboardViewModel {
    let bag = DisposeBag()
    let dashboardData = BehaviorRelay<[TimeSeriesWithStateAndTesting]>(value: [])
    let caseTimeSeries = BehaviorRelay<[CasesTimeSery?]>(value: [])
    let testingData = BehaviorRelay<[Tested?]>(value: [])
    let statewise = BehaviorRelay<[Statewise]>(value: [])

    
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
            //self.dashboardData.accept(items)
            self.caseTimeSeries.accept([items.first?.casesTimeSeries.last])
            self.testingData.accept([items.first?.tested.last])
            self.statewise.accept(items.first!.statewise)
            
        })
            .disposed(by: bag)
    }
}
