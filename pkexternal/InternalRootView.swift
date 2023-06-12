import PencilKit
import SwiftUI

struct InternalRootView: View {
    @ObservedObject var model: AppModel

    var body: some View {
        VStack {
            Text("Internal Screen")
            PKCanvasViewWrapper(drawing: $model.drawing)
                .frame(width: 300, height: 300)
                .border(Color.gray)
        }
    }
}
