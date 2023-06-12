import PencilKit
import SwiftUI

struct PKCanvasViewWrapper: View {
    @Binding var drawing: PKDrawing

    var body: some View {
        Rep(spec: self)
    }
}

extension PKCanvasViewWrapper {
    typealias Spec = Self

    fileprivate struct Rep: UIViewControllerRepresentable {
        var spec: Spec

        func makeUIViewController(context: Context) -> Controller {
            return Controller(spec: spec)
        }

        func updateUIViewController(_ controller: Controller, context: Context) {
            controller.update(to: spec)
        }
    }
}

extension PKCanvasViewWrapper {
    fileprivate class Controller: UIViewController {
        private var spec: Spec
        private let canvas: PKCanvasView

        init(spec: Spec) {
            self.spec = spec

            canvas = PKCanvasView()
            canvas.drawingPolicy = .anyInput
            canvas.tool = PKInkingTool(.pen)

            super.init(nibName: nil, bundle: nil)

            self.view = canvas
            canvas.delegate = self
        }
        
        required init?(coder: NSCoder) { fatalError() }

        func update(to spec: Spec) {
            self.spec = spec

            if canvas.drawing != spec.drawing {
                canvas.drawing = spec.drawing
            }
        }
    }
}

extension PKCanvasViewWrapper.Controller: PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if canvasView.drawing != spec.drawing {
            spec.drawing = canvasView.drawing
        }
    }
}
