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
                VStack (spacing:16){
                    Picker(selection: $isLoginMode , label: Text("Piker here")){
                        Text("Login")
                            .tag(true)
                        
                        Text("cerate accounts")
                            .tag(false)
                        
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    if !isLoginMode {
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }
                    
                    Group {
                        HStack(spacing: 20){
                            
                                TextField("First Name", text: $email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .padding(.vertical,10)
                                        .padding(.horizontal,15)
                                        .background(Color.white)
                                        .cornerRadius(50)

                            
                           
                                TextField("First Name", text: $email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                            
                            
                            .padding(.vertical,10)
                                .padding(.horizontal,15)
                                .background(Color.white)
                                .cornerRadius(50)

                            
                        }
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.vertical,10)
                                .padding(.horizontal,15)
                                .background(Color.white)
                                .cornerRadius(50)


                        SecureField("Password", text: $password)
                            .padding(.vertical,10)
                                .padding(.horizontal,15)
                                .background(Color.white)
                                .cornerRadius(50)
                        
                    }

                    
                    Button {
                        handleAction()
                        
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
                        .cornerRadius(50)
                        .padding(.top,20)

                        
                        
                    }
                    
                    
                }
                .padding()
                
                .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            }
            .background(Color(.init(white: 0, alpha: 0.05))
                .ignoresSafeArea())
        }
    }
    private func handleAction() {
        if isLoginMode {
            print("Should log into Firebase with existing credentials")
        } else {
            print("Register a new account inside of Firebase Auth and then store image in Storage somehow....")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
