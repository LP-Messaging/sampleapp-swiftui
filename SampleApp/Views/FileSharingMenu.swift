//
//  FileSharingMenu.swift
//  LPMessagingSDKMaker
//
//  Created by Gorkem Karahan on 02.05.24.
//  Copyright © 2024 Live Person. All rights reserved.
//

import Foundation
import LPMessagingSDK
import SwiftUI

struct FileSharingMenu: View {
    @Binding var errorString: String?
    @Binding var alertPresented: Bool
    @State var sdkValidationEnabled = false

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Toggle(isOn: $sdkValidationEnabled) {
                    Text("Validation")
                }
                PButton("Gallery") {
                    do {
                        try LPMessaging.instance.fileSharingOpenGallery(validatingPermission: sdkValidationEnabled)
                    } catch let error {
                        errorString = (error as NSError).description
                        alertPresented = true
                    }

                }
                PButton("Camera") {
                    do {
                        try LPMessaging.instance.fileSharingOpenCamera(validatingPermission: sdkValidationEnabled)
                    } catch let error {
                        errorString = (error as NSError).description
                        alertPresented = true
                    }
                }
                PButton("File") {
                    do {
                        try LPMessaging.instance.fileSharingOpenFileSelection()
                    } catch let error {
                        errorString = (error as NSError).description
                        alertPresented = true
                    }
                }
            }.frame(minHeight: 44)
        }
    }
}
