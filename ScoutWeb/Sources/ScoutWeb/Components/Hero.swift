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

    Paragraph {
      DOMString("Sniff out the cheapest gas and chargers")
    }
    .fontSize(.extraExtraLarge)
    .fontSize(.fourXLarge, condition: .startingAt(.medium))
    .fontWeight(.black)
    .fontDesign("rounded")
    .className("text-scout-orange")
  }
}
