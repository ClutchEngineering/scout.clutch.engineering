import Foundation

import Slipstream

struct Scout: View {
  var body: some View {
    Div {
      Div {
        ScoutImage(URL(string: "gfx/scout/Layer-1-A-Shadow.png"))
        ScoutImage(URL(string: "gfx/scout/Layer-2-B-ScoutBody.png"))  .className("motion-safe:animate-bounce-body")
        ScoutImage(URL(string: "gfx/scout/Layer-3-C-Tires.png"))      .className("motion-safe:animate-bounce-wheels")
        ScoutImage(URL(string: "gfx/scout/Layer-4-D-Bike.png"))       .className("motion-safe:animate-bounce-car")
        ScoutImage(URL(string: "gfx/scout/Layer-5-B-Upperbody.png"))  .className("motion-safe:animate-bounce-body")
        ScoutImage(URL(string: "gfx/scout/Layer-6-E-Tongue.png"))     .className("motion-safe:animate-bounce-tongue")
        ScoutImage(URL(string: "gfx/scout/Layer-7-B-Nose.png"))       .className("motion-safe:animate-bounce-body")
          .className("active:opacity-0")
          .animation(.easeInOut)
      }
    }
    .position(.relative)
    .frame(width: 200, height: 150)
    .className("motion-safe:animate-drive-car")
  }
}

