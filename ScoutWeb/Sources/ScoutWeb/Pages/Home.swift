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

            Form(method: .post) {
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

      // Comic strip product pitch
      Div {
        Container {
          VStack(alignment: .center, spacing: 48) {
            // Comic strip title
            Text("The Scout Story")
              .fontSize(.extraExtraExtraLarge)
              .fontSize(.fourXLarge, condition: .desktop)
              .fontWeight(.black)
              .fontDesign("rounded")
              .className("text-scout-orange")
              .textAlignment(.center)
              .margin(.bottom, 24)

            // Comic panels in a grid
            Div {
              // Panel 1: Discovery
              Div {
                VStack(spacing: 20) {
                  Text("📍")
                    .fontSize(.sixXLarge)

                  Text("DISCOVER")
                    .fontSize(.large)
                    .fontWeight(.black)
                    .className("text-scout-orange-darker")

                  Text("\"I found a gas station with great prices!\"")
                    .fontSize(.base)
                    .fontWeight(.medium)
                    .textAlignment(.center)
                    .className("comic-speech-bubble")
                }
                .padding(.all, 24)
              }
              .className("comic-panel")

              // Panel 2: Document
              Div {
                VStack(spacing: 20) {
                  Text("📝")
                    .fontSize(.sixXLarge)

                  Text("DOCUMENT")
                    .fontSize(.large)
                    .fontWeight(.black)
                    .className("text-scout-orange-darker")

                  Text("\"Let me add this to the map for everyone!\"")
                    .fontSize(.base)
                    .fontWeight(.medium)
                    .textAlignment(.center)
                    .className("comic-speech-bubble")
                }
                .padding(.all, 24)
              }
              .className("comic-panel")

              // Panel 3: Share
              Div {
                VStack(spacing: 20) {
                  Text("🌍")
                    .fontSize(.sixXLarge)

                  Text("SHARE")
                    .fontSize(.large)
                    .fontWeight(.black)
                    .className("text-scout-orange-darker")

                  Text("\"Now the whole pack knows about it!\"")
                    .fontSize(.base)
                    .fontWeight(.medium)
                    .textAlignment(.center)
                    .className("comic-speech-bubble")
                }
                .padding(.all, 24)
              }
              .className("comic-panel")
            }
            .className("comic-strip-grid")

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
      .className("dotted-background dark:dotted-background-dark")
    }
  }
}
