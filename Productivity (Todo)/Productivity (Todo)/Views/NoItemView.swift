//
//  NoItemView.swift
//  Productivity (Todo)
//
//  Created by apple on 21/07/2023.
//

import SwiftUI

struct NoItemView: View {

    @State var animate: Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 0.2, green: 0.2, blue: 0.2))]
    }
    
    var body: some View {
        ScrollView {
                VStack(spacing: 20) {
                        Text("There is no items!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                        Text("Are you Productive person! if yes then you should click the add button and add your daily task to be more productive in your life")
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                            .padding(.bottom, 20)
                    //Spacer()
                    
                    NavigationLink(destination: Addview(), label: {
                        Text("Add items".uppercased())
                            .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 295, height: 64)
                            .background(animate ? Color.init(red: 0.2, green: 0.2, blue: 0.2)  :
                                Color.init(red: 0.25, green: 0.25, blue: 0.25))
                            .cornerRadius(10)
                    })
                    //.padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? Color.init(red: 0.2, green: 0.2, blue: 0.2).opacity(0.7)  :
                        Color.init(red: 0.25, green: 0.25, blue: 0.25).opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                    }
                    .multilineTextAlignment(.center)
                    .padding(50)
                    .onAppear(perform: addAnimation)
        }
        .background(Color(red: 0.64, green: 0.44, blue: 0.34).edgesIgnoringSafeArea(.all))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Add Task")
                .foregroundColor(Color(red: 0.64, green: 0.44, blue: 0.34))
        }
    }
}
