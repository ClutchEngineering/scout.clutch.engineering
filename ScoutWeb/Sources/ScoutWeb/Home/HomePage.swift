import Foundation
import Slipstream

struct HomePage: View {
  var body: some View {
    Page("Scout", path: "/", description: "Welcome to Scout", keywords: ["Scout", "Web"], content: {
      Text("Hello world")
    })
  }
}
