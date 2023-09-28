//
//  LoginView.swift
//  Productivity (Todo)
//
//  Created by apple on 09/07/2023.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var currenShowingView: String
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    
    
    private func isValidPassword(_password: String) -> Bool {
        //mini 6 characater
        //1 special character
        //1 special expression
        //Pas$word
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack{
            Color(red: 0.2, green: 0.2, blue: 0.2)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack {
                    TextField("Email", text: $email)
                    
                    Spacer()
                    
                    if(email.count != 0) {
                        Image(systemName: email.isValidEmail() ? "checkmark": "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                        .frame(width: 350, height: 64)
                )
                
                .padding()
                
                HStack {
                    SecureField("Password", text: $password)
                    
                    Spacer()
                    
                    if (password.count != 0) {
                        Image(systemName: isValidPassword(_password: password) ? "checkmark": "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                            .padding()
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                        .frame(width: 350, height: 64)
                )
                
                .padding()
                
                Spacer()
                Button{
                    isLoggedIn = true
                } label: {
                    Text("Log in")
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                        .bold()
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 64)
                                .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                        )
                    
                }//button,label
                .fullScreenCover(isPresented: $isLoggedIn, content: {
                    ListView()
                })
                Spacer()
                Spacer()
                
                    Button(action: {
                        withAnimation {
                            self.currenShowingView = "Signup"
                        }
                    }) {
                        Text("Don't have an Account?")
                            .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                            .opacity(0.8)
                        Text("Sign in")
                            .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                            .bold()
                        
                    }
            }//vstack
        }//zstack
    }
}

