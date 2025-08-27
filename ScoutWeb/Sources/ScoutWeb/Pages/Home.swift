import Foundation

import Slipstream

struct Home: View {
  var body: some View {

    Page(
      path: "/",
      description: "Join the Scout community documenting gas prices and station information",
      additionalStylesheets: [URL(string: "/css/parallax.css")]
    ) {
      DrivingScene(showsFireworks: false, skyHeight: 32, groundHeight: 12) {
        Div {
          VStack(alignment: .center, spacing: 24) {
            Text("Please provide an email address and try again.")
              .id("missing_email")
              .fontWeight(.bold)
              .fontDesign("rounded")
              .textColor(.amber, darkness: 500)
              .textColor(.amber, darkness: 400, condition: .dark)
              .hidden()
              .display(.block, condition: .init(state: .target))

            Form(method: .post, url: URL(string: "https://register.scout.clutch.engineering/")) {
              VStack(spacing: 32) {
                TextField("Email", type: .email, name: "email")
                  .fontSize(.large)
                  .padding(.vertical, 8)
                  .padding(.horizontal, 16)
                  .outline(style: .none)
                  .ring(Color(.amber, darkness: 400), width: 4, condition: .focus)
                  .cornerRadius(.extraLarge)
                  .id("email")

                Button(type: .submit) {
                  Span("Sign up for the beta")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .display(.block)
                    .background(.amber, darkness: 500)
                    .offset(x: 0, y: 0)
                    .offset(x: -2, y: 2, condition: .hover)
                    .offset(x: -4, y: 4, condition: .active)
                    .animation(.easeInOut, condition: .hover + .active)
                    .cornerRadius(.extraLarge)
                }
                .fontSize(.large)
                .fontWeight(.bold)
                .fontDesign("rounded")
                .className("text-scout-border scout-button-shadow")
                .cornerRadius(.extraLarge)
                .animation(.easeOut, condition: .active)
              }
              .alignItems(.center)
            }
          }
        }
        .className("chat-bubble")
        .frame(maxWidth: 600)
        .margin(.horizontal, .auto)
        .margin(.bottom, 48)
      }

      // Product pitch.
      Div {
        Container {
          VStack(alignment: .center, spacing: 64) {
            HStack(alignment: .top, spacing: 32) {
              VStack(alignment: .center, spacing: 16) {
                Div {
                  Text("⛽")
                    .fontSize(.fourXLarge)
                }
                .frame(width: 80, height: 80)
                .className("bg-scout-orange bg-opacity-20")
                .cornerRadius(.full)
                .display(.flex)
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
                .display(.flex)
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
                .display(.flex)
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
        .background(.white)
        .padding(.vertical, 32)
        .cornerRadius(.extraLarge)
      }
      .background(.slate, darkness: 400)
      .background(.slate, darkness: 700, condition: .dark)
      .padding(.bottom, 32)
      .className("dotted-background dark:dotted-background-dark")
    }
  }
}
