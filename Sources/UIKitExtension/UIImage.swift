//
//  File.swift
//  
//
//  Created by zhtg on 2023/5/11.
//


#if os(iOS)

import UIKit


extension UIView {

    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

public extension UIImage {

    func withAlpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }

    var kb: CGFloat {
        if let data = jpegData(compressionQuality: 1) {
            return CGFloat(data.count) / 1024.0
        }
        return 0
    }

    func compressScale(_ scale: CGFloat) -> UIImage {
        // 一般不会压缩出现问题
        if let data = self.jpegData(compressionQuality: scale),
           let image = UIImage(data: data) {
            return image
        }
        return self
    }

    func compressToKb(_ kb: CGFloat) async -> UIImage {
        let selfKb = self.kb
        print("开始压缩图片: 原始图片大小：\(selfKb)")
        if selfKb < kb {
            print("图片\(selfKb)已符合大小: \(kb)")
            return self
        }

        var scale = (kb / selfKb)
        print("初始的倍率是：\(scale)")
        var image = self.compressScale(scale)
        var imageKb = image.kb
        if imageKb < kb {
            print("图片\(imageKb)符合条件了，但是怕太小，往上找一个更合适的倍率")
            // 照那个比例后，图片小了，循环找到最适合的那个比例
            while imageKb < kb {
                scale += 0.1
                image = self.compressScale(scale)
                imageKb = image.kb
                print("尝试倍率：\(scale)，图片大小：\(imageKb)")
                if scale > 0.9 {
                    break
                }
            }
            print("最合适的倍率：\(scale)")
            // 循环的结果依然还要小于总大小才行
            return image
        } else {
            print("图片\(imageKb)还不符合条件，继续往下压缩")
            // 照那个比例后，图片还是大，往小循环找到最适合的那个比例
            while imageKb > kb {
                scale -= 0.1
                if scale < 0 {
                    scale = 0
                }
                image = self.compressScale(scale)
                imageKb = image.kb
                print("尝试倍率：\(scale)，图片大小：\(imageKb)")
                if scale == 0 {
                    break
                }
            }
            if imageKb < kb {
                print("最合适的倍率：\(scale)")
                // 循环的结果依然还要小于总大小才行
                return image
            } else {
                print("质量压缩到最小还是不符合条件，只能压缩分辨率了")
            }
        }

        // 降低分辨率后，再去压缩
        return await resetImgSize(size: CGSize(width: size.width * 0.9, height: size.height * 0.9))
            .compressToKb(kb)
    }

    /// 重置图片大小 (注：压缩后的image转成data去使用的时候又把图片变大了)
    /// - Parameter size: 图片大小
    func resetImgSize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 1)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resultImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImg ?? self
    }
}

#endif
