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
       
        UI()
       // LeerJson(gameId)
    }
    // func ShowImage(_ Url:String!,_ ivIco:UIImageView!)  {
    //    let url = URL(string: Url)
   //     let data = try? Data(contentsOf: url!)
 //       ivIco.image = UIImage(data: data!)

   // }
    
 func LeerJson(_ id:Int) {
     let  urlTxt = "http://store.steampowered.com/api/appdetails/?appids=\(id)"
               ;
                  guard let url = URL(string: urlTxt) else {return}
                  URLSession.shared.dataTask(with: url) { (data, response, err) in
                      guard let data = data else {return}
                      do {
                          self.result =  try JSONDecoder().decode(ResultGame.self, from: data)
                        
                        
                      } catch let jsonErr {
                          print("Error serializing json", jsonErr)
                      }
                  }.resume()
                  
              }
 
    func UI()  {
       JuegoTitulo.text =
                     
        lblDescripcion.text = "\(gameId)"
        print(gameId)
      //  lblDescripcion.text = result.data?.descrip
        // ShowImage("\(result.data?.url", ivJuego)
    }
          
                  
              }
    

    


