//
//  ButtonMenu.swift
//  SampleApp
//
//  Created by Gorkem Karahan on 03.05.24.
//

import LPMessagingSDK
import SwiftUI

struct ButtonMenu: View {
    @Binding var errorString: String?
    @Binding var alertPresented: Bool

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    PButton("Button 1") {
                        do {
                            try LPMessaging.instance.sendText("First Button Text")
                        } catch let error {
                            errorString = (error as NSError).description
                            alertPresented = true
                        }
                    }
                    PButton("Button 2") {
                        do {
                            try LPMessaging.instance.sendText("Second Button Text")
                        } catch let error {
                            errorString = (error as NSError).description
                            alertPresented = true
                        }
                    }
                    PButton("Button 3") {
                        do {
                            try LPMessaging.instance.sendText("Third Button Text")
                        } catch let error {
                            errorString = (error as NSError).description
                            alertPresented = true
                        }
                    }
                }
                .frame(minHeight: 60)
            }
        }
    }
}
