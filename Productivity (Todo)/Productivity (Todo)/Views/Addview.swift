//
//  Addview.swift
//  Productivity (Todo)
//
//  Created by apple on 18/07/2023.
//

import SwiftUI

struct Addview: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 0.64, green: 0.44, blue: 0.34))]
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 64)
                    .background(Color(UIColor.init(Color(red: 0.2, green: 0.2, blue: 0.2))))
                    .foregroundColor(Color(UIColor.init(Color(red: 0.64, green: 0.44, blue: 0.34))))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Add Task" .uppercased())
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                        .frame(width: 320, height: 64)
                        .fontWeight(.medium)
                        .background(Color(red: 0.64, green: 0.44, blue: 0.34))
                        .cornerRadius(10)
                        
                })
            }
            .padding(9)
        }
        .navigationTitle(Text("Add an Item 🖋️"))
        .background(Color(red: 0.2, green: 0.2, blue: 0.2))
        .fontWeight(.semibold)
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count  < 3 {
            alertTitle = "Your task should be at least more than 3 characters!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct Addview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Addview()
        }
        .environmentObject(ListViewModel())
    }
}
