import PencilKit
import SwiftUI

struct ExternalRootView: View {
    @ObservedObject var model: AppModel

    var body: some View {
        VStack {
            Text("External Screen")
            PKCanvasViewWrapper(drawing: $model.drawing)
                .frame(width: 300, height: 300)
                .border(Color.gray)
        }
    }
}
