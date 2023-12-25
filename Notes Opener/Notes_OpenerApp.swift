import SwiftUI

@main
struct MyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem?
    var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        setupStatusBarItem()
        setupInvisibleWindow()
    }

    private func setupStatusBarItem() {
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        if let statusBarButton = statusBarItem?.button {
            statusBarButton.image = NSImage(named: "MenubarIcon")
            statusBarButton.action = #selector(openNotesApp)
        }
    }

    private func setupInvisibleWindow() {
        // Hide the window
        for window in NSApplication.shared.windows {
            window.setIsVisible(false)
        }
    }

    @objc func openNotesApp() {
        let bundleIdentifier = "com.apple.Notes"
        if let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundleIdentifier) {
            NSWorkspace.shared.open(url)
        }
    }
}
