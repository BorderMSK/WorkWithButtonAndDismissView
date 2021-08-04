//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct StarterView: View {
	@EnvironmentObject var user: UserManager

    var body: some View {
		Group {
			if user.isRegistered {
				ContentView()
			} else {
				RegisterView()
			}
		}
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
		StarterView().environmentObject(UserManager())
    }
}
