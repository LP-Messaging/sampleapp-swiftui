//
//  InputArea.swift
//  SampleApp
//
//  Created by Gorkem Karahan on 03.05.24.
//

import LPMessagingSDK
import SwiftUI

struct InputArea: View {
    @State var textValue: String
    @Binding var errorString: String?
    @Binding var alertPresented: Bool

    var body: some View {
        VStack(spacing: 16) {
            ButtonMenu(errorString: $errorString, alertPresented: $alertPresented)
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                TextField("", text: $textValue)
                    .frame(minHeight: 44)
                    .border(.black)
                PButton("Send") {
                        let text = textValue
                        do {
                            try LPMessaging.instance.sendText(text)
                            textValue = ""
                        } catch let error {
                            errorString = (error as NSError).description
                            alertPresented = true
                        }
                }
            }
            FileSharingMenu(errorString: $errorString, alertPresented: $alertPresented)
        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
    }
}




