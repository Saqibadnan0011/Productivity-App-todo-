//
//  AuthView.swift
//  Productivity (Todo)
//
//  Created by apple on 09/07/2023.
//

import SwiftUI

struct AuthView: View {
    //login or sign in
    //test
    @State private var currentViewShowing: String = "Login"
    
    var body: some View {
        if (currentViewShowing == "Login") {
            LoginView(currenShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .leading))
        }
        else {
            SignupView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
