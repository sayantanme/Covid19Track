//
//  StateWise.swift
//  Covid-19 Track
//
//  Created by Sayantan Chakraborty on 11/04/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stateWise = try? newJSONDecoder().decode(StateWise.self, from: jsonData)


// MARK: - StateWise
struct StateWise: Codable {
    let kerala: Districts
    let delhi: Delhi
    let telangana, rajasthan, haryana, uttarPradesh: Districts
    let ladakh: Ladakh
    let tamilNadu, jammuAndKashmir, karnataka, maharashtra: Districts
    let punjab, Districts: Districts
    let uttarakhand: Uttarakhand
    let odisha: Odisha
    let puducherry: Puducherry
    let westBengal: WestBengal
    let chandigarh: Chandigarh
    let chhattisgarh: Chhattisgarh
    let gujarat: Districts
    let himachalPradesh: HimachalPradesh
    let madhyaPradesh, bihar: Districts
    let manipur: Manipur
    let mizoram: Mizoram
    let goa: Goa
    let andamanAndNicobarIslands: AndamanAndNicobarIslands
    let jharkhand: Jharkhand
    let assam: Districts
    let arunachalPradesh: ArunachalPradesh
    let dadraAndNagarHaveli: DadraAndNagarHaveli
    let tripura: Tripura

    enum CodingKeys: String, CodingKey {
        case kerala = "Kerala"
        case delhi = "Delhi"
        case telangana = "Telangana"
        case rajasthan = "Rajasthan"
        case haryana = "Haryana"
        case uttarPradesh = "Uttar Pradesh"
        case ladakh = "Ladakh"
        case tamilNadu = "Tamil Nadu"
        case jammuAndKashmir = "Jammu and Kashmir"
        case karnataka = "Karnataka"
        case maharashtra = "Maharashtra"
        case punjab = "Punjab"
        case Districts = "Andhra Pradesh"
        case uttarakhand = "Uttarakhand"
        case odisha = "Odisha"
        case puducherry = "Puducherry"
        case westBengal = "West Bengal"
        case chandigarh = "Chandigarh"
        case chhattisgarh = "Chhattisgarh"
        case gujarat = "Gujarat"
        case himachalPradesh = "Himachal Pradesh"
        case madhyaPradesh = "Madhya Pradesh"
        case bihar = "Bihar"
        case manipur = "Manipur"
        case mizoram = "Mizoram"
        case goa = "Goa"
        case andamanAndNicobarIslands = "Andaman and Nicobar Islands"
        case jharkhand = "Jharkhand"
        case assam = "Assam"
        case arunachalPradesh = "Arunachal Pradesh"
        case dadraAndNagarHaveli = "Dadra and Nagar Haveli"
        case tripura = "Tripura"
    }
}

// MARK: - AndamanAndNicobarIslands
struct AndamanAndNicobarIslands: Codable {
    let districtData: AndamanAndNicobarIslandsDistrictData
}

// MARK: - AndamanAndNicobarIslandsDistrictData
struct AndamanAndNicobarIslandsDistrictData: Codable {
    let southAndaman, Updates, unknown: Updates

    enum CodingKeys: String, CodingKey {
        case southAndaman = "South Andaman"
        case Updates = "North and Middle Andaman"
        case unknown = "Unknown"
    }
}

// MARK: - Updates
struct Updates: Codable {
    let confirmed: Int
    let lastupdatedtime: String
    let delta: Delta
}

// MARK: - Delta
struct Delta: Codable {
    let confirmed: Int
}

// MARK: - Districts
struct Districts: Codable {
    let districtData: [String: Updates]
}

// MARK: - ArunachalPradesh
struct ArunachalPradesh: Codable {
    let districtData: ArunachalPradeshDistrictData
}

// MARK: - ArunachalPradeshDistrictData
struct ArunachalPradeshDistrictData: Codable {
    let lohit: Updates

    enum CodingKeys: String, CodingKey {
        case lohit = "Lohit"
    }
}

// MARK: - Chandigarh
struct Chandigarh: Codable {
    let districtData: ChandigarhDistrictData
}

// MARK: - ChandigarhDistrictData
struct ChandigarhDistrictData: Codable {
    let chandigarh: Updates

    enum CodingKeys: String, CodingKey {
        case chandigarh = "Chandigarh"
    }
}

// MARK: - Chhattisgarh
struct Chhattisgarh: Codable {
    let districtData: ChhattisgarhDistrictData
}

// MARK: - ChhattisgarhDistrictData
struct ChhattisgarhDistrictData: Codable {
    let raipur, rajnandgaon, bilaspur, durg: Updates
    let korba: Updates

    enum CodingKeys: String, CodingKey {
        case raipur = "Raipur"
        case rajnandgaon = "Rajnandgaon"
        case bilaspur = "Bilaspur"
        case durg = "Durg"
        case korba = "Korba"
    }
}

// MARK: - DadraAndNagarHaveli
struct DadraAndNagarHaveli: Codable {
    let districtData: DadraAndNagarHaveliDistrictData
}

// MARK: - DadraAndNagarHaveliDistrictData
struct DadraAndNagarHaveliDistrictData: Codable {
    let unknown: Updates

    enum CodingKeys: String, CodingKey {
        case unknown = "Unknown"
    }
}

// MARK: - Delhi
struct Delhi: Codable {
    let districtData: DelhiDistrictData
}

// MARK: - DelhiDistrictData
struct DelhiDistrictData: Codable {
    let eastDelhi, southWestDelhi, westDelhi, northDelhi: Updates
    let newDelhi, southDelhi, northEastDelhi, northWestDelhi: Updates
    let unknown: Updates

    enum CodingKeys: String, CodingKey {
        case eastDelhi = "East Delhi"
        case southWestDelhi = "South West Delhi"
        case westDelhi = "West Delhi"
        case northDelhi = "North Delhi"
        case newDelhi = "New Delhi"
        case southDelhi = "South Delhi"
        case northEastDelhi = "North East Delhi"
        case northWestDelhi = "North West Delhi"
        case unknown = "Unknown"
    }
}

// MARK: - Goa
struct Goa: Codable {
    let districtData: GoaDistrictData
}

// MARK: - GoaDistrictData
struct GoaDistrictData: Codable {
    let northGoa, unknown: Updates

    enum CodingKeys: String, CodingKey {
        case northGoa = "North Goa"
        case unknown = "Unknown"
    }
}

// MARK: - HimachalPradesh
struct HimachalPradesh: Codable {
    let districtData: HimachalPradeshDistrictData
}

// MARK: - HimachalPradeshDistrictData
struct HimachalPradeshDistrictData: Codable {
    let kangra, una, unknown, sirmaur: Updates

    enum CodingKeys: String, CodingKey {
        case kangra = "Kangra"
        case una = "Una"
        case unknown = "Unknown"
        case sirmaur = "Sirmaur"
    }
}

// MARK: - Jharkhand
struct Jharkhand: Codable {
    let districtData: JharkhandDistrictData
}

// MARK: - JharkhandDistrictData
struct JharkhandDistrictData: Codable {
    let ranchi, hazaribagh, bokaro, kodarma: Updates

    enum CodingKeys: String, CodingKey {
        case ranchi = "Ranchi"
        case hazaribagh = "Hazaribagh"
        case bokaro = "Bokaro"
        case kodarma = "Kodarma"
    }
}

// MARK: - Ladakh
struct Ladakh: Codable {
    let districtData: LadakhDistrictData
}

// MARK: - LadakhDistrictData
struct LadakhDistrictData: Codable {
    let leh, kargil: Updates

    enum CodingKeys: String, CodingKey {
        case leh = "Leh"
        case kargil = "Kargil"
    }
}

// MARK: - Manipur
struct Manipur: Codable {
    let districtData: ManipurDistrictData
}

// MARK: - ManipurDistrictData
struct ManipurDistrictData: Codable {
    let imphalWest, unknown: Updates

    enum CodingKeys: String, CodingKey {
        case imphalWest = "Imphal West"
        case unknown = "Unknown"
    }
}

// MARK: - Mizoram
struct Mizoram: Codable {
    let districtData: MizoramDistrictData
}

// MARK: - MizoramDistrictData
struct MizoramDistrictData: Codable {
    let aizawl: Updates

    enum CodingKeys: String, CodingKey {
        case aizawl = "Aizawl"
    }
}

// MARK: - Odisha
struct Odisha: Codable {
    let districtData: OdishaDistrictData
}

// MARK: - OdishaDistrictData
struct OdishaDistrictData: Codable {
    let khordha, bhadrak, cuttack, puri: Updates
    let jajapur, kalahandi, kendrapara, dhenkanal: Updates
    let unknown: Updates

    enum CodingKeys: String, CodingKey {
        case khordha = "Khordha"
        case bhadrak = "Bhadrak"
        case cuttack = "Cuttack"
        case puri = "Puri"
        case jajapur = "Jajapur"
        case kalahandi = "Kalahandi"
        case kendrapara = "Kendrapara"
        case dhenkanal = "Dhenkanal"
        case unknown = "Unknown"
    }
}

// MARK: - Puducherry
struct Puducherry: Codable {
    let districtData: PuducherryDistrictData
}

// MARK: - PuducherryDistrictData
struct PuducherryDistrictData: Codable {
    let mahe, puducherry: Updates

    enum CodingKeys: String, CodingKey {
        case mahe = "Mahe"
        case puducherry = "Puducherry"
    }
}

// MARK: - Tripura
struct Tripura: Codable {
    let districtData: TripuraDistrictData
}

// MARK: - TripuraDistrictData
struct TripuraDistrictData: Codable {
    let gomati, northTripura: Updates

    enum CodingKeys: String, CodingKey {
        case gomati = "Gomati"
        case northTripura = "North Tripura"
    }
}

// MARK: - Uttarakhand
struct Uttarakhand: Codable {
    let districtData: UttarakhandDistrictData
}

// MARK: - UttarakhandDistrictData
struct UttarakhandDistrictData: Codable {
    let dehradun, pauriGarhwal, udhamSinghNagar, nainital: Updates
    let haridwar, almora, unknown: Updates

    enum CodingKeys: String, CodingKey {
        case dehradun = "Dehradun"
        case pauriGarhwal = "Pauri Garhwal"
        case udhamSinghNagar = "Udham Singh Nagar"
        case nainital = "Nainital"
        case haridwar = "Haridwar"
        case almora = "Almora"
        case unknown = "Unknown"
    }
}

// MARK: - WestBengal
struct WestBengal: Codable {
    let districtData: WestBengalDistrictData
}

// MARK: - WestBengalDistrictData
struct WestBengalDistrictData: Codable {
    let kolkata, north24Parganas, nadia, medinipurEast: Updates
    let kalimpong, hooghly, howrah, south24Parganas: Updates
    let unknown: Updates

    enum CodingKeys: String, CodingKey {
        case kolkata = "Kolkata"
        case north24Parganas = "North 24 Parganas"
        case nadia = "Nadia"
        case medinipurEast = "Medinipur East"
        case kalimpong = "Kalimpong"
        case hooghly = "Hooghly"
        case howrah = "Howrah"
        case south24Parganas = "South 24 Parganas"
        case unknown = "Unknown"
    }
}
