cask "agent-status-bar" do
  version "0.1.9"
  sha256 "5826c963d665da46ccee75501c9183a3483b426558d4c18ccf0d0f475878896e"

  url "https://github.com/pku-zhb/agent-status-bar/releases/download/v#{version}/AgentStatusBar-v#{version}.zip"
  name "Agent Status Bar"
  desc "Menu bar app for tracking Codex and Claude Code sessions"
  homepage "https://github.com/pku-zhb/agent-status-bar"

  app "AgentStatusBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/AgentStatusBar.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.zhuhuibin.AgentStatusBar.plist",
    "~/Library/Saved Application State/com.zhuhuibin.AgentStatusBar.savedState",
  ]
end
