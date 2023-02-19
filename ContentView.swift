//
//  ContentView.swift
//  Chat App Firebase
//
//  Created by Dinith Hasaranga on 2023-02-19.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginMode = false
    @State var isNameValid = false
    @State var isEmailValid = false

    
    @State var email = ""
    @State var password = ""
    @State var name = ""

    func validateName(_ name: String) -> Bool {
        let nameRegex = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
        return !name.isEmpty && name.range(of: nameRegex, options: .regularExpression) != nil
    }
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return !email.isEmpty && email.range(of: emailRegex, options: .regularExpression) != nil
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing:10){
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
                                .padding(20)
                                .background(Color.white)
                                .cornerRadius(100)
                            
                        }
                   
                    
                    Group {
                       
                        
                        TextField("Name", text: $name)
                        
                            .autocapitalization(.words)
                            .overlay(
                                    HStack {
                                        Spacer()
                                        Image(systemName: isNameValid ? "checkmark.circle.fill" : "checkmark.circle.fill")
                                            .foregroundColor(isNameValid ? .green : .gray)
                                            .padding(.trailing, 5)
                                    }
                                )
                                .onChange(of: name) { newValue in
                                    isNameValid = validateName(newValue)
                                }
                        TextField("Email", text: $email)
                        
                             .keyboardType(.emailAddress)
                             .autocapitalization(.none)
                             .overlay(
                                     HStack {
                                         Spacer()
                                         Image(systemName: isEmailValid ? "checkmark.circle.fill" : "checkmark.circle.fill")
                                             .foregroundColor(isEmailValid ? .green : .gray)
                                             .padding(.trailing, 5)
                                     }
                                 )
                                 .onChange(of: email) { emailValue in
                                     isEmailValid = validateEmail(emailValue)
                                 }
                        

                        SecureField("Password", text :$password)

                       
                       
                        
                        
                    }
                    .padding(.vertical,10)
                        .padding(.horizontal,15)
                        .background(Color.white)
                        .cornerRadius(50)
                   
                    
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
