//
//  ContentView.swift
//  Swift UI Sample
//
//  Created by Gorkem Karahan on 03.05.24.
//

import LPMessagingSDK
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var transcriptViewContainer: UIViewController

    var body: some View {
        if #available(iOS 14.0, *) {
            NavigationView {
                // To manipulate view only mode and file sharing enabled
                VStack(alignment: .center) {
                    HStack {
                        Toggle(isOn: $viewModel.isViewOnlyMode) {
                            Text("View Only Mode")
                        }
                        Toggle(isOn: $viewModel.fileSharingEnabled) {
                            Text("File sharing")
                        }
                    }
                    MessagingViewController(conversationViewController: transcriptViewContainer)
                        .ignoresSafeArea(.keyboard)
                    if viewModel.externalInputIsVisible {
                        InputArea(textValue: "",
                                  errorString: $viewModel.errorString,
                                  alertPresented: $viewModel.alertPresented)
                        .background(Color(white: 0.8, opacity: 0.8))
                    }
                }.alert(isPresented: $viewModel.alertPresented) {
                    Alert(title: Text(viewModel.errorString ?? ""))
                }
                .navigationTitle("Conversation")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("X") {
                        viewModel.dismissScreen()
                    }
                }

            }
        } else {
            // Fallback on earlier versions
        }
    }
        
}
