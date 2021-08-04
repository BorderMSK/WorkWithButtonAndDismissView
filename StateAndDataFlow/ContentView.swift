//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by 18992227 on 02.08.2021.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var timer = TimerCounter()
	@EnvironmentObject var user: UserManager

	var body: some View {
		VStack {
			Text("Hi! \(user.name)")
				.font(.largeTitle)
				.offset(x: 0, y: 100)

			Text("\(timer.counter)")
				.font(.largeTitle)
				.offset(x: 0, y: 200)

			Spacer()

            ButtonView(timer: timer, isRegistered: $user.isRegistered)

			Spacer()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView().environmentObject(UserManager())
    }
}

struct ButtonView: View {
	@ObservedObject var timer: TimerCounter
    @Binding var isRegistered: Bool
	var body: some View {
		Button(
			action: { self.timer.startTimer() },
			label: {
				Text("\(timer.buttonTitle)")
					.font(.title)
					.fontWeight(.bold)
					.foregroundColor(Color.white)
			}
		)
		.frame(width: 200, height: 60)
		.background(Color.red)
		.cornerRadius(20)
		.overlay(
			RoundedRectangle(cornerRadius: 20, style: .continuous)
				.stroke(Color.black, lineWidth: 4)
		)
        
        Spacer()
        
        Button(
            action: {self.isRegistered = false},
            label: {
                Text("Log out")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
        )
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
	}
}
