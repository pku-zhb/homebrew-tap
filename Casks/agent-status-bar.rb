cask "agent-status-bar" do
  version "0.1.3"
  sha256 "2548f4c3a2fc0269c3cfb2880215fa35083984a9ebb67560b57b82ba9bac9828"

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
