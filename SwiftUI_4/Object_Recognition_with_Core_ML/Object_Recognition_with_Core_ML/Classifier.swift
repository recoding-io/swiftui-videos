//
//  Classifier.swift
//  Object_Recognition_with_Core_ML
//
//  Created by Haaris Iqubal on 9/11/22.
//

import Foundation
import Vision
import CoreImage

class Classifier: ObservableObject {
    @Published var result:String?
    @Published var confidence:Float?
    
    public func detect(ciImage: CIImage) {
        guard let model = try? VNCoreMLModel(for: MobileNetV2(configuration: MLModelConfiguration()).model) else {return}
        
        let request = VNCoreMLRequest(model: model)
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {return}
        
        if let firstResult = results.first {
            confidence = firstResult.confidence
            result = firstResult.identifier
        }
    }
    
}
