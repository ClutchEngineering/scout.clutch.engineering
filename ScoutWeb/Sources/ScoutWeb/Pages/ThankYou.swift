import Foundation

import Slipstream

struct ThankYou: View {
  var body: some View {

    Page(
      path: "/thank-you/",
      description: "We'll let you know when we launch!",
      additionalStylesheets: [
        URL(string: "/css/parallax.css"),
        URL(string: "/css/fireworks.css"),
      ]
    ) {
      DrivingScene(showsFireworks: true, skyHeight: 32, groundHeight: 12) {
        VStack(alignment: .center, spacing: 32) {
          VStack(alignment: .center, spacing: 32) {
            Paragraph("Stay tuned for updates as we prepare to launch Scout!")
              .fontSize(.large)
              .fontSize(.extraExtraLarge, condition: .startingAt(.medium))
              .fontWeight(.black)
              .fontDesign("rounded")
              .textColor(.rose, darkness: 500)
              .textColor(.rose, darkness: 400, condition: .dark)
          }

          Link(URL(string: "https://www.threads.net/intent/post?text=I just signed up for Scout! Check it out at https://scout.clutch.engineering/")) {
            Span("Share the love on Threads")
              .padding(.horizontal, 16)
              .padding(.vertical, 8)
              .display(.block)
              .background(.rose, darkness: 500)
              .background(.rose, darkness: 400, condition: .dark)
              .offset(y: -8)
              .offset(y: -6, condition: .hover)
              .offset(y: -2, condition: .active)
              .animation(.easeInOut, condition: .hover + .active)
              .cornerRadius(.extraLarge)
          }
          .fontSize(.large)
          .fontWeight(.bold)
          .fontDesign("rounded")
          .textColor(.white)
          .background(.rose, darkness: 900)
          .cornerRadius(.extraLarge)
          .animation(.easeOut, condition: .active)
        }
      }
    }
  }
}
