//
//  Utils.swift
//  SampleApp
//
//  Created by UMAIR Ali on 4/12/24.
//

import Foundation
import LPMessagingSDK
import UIKit

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

class Utils {
    class func initializeSDK(brandId: String) {
        try? LPMessaging.instance.initialize(brandId)
        LPMessaging.instance.setLoggingLevel(level: .TRACE)

        // Configurations
        LPConfig.defaultConfiguration.enableLoadingView = false
    }

    class func getTranscriptContainer(brandId: String, jwt: String) -> ConversationViewController {
        let conversationQuery = LPMessaging.instance.getConversationBrandQuery(brandId, campaignInfo: nil)

        // HistoryParam
        let conversationHistoryControlParam = LPConversationHistoryControlParam(
            historyConversationsStateToDisplay: .all,
            historyConversationsMaxDays: -1,
            historyMaxDaysType: .startConversationDate
        )

        let conversationViewController = ConversationViewController()

        // ConversationViewParams
        let conversationViewParams = LPConversationViewParams(conversationQuery: conversationQuery,
                                                              containerViewController: conversationViewController,
                                                              isViewOnly: true,
                                                              conversationHistoryControlParam: conversationHistoryControlParam)
        
        if !jwt.isEmpty {
            LPMessaging.instance.showConversation(conversationViewParams,
                                                  authenticationParams: LPAuthenticationParams(jwt: jwt,
                                                                                               authenticationType: .authenticated))
        } else {
            LPMessaging.instance.showConversation(conversationViewParams,
                                                  authenticationParams: nil)
        }
        return conversationViewController
    }
}
