//
//  BeneficiaryView.swift
//  EmpowerDemo
//
//  Created by Brian Adams on 3/6/24.
//

import SwiftUI

struct BeneficiaryView: View {
    // establish the beneficiary for this view
    // creates the view for a beneficiary
    let beneficiary: Beneficiary
    
    var body: some View {
        VStack {
            HStack(alignment: .top ) {
                Text("Name: ")
                Text(beneficiary.firstName)
                    .padding(.trailing, 2)
                Text(beneficiary.lastName)
                Spacer()
                
            }
            
            HStack {
                Text("Type: \(beneficiary.beneType)")
                Spacer()
                Text("Designation: \(beneficiary.designationCode == "C" ? "Contingent" : "Primary")")
                Spacer()
            }
        } 
        .padding()
        .background(Color.gray)
        .cornerRadius(12)
        
    }
}


#Preview {
    BeneficiaryView(beneficiary: beneficiaries[0])
}
