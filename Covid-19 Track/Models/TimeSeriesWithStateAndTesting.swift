//
//  TimeSeriesWithStateAndTesting.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 11/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation


import Foundation

// MARK: - Welcome
struct TimeSeriesWithStateAndTesting: Codable {
    let casesTimeSeries: [CasesTimeSery]
    let statewise: [Statewise]
    let tested: [Tested]

    enum CodingKeys: String, CodingKey {
        case casesTimeSeries = "cases_time_series"
        case statewise, tested
    }
}

// MARK: - CasesTimeSery
struct CasesTimeSery: Codable {
    let dailyconfirmed, dailydeceased, dailyrecovered, date: String
    let totalconfirmed, totaldeceased, totalrecovered: String
}

// MARK: - Statewise
struct Statewise: Codable {
    let active, confirmed, deaths, deltaconfirmed: String
    let deltadeaths, deltarecovered, lastupdatedtime, recovered: String
    let state, statecode: String
}

// MARK: - Tested
struct Tested: Codable {
    let positivecasesfromsamplesreported, samplereportedtoday: String
    let source: String
    let testsconductedbyprivatelabs, totalindividualstested, totalpositivecases, totalsamplestested: String
    let updatetimestamp: String
}
