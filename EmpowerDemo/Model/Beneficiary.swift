//
//  Beneficiary.swift
//  EmpowerDemo
//
//  Created by Brian Adams on 3/6/24.
//

import Foundation

struct Beneficiary: Codable, Identifiable {
    let id = UUID().uuidString  // Beneficiary mus conform to identifiable
    let lastName: String
    let firstName: String
    let designationCode: String
    let beneType: String
    let socialSecurityNumber: String
    let dateOfBirth: String
    let middleName: String
    let phoneNumber: String
    let beneficiaryAddress: Address
    
}

struct Address: Codable {
    let firstLineMailing: String
    let scndLineMailing: String?
    let city: String
    let zipCode: String
    let stateCode: String
    let country: String
}




