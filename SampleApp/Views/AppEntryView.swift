//
//  AppEntryView.swift
//  SampleApp
//
//  Created by Gorkem Karahan on 03.05.24.
//

import SwiftUI
import LPMessagingSDK

struct AppEntryView: View {
    @State var brandId: String = ""
    @State var jwt: String = ""

    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("Brand Id:")
                TextField("", text: $brandId)
                    .frame(minHeight: 44)
                    .border(Color.black)
            }
            HStack {
                Text("JWT:")
                TextField("", text: $jwt)
                    .frame(minHeight: 44)
                    .border(Color.black)
            }
            PButton("Initialize the SDK") {
                Utils.initializeSDK(brandId: brandId)
            }

            PButton("Show Conversation") {
                viewModel.brandId = brandId
                viewModel.conversationScreenPresented = true
            }

            PButton("Logout") {
                LPMessaging.instance.logout(unregisterType: .all, completion: {

                }) { errors in

                }

            }
        }.fullScreenCover(isPresented: $viewModel.conversationScreenPresented) {
            ContentView(viewModel: viewModel,
                        transcriptViewContainer: Utils.getTranscriptContainer(brandId: brandId, jwt: jwt))
        }
    }
}
