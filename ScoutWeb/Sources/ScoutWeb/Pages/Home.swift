import Foundation

import Slipstream

struct Home: View {
  var body: some View {

    Page(
      path: "/",
      description: "Join the Scout community documenting gas prices and station information",
      additionalStylesheets: [URL(string: "/css/parallax.css")]
    ) {
      DrivingScene(showsFireworks: false, skyHeight: 50, groundHeight: 12) {
        VStack(alignment: .center, spacing: 24) {
          Text("Who's a good Scout? You are! Yes you are.")
            .fontSize(.large)
            .fontWeight(.medium)
            .fontDesign("rounded")
            .className("text-scout-orange-dark")
            .textAlignment(.center)
            .margin(.bottom, 16)

          Link(URL(string: "#ios-download")) {
            Text("Download for iOS")
              .padding(.horizontal, 24)
              .padding(.vertical, 12)
              .className("bg-scout-orange hover:bg-scout-orange-dark")
              .textColor(.white)
              .fontWeight(.semibold)
              .cornerRadius(.large)
          }
        }
      }

      Div {
        Container {
          VStack(alignment: .center, spacing: 64) {
            HStack(spacing: 32) {
              VStack(alignment: .center, spacing: 16) {
                Div {
                  Text("⛽")
                    .fontSize(.fourXLarge)
                }
                .frame(width: 80, height: 80)
                .className("bg-scout-orange bg-opacity-20")
                .cornerRadius(.full)
                .alignItems(.center)
                .justifyContent(.center)

                Text("Document Stations")
                  .fontSize(.extraLarge)
                  .fontWeight(.semibold)
                  .className("text-scout-orange-darker")

                Text("Sniff out gas stations and mark their prices to build the ultimate territory map for your pack.")
                  .textColor(.zinc, darkness: 600)
                  .textColor(.zinc, darkness: 300, condition: .dark)
                  .textAlignment(.center)
              }
              .frame(maxWidth: 250)

              VStack(alignment: .center, spacing: 16) {
                Div {
                  Text("💰")
                    .fontSize(.fourXLarge)
                }
                .frame(width: 80, height: 80)
                .className("bg-scout-orange bg-opacity-20")
                .cornerRadius(.full)
                .alignItems(.center)
                .justifyContent(.center)

                Text("Share Data")
                  .fontSize(.extraLarge)
                  .fontWeight(.semibold)
                  .className("text-scout-orange-darker")

                Text("Share your discoveries with the global pack through OpenStreetMap - every good scout shares intel!")
                  .textColor(.zinc, darkness: 600)
                  .textColor(.zinc, darkness: 300, condition: .dark)
                  .textAlignment(.center)
              }
              .frame(maxWidth: 250)

              VStack(alignment: .center, spacing: 16) {
                Div {
                  Text("📱")
                    .fontSize(.fourXLarge)
                }
                .frame(width: 80, height: 80)
                .className("bg-scout-orange bg-opacity-20")
                .cornerRadius(.full)
                .alignItems(.center)
                .justifyContent(.center)

                Text("Build Community")
                  .fontSize(.extraLarge)
                  .fontWeight(.semibold)
                  .className("text-scout-orange-darker")

                Text("Join fellow scouts creating the most accurate gas price database - every tail wag counts!")
                  .textColor(.zinc, darkness: 600)
                  .textColor(.zinc, darkness: 300, condition: .dark)
                  .textAlignment(.center)
              }
              .frame(maxWidth: 250)
            }
            .alignItems(.center)

            VStack(alignment: .center, spacing: 24) {
              Text("Ready to join Scout?")
                .fontSize(.extraExtraExtraLarge)
                .fontSize(.fourXLarge, condition: .desktop)
                .fontWeight(.heavy)
                .fontDesign("rounded")
                .className("text-scout-orange")
                .textAlignment(.center)

              Text("Join the pack and become a top scouter in your territory!")
                .fontSize(.extraLarge)
                .fontWeight(.medium)
                .textColor(.zinc, darkness: 600)
                .textColor(.zinc, darkness: 300, condition: .dark)
                .textAlignment(.center)

              Link(URL(string: "#ios-download")) {
                Text("Get Scout for iOS")
                  .padding(.horizontal, 32)
                  .padding(.vertical, 16)
                  .className("bg-scout-orange hover:bg-scout-orange-dark")
                  .textColor(.white)
                  .fontWeight(.bold)
                  .fontSize(.large)
                  .cornerRadius(.extraLarge)
              }
            }
          }
          .padding(.bottom, 32)
        }
      }
      .background(.slate, darkness: 400)
      .background(.slate, darkness: 700, condition: .dark)
    }
  }
}
