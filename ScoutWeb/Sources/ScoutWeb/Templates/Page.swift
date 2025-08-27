import Foundation

import Slipstream

extension View {
  @ViewBuilder
  fileprivate func background(_ color: Color?, condition: Condition? = nil) -> some View {
    if let color {
      self.background(color, condition: condition)
    } else {
      self
    }
  }
}

struct Page<Content: View>: View {
  init(
    path: String,
    title: String? = nil,
    description: String? = nil,
    backgroundColor: Color? = nil,
    darkModeBackgroundColor: Color? = nil,
    additionalStylesheets: [URL?] = [],
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.path = path
    self.title = title
    self.description = description
    self.backgroundColor = backgroundColor
    self.darkModeBackgroundColor = darkModeBackgroundColor
    self.additionalStylesheets = additionalStylesheets
    self.content = content
  }

  private let siteName: String = "Scout — Find the best gas prices"

  private var resolvedTitle: String {
    if let title {
      return "\(title) — \(siteName)"
    } else {
      return siteName
    }
  }

  var body: some View {
    HTML {
      Head {
        Charset(.utf8)
        Title(resolvedTitle)
        Viewport(width: .deviceWidth, initialScale: 1, viewportFit: .cover)
        if let description {
          Meta(.description, content: description)
        }
        Meta(.generator, content: "Slipstream")
        Meta(.author, content: "Jeff Verkoeyen")
        Meta("og:title", content: resolvedTitle)
        if let description {
          Meta("og:description", content: description)
        }
        Meta("og:image", content: "https://hogmobile.com/gfx/social-banner.png")
        Meta("og:url", content: "https://hogmobile.com/\(path)")
        Meta("og:type", content: "website")
        Meta("og:site_name", content: siteName)
        Stylesheet(URL(string: "/css/main.css"))
        for stylesheet in additionalStylesheets {
          Stylesheet(stylesheet)
        }

        Script(URL(string: "/js/typewriter.js"))
        Script(URL(string: "/js/buildings.js"))
      }
      Body {
        content()

        Footer {
          Container {
            VStack(alignment: .center, spacing: 16) {
              Link(URL(string: "https://github.com/jverkoey/slipstream")) {
                Image(URL(string: "/gfx/built-with-slipstream.svg"))
                  .accessibilityLabel("Built with Slipstream")
              }
              .modifier(ClassModifier(add: "cursor-pointer"))
              Text {
                DOMString("Copyright © \(Calendar.current.component(.year, from: Date())) ")
                Link("Clutch Engineering", destination: URL(string: "https://clutch.engineering"))
                  .textColor(.rose, darkness: 600)
                  .textColor(.rose, darkness: 400, condition: .dark)
                  .fontWeight(600)
                  .underline(condition: .hover)
              }
              .textColor(.zinc, darkness: 600)
              .textColor(.zinc, darkness: 300, condition: .dark)
            }
            .justifyContent(.between)
          }
          .padding(.vertical, 32)
        }
        .border(.palette(.zinc, darkness: 300), width: 1, edges: .top)
        .border(.palette(.zinc, darkness: 700), width: 1, edges: .top, condition: .dark)
        .background(.zinc, darkness: 200)
        .background(.zinc, darkness: 800, condition: .dark)
      }
      .antialiased()
      .className("bg-scout-yellow dotted-background dark:dotted-background-dark")
      .background(backgroundColor)
      .background(darkModeBackgroundColor, condition: .dark)
    }
    .language("en")
    .environment(\.path, path)
  }

  private let path: String
  private let title: String?
  private let description: String?
  private let backgroundColor: Color?
  private let darkModeBackgroundColor: Color?
  private let additionalStylesheets: [URL?]
  @ViewBuilder private let content: @Sendable () -> Content
}

private struct PathEnvironmentKey: EnvironmentKey {
  static let defaultValue: String = "/"
}

extension EnvironmentValues {
  var path: String {
    get { self[PathEnvironmentKey.self] }
    set { self[PathEnvironmentKey.self] = newValue }
  }
}
