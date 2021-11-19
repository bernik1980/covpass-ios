//
//  AppDelegate.swift
//
//  © Copyright IBM Deutschland GmbH 2021
//  SPDX-License-Identifier: Apache-2.0
//

import CovPassCommon
import CovPassUI
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var sceneCoordinator: DefaultSceneCoordinator?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        try? clearKeychainOnFreshInstall()
        try? UIFont.loadCustomFonts()

        guard NSClassFromString("XCTest") == nil else { return true }

        let window = UIWindow(frame: UIScreen.main.bounds)
        let sceneCoordinator = DefaultSceneCoordinator(window: window)
        let mainScene = MainSceneFactory(sceneCoordinator: sceneCoordinator)
        sceneCoordinator.asRoot(mainScene)
        window.rootViewController = sceneCoordinator.rootViewController
        window.makeKeyAndVisible()
        self.window = window
        self.sceneCoordinator = sceneCoordinator

				// disabling update check, because of custom versioning
				// appUpdateDialogIfNeeded()

        return true
    }

    private func clearKeychainOnFreshInstall() throws {
        if !UserDefaults.StartupInfo.bool(.appInstalled) {
            UserDefaults.StartupInfo.set(true, forKey: .appInstalled)
            try KeychainPersistence().deleteAll()
        }
    }

    private func appUpdateDialogIfNeeded() {
        CheckAppUpdate(
            service: CheckAppUpdateService(bundleIdentifier: "de.rki.corona-impf-check"),
            userDefaults: UserDefaultsPersistence(),
            appStoreID: "id1566140314"
        ).showUpdateDialogIfNeeded(
            title: "dialog_start_screen_title".localized,
            message: "dialog_start_screen_message".localized,
            ok: "dialog_start_screen_button_update".localized,
            cancel: "dialog_start_screen_button_later".localized
        )
    }

    func applicationWillResignActive(_: UIApplication) {
        BackgroundUtils.addHideView(to: window, image: UIImage(named: "CovPassCheck"))
    }

    func applicationDidBecomeActive(_: UIApplication) {
        BackgroundUtils.removeHideView(from: window)
    }
	
	func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
	{
		// check deep-link
		if let queryItems = URLComponents(url:url, resolvingAgainstBaseURL:false)?.queryItems
		{
			for item in queryItems
			{
				if (item.name.lowercased() == "scan" && item.value == "1")
				{
					// pop to root if needed
					if let viewController = self.sceneCoordinator?.rootViewController?.mostTopViewController
					{
						if (viewController !== self.sceneCoordinator?.rootViewController)
						{
							// dissmis
							self.sceneCoordinator?.dismiss(viewController, false, completion: {
								// and try again
								_ = self.application(application, open:url, sourceApplication:sourceApplication, annotation:annotation)
							})
							
							return true
						}
					}
					
					// show scanner
					// need to use internal loigic
					if let viewController = (self.sceneCoordinator?.rootViewController as? UINavigationController)?.viewControllers.first as? ValidatorOverviewViewController
					{
						viewController.viewModel.startQRCodeValidation()
					}
					break
				}
			}
		}
		
		return true
	}
}
