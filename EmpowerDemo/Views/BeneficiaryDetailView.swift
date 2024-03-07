//
//  BeneficiaryDetailView.swift
//  EmpowerDemo
//
//  Created by Brian Adams on 3/6/24.
//

import SwiftUI

struct BeneficiaryDetailView: View {
    // environment var used to dismiss the sheet
    @Environment(\.presentationMode) var presentationMode
    var beneficiary: Beneficiary  // the beneficiary for this view
    
    // build the full address
    func fullAddress() -> String {
        var address = beneficiary.beneficiaryAddress.firstLineMailing
        if let second = beneficiary.beneficiaryAddress.scndLineMailing {
            address += "\n" + second
        }

        address += "\n" + beneficiary.beneficiaryAddress.city + ", " + beneficiary.beneficiaryAddress.stateCode + " " + beneficiary.beneficiaryAddress.zipCode
        
        return address
    }
    
    // build the proper format for date of birth
    func birthFormated() -> String {
        let characters = beneficiary.dateOfBirth.map { String($0) }
        if characters.count == 8 {
            let month = characters[0]+characters[1]
            let day = characters[2]+characters[3]
            let year = characters[4]+characters[5]+characters[6]+characters[7]
            let birth = month+"/"+day+"/"+year
            return birth
        }
        
        return ""
        
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10)  {
            HStack(alignment: .center ) {
                Spacer()
                Text(beneficiary.firstName)
                    .padding(.trailing, 2)
                Text(beneficiary.lastName)
                Spacer()
                
            }
            .foregroundColor(Color.blue)
            .font(.system(size: 28))
            .fontWeight(.bold)
            .padding()
            
            Form {
              Section(header: Text("Beneficiary Detail")) {
                FormRowView(firstItem: "Social Security Number", secondItem: beneficiary.socialSecurityNumber)
                let birth = birthFormated()  // ge the proper format for birth date
                FormRowView(firstItem: "Date of Birth", secondItem: birth)
                FormRowView(firstItem: "Phone Number", secondItem: beneficiary.phoneNumber)
           
              }
                
                Section(header: Text("Address of Beneficiary")) {
                    let full = fullAddress() // get the full address
                    Text(full)
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
          Button(action: {
              playSound(sound: "game-over", type: "mp3")
            self.presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "xmark.circle")
                  .font(.system(size: 36))
          }
          .padding(.top, 30)
          .padding(.trailing, 20)
          .accentColor(Color.secondary)
          , alignment: .topTrailing
          )
    }
}

struct FormRowView: View {
  var firstItem: String
  var secondItem: String
  
  var body: some View {
    HStack {
      Text(firstItem).foregroundColor(Color.gray)
      Spacer()
      Text(secondItem)
    }
  }
}

#Preview {
    BeneficiaryDetailView(beneficiary: beneficiaries[0])
}
