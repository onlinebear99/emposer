//
//  ContentView.swift
//  EmpowerDemo
//
//  Created by Brian Adams on 3/6/24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var isShowDetailView: Bool = false  // used to trigger the modal
    @State private var currentBeneficiary: Beneficiary = beneficiaries[0]  // sets the current beneficiary
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                // Mark - Title
                Text("Beneficiaries")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding()
                Spacer(minLength: 12)
            }
            // Mark - List of beneficiaries
            ScrollView {
                ForEach(beneficiaries) { beneficiary in
                    // show the BeneficiaryView for each
                    BeneficiaryView(beneficiary: beneficiary)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .onTapGesture {
                            playSound(sound: "riseup", type: "mp3")
                            isShowDetailView.toggle()
                            // update the current beneficiary upon click
                            currentBeneficiary = beneficiary
                        }
                }
            }
        }
        .sheet(isPresented: $isShowDetailView) {
            BeneficiaryDetailView(beneficiary: currentBeneficiary)
        }
    }
}

#Preview {
    ContentView()
}
