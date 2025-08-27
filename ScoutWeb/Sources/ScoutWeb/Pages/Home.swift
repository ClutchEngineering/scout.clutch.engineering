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
    }
  }
}
