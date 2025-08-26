import ArgumentParser
import Foundation

import Slipstream

extension Condition {
  static var mobileOnly: Condition { Condition.within(Breakpoint.small..<Breakpoint.medium) }
  static var desktop: Condition { Condition.startingAt(.medium) }
}

@main
struct ScoutWeb: ParsableCommand {
  mutating func run() throws {
    let sitemap: Sitemap = [
      "index.html": Home(),
      "thank_you/index.html": ThankYou(),
    ]

    // Assumes this file is located in a Sources/ sub-directory of a Swift package.
    let projectURL = URL(filePath: #filePath)
      .deletingLastPathComponent()
      .deletingLastPathComponent()
      .deletingLastPathComponent()
      .deletingLastPathComponent()

    let outputURL = projectURL.appending(path: "site")

    try renderSitemap(sitemap, to: outputURL)
  }
}
