//
//  MessagingViewController.swift
//  SampleApp
//
//  Created by UMAIR Ali on 4/12/24.
//

import LPMessagingSDK
import SwiftUI

struct MessagingViewController: UIViewControllerRepresentable {

    var conversationViewController: UIViewController

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeUIViewController(context: Context) -> some UIViewController {
        return conversationViewController
    }
}
