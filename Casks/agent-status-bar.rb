cask "agent-status-bar" do
  version "0.1.0"
  sha256 "9174cbfbbe5f8f41a8ab926d6735fa71a128f5d7c3e9b45d193c1511782c7fa8"

  url "https://github.com/pku-zhb/agent-status-bar/releases/download/v#{version}/AgentStatusBar-v#{version}.zip"
  name "Agent Status Bar"
  desc "Menu bar app for tracking Codex and Claude Code sessions"
  homepage "https://github.com/pku-zhb/agent-status-bar"

  depends_on macos: :ventura

  app "AgentStatusBar.app"

  zap trash: [
    "~/Library/Preferences/com.zhuhuibin.AgentStatusBar.plist",
    "~/Library/Saved Application State/com.zhuhuibin.AgentStatusBar.savedState",
  ]
end
