//
//  AppDetail.swift
//  SteamJson
//
//  Created by Usuario on 26/01/2023.
//  Copyright © 2023 Usuario. All rights reserved.
//

import UIKit

class AppDetail: UIViewController {

    @IBOutlet weak var ivJuego: UIImageView!
    
    @IBOutlet weak var JuegoTitulo: UILabel!
    
    @IBOutlet weak var lblDescripcion: UILabel!
    
    var gameId:Int = 0
      var gameName:String!
    var result:ResultGame!
    override func viewDidLoad() {
        super.viewDidLoad()
       LeerJson(gameId)
       
        
    }
    
    func ShowImage(_ Url:String!,_ ivIco:UIImageView!)  {
       guard let url = URL(string: Url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else { return }

            DispatchQueue.main.async {
                let image = UIImage(data: data)
                ivIco.image = image
            }
        }.resume()

    }
    
 func LeerJson(_ id:Int) {
     let  urlTxt = "http://store.steampowered.com/api/appdetails/?appids=\(id)"
    
    guard let url = URL(string: urlTxt) else {return}
                  URLSession.shared.dataTask(with: url) { (data, response, err) in
                    guard let data = data else {return}
                    
                    
                      do {
                        
                        self.result =  try JSONDecoder().decode(ResultGame.self, from: data.subdata(in:4+"\(id)".count ..< data.count-1))
                        
                        DispatchQueue.main.async {
                            self.UI()
                        }
                        
                      } catch let jsonErr {
                          print("Error serializing json", jsonErr)
                      }
                  }.resume()
                  
              }
 
    func UI()  {
       JuegoTitulo.text = result.data?.nombre
                     
        
       
        lblDescripcion.text = result.data?.descrip
         ShowImage(result.data?.url, ivJuego)
    }
          
                  
              }
    

    


