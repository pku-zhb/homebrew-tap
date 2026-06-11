cask "agent-status-bar" do
  version "0.1.10"
  sha256 "82ce5e27c42520cdf2d3f244ea1847b54defa34269064bbb6f175ea1e0c799ac"

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
    "~/Library/Saved Application State/com.zhuhuibin.AgentStatusBar.savedState",
  ]
end
