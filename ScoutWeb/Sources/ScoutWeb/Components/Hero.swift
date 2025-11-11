import Foundation

import Slipstream

struct Hero: View {
  var body: some View {
    H1("Scout")
      .fontSize(.sixXLarge)
      .fontSize(.nineXLarge, condition: .startingAt(.medium))
      .fontWeight(.black)
      .className("font-avenir italic text-scout-shadow rotate-slight font-tight")
      .fontLeading(.tight)
      .padding(.bottom, 12, condition: .mobileOnly)

    Div {
      Paragraph {
        DOMString("Find the best ")
        Span {
          DOMString("gas stations")
        }
        .id("typewriter-text")
        .className("typewriter animate-blink")
      }
      .fontSize(.extraExtraLarge)
      .fontSize(.fiveXLarge, condition: .startingAt(.medium))
      .fontWeight(.black)
      // .className("text-scout-orange")
      .className("font-avenir italic text-subheadline-shadow rotate-slight")
    }
    .className("typewriter-container")
  }
}
