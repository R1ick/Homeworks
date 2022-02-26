//
//  SideMenuExt.swift
//  AnimationsApp
//
//  Created by Ярослав Антонович on 24.02.2022.
//

import UIKit
import SideMenu

extension MainVC {
    func setupSideMenu() {
        // Define the menus
        SideMenuManager.default.leftMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
        SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
    func makeSettings() -> SideMenuSettings {
        let presentationStyle = SideMenuPresentationStyle.viewSlideOut
        presentationStyle.backgroundColor = .gray
        presentationStyle.menuStartAlpha = 0.3
        presentationStyle.menuScaleFactor = 1
        presentationStyle.onTopShadowOpacity = 0.7
        presentationStyle.presentingEndAlpha = 0.6
        presentationStyle.presentingScaleFactor = 1

        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = 340
        settings.blurEffectStyle = .regular
        settings.statusBarEndAlpha = 1

        return settings
    }
    func updateMenus() {
        let settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
    }
}
