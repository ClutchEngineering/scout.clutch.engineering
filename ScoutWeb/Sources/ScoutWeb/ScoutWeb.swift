import ArgumentParser
import Foundation

import Slipstream

@main
struct ScoutWeb: ParsableCommand {
  mutating func run() throws {
    let sitemap: Sitemap = [
      "index.html": HomePage()
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
