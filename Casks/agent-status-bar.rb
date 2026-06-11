cask "agent-status-bar" do
  version "0.1.12"
  sha256 "f8e26686492685722bf0f6a8bc06077533c79ae019c20e6aad8611c6443a4c70"

  url "https://github.com/pku-zhb/agent-status-bar/releases/download/v#{version}/AgentStatusBar-v#{version}.zip"
  name "Agent Status Bar"
  desc "Menu bar app for tracking Codex and Claude Code sessions"
  homepage "https://github.com/pku-zhb/agent-status-bar"

  app "AgentStatusBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/AgentStatusBar.app"],
                   must_succeed: false
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args:         ["-f", "#{appdir}/AgentStatusBar.app"],
                   must_succeed: false
    system_command "/usr/bin/killall",
                   args:         ["usernoted"],
                   must_succeed: false
    system_command "/usr/bin/killall",
                   args:         ["NotificationCenter"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.zhuhuibin.AgentStatusBar.plist",
    "~/Library/Preferences/com.zhuhuibin.agentstatusbar.plist",
    "~/Library/Saved Application State/com.zhuhuibin.AgentStatusBar.savedState",
    "~/Library/Saved Application State/com.zhuhuibin.agentstatusbar.savedState",
  ]
end
