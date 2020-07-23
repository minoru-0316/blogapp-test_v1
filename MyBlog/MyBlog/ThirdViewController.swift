//
//  ThirdViewController.swift
//  MyBlog
//
//  Created by Minoru Edo on 2020/06/22.
//  Copyright © 2020 Minoru Edo. All rights reserved.
//



import Foundation
import UIKit
import SwiftyJSON


class ThirdViewController:  UIViewController, UITextFieldDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThirdTxtFIeld.delegate = self
        print("新規投稿画面が開いた")
    }
    

    @IBOutlet weak var ThirdTxtFIeld: UITextField!
    
    
    
    @IBAction func ThirdCreateBtn(_ sender: Any) {
        
        // まずPOSTで送信したい情報をセット。
//        let textFieldStr = ThirdTxtFIeld.text!
        if let textFieldStr:String = ThirdTxtFIeld.text{
            
                    var params: [String: Any] = [:]
                    params["title"] = textFieldStr
                    print("000000")
                    print(params)
                    

                    
                    
            //参考URL-1: https://qiita.com/zakiyamaaaaa/items/4ccee2276d059dde23db
                    
                            let urlString = "http://localhost:3000/api/v1/posts"
                            let request = NSMutableURLRequest(url: URL(string: urlString)!)


                            request.httpMethod = "POST"
                            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

                            do {
                                // jsonの形で引数を渡してあげる
                                // SwiftyJsonを使ってJsonObjectを作る
                                
            //
            //                    let json = JSON(textFieldStr)
            //                    for datalist in json["data"].arrayValue {
            //////
            //                    let parameter = [
            //                        textFieldStr
            //                    ]
//                                let parameter = [
//                                    title: textFieldStr
//                                ]
////                                let parameter: JSON = [
////                                    title: textFieldStr
////                                ]
//                                print("ーーーーーーー")
//                                print(parameter)
                                
                                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                                
                                let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data,response,error) -> Void in
                                    let resultData = String(data: data!, encoding: .utf8)!
                                    print("result:\(resultData)")
            //                        print("response:\(response)")

                                })
                                //            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                            task.resume()
                                }catch{
                                    print("Error:\(error)")
                                    return
                                }
                    
                    
            //参考URL-2:http://www.office-matsunaga.biz/ios/description.php?id=54
            //        let url = URL(string: "http://localhost:3000/api/v1/posts")
            //        print(url)
            //        var request = URLRequest(url: url!)
            //
            //        request.httpMethod = "POST"
            //        request.httpBody = textFieldStr.data(using: .utf8)
            //        let session = URLSession.shared
            //        session.dataTask(with: request) { (data, response, error) in
            //                if error == nil, let data = data, let response = response as? HTTPURLResponse {
            //                        print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
            //                        print("statusCode: \(response.statusCode)")
            //                        print(String(data: data, encoding: .utf8) ?? "")
            //                    }
            //        }.resume()
                    
            //         TextFieldの中身をクリア
                    //        ThirdTxtFIeld.text = ""
                    
                    //ひとつ前の画面に戻る処理
                    self.navigationController?.popViewController(animated: true)

                }

            
        }


}


