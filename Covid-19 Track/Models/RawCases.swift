//
//  RawCases.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 11/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rawCases = try? newJSONDecoder().decode(RawCases.self, from: jsonData)

import Foundation

// MARK: - RawCases
struct RawCases: Codable {
    let rawData: [RawDatum]

    enum CodingKeys: String, CodingKey {
        case rawData = "raw_data"
    }
}

// MARK: - RawDatum
struct RawDatum: Codable {
    let agebracket, backupnotes, contractedfromwhichpatientsuspected: String
    let currentstatus: Currentstatus
    let dateannounced: String
    let detectedcity, detecteddistrict: String
    let detectedstate: Detectedstate
    let estimatedonsetdate: String
    let gender: Gender
    let nationality: Nationality
    let notes, patientnumber: String
    let source1: String
    let source2: String
    let source3: String
    let statecode: Statecode
    let statepatientnumber: String
    let statuschangedate: String
    let typeoftransmission: Typeoftransmission
}

enum Currentstatus: String, Codable {
    case deceased = "Deceased"
    case empty = ""
    case hospitalized = "Hospitalized"
    case migrated = "Migrated"
    case recovered = "Recovered"
}

enum Detectedstate: String, Codable {
    case andamanAndNicobarIslands = "Andaman and Nicobar Islands"
    case andhraPradesh = "Andhra Pradesh"
    case arunachalPradesh = "Arunachal Pradesh"
    case assam = "Assam"
    case bihar = "Bihar"
    case chandigarh = "Chandigarh"
    case chhattisgarh = "Chhattisgarh"
    case dadraAndNagarHaveli = "Dadra and Nagar Haveli"
    case delhi = "Delhi"
    case empty = ""
    case goa = "Goa"
    case gujarat = "Gujarat"
    case haryana = "Haryana"
    case himachalPradesh = "Himachal Pradesh"
    case jammuAndKashmir = "Jammu and Kashmir"
    case jharkhand = "Jharkhand"
    case karnataka = "Karnataka"
    case kerala = "Kerala"
    case ladakh = "Ladakh"
    case madhyaPradesh = "Madhya Pradesh"
    case maharashtra = "Maharashtra"
    case manipur = "Manipur"
    case mizoram = "Mizoram"
    case odisha = "Odisha"
    case puducherry = "Puducherry"
    case punjab = "Punjab"
    case rajasthan = "Rajasthan"
    case tamilNadu = "Tamil Nadu"
    case telangana = "Telangana"
    case tripura = "Tripura"
    case uttarPradesh = "Uttar Pradesh"
    case uttarakhand = "Uttarakhand"
    case westBengal = "West Bengal"
}

enum Gender: String, Codable {
    case empty = ""
    case f = "F"
    case m = "M"
}

enum Nationality: String, Codable {
    case canada = "Canada"
    case empty = ""
    case india = "India"
    case indonesia = "Indonesia"
    case italy = "Italy"
    case malaysia = "Malaysia"
    case myanmar = "Myanmar"
    case phillipines = "Phillipines"
    case thailand = "Thailand"
    case tibet = "Tibet"
    case unitedKingdom = "United Kingdom"
    case unitedStatesOfAmerica = "United States of America"
}

enum Statecode: String, Codable {
    case an = "AN"
    case ap = "AP"
    case ar = "AR"
    case br = "BR"
    case ch = "CH"
    case ct = "CT"
    case dl = "DL"
    case dn = "DN"
    case empty = ""
    case ga = "GA"
    case gj = "GJ"
    case hp = "HP"
    case hr = "HR"
    case jh = "JH"
    case jk = "JK"
    case ka = "KA"
    case kl = "KL"
    case la = "LA"
    case mh = "MH"
    case mn = "MN"
    case mp = "MP"
    case mz = "MZ"
    case or = "OR"
    case pb = "PB"
    case py = "PY"
    case rj = "RJ"
    case statecodeAS = "AS"
    case tg = "TG"
    case tn = "TN"
    case tr = "TR"
    case up = "UP"
    case ut = "UT"
    case wb = "WB"
}

enum Typeoftransmission: String, Codable {
    case empty = ""
    case imported = "Imported"
    case local = "Local"
    case tbd = "TBD"
}
