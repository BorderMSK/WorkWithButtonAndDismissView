//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .frame(width: 200, height: 40)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(name.count < 3 ? .red: .green )
                    
            }
            VStack {
                Button(action: registerUser, label: {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                    
                })
                .disabled(self.name.count >= 3 ? false: true)
            }
        }
    }
}

extension RegisterView {
    func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(UserManager())
    }
}
