//
//  ContentView.swift
//  Shared
//
//  Created by 朱猛 on 2020/11/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var keyId = ""
    @State private var keyContent = ""
    @State private var issuerId = ""
    @State private var onButtonClicked = false
    
    
    var body: some View {
                
        NavigationView {
            
            VStack(spacing: 50.0){
                HStack(){
                    Text("Key Id")
                        .fontWeight(.semibold)
        
                    
                    Spacer(minLength: 20)
                    
                    TextField("Input Key Id", text:$keyId)
                }
                
                HStack(){
                    Text("Key Content")
                        .fontWeight(.semibold)
                    
                    Spacer(minLength: 20)
                    
                    TextField("Input Key Content", text:$keyContent)
                }
                
                HStack(){
                    Text("Issuer Id")
                        .fontWeight(.semibold)

                    Spacer(minLength: 20)
                    
                    TextField("Input Issuer ID", text:$issuerId)
                }
                                
                Button("Confirm", action: onConfirmButton)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                
                
            }
            .padding(.horizontal, 20.0)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .navigationTitle("Login")
            
            
        }
        
    }
    
    func onConfirmButton(){
        let appStoreConnectAPI = AppStoreConnectAPI()
        appStoreConnectAPI.generateJWTToken()
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
