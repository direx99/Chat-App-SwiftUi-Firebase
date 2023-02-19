//
//  ContentView.swift
//  Chat App Firebase
//
//  Created by Dinith Hasaranga on 2023-02-19.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""

    
    var body: some View {
        NavigationView {
            ScrollView {
                Picker(selection: $isLoginMode , label: Text("Piker here")){
                    Text("Login")
                        .tag(true)

                    Text("cerate accounts")
                        .tag(false)


                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Button {
                }
                label : {
                    Image(systemName: "person.fill")
                        .font(.system(size: 64))
                        .padding()
                }
                
                TextField("Email", text: $email)
                TextField("Password", text: $password)

                Button {
                }
                label : {
                    HStack  {
                        Spacer()
                        Text("Create Account")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                        Spacer()
                        
                    }
                    .background(Color.blue)

                    
                }
                
                
            }
            .navigationTitle("Create Account")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
