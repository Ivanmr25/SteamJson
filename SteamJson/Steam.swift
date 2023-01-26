//
//  Steam.swift
//  SteamJson
//
//  Created by Usuario on 26/01/2023.
//  Copyright © 2023 Usuario. All rights reserved.
//

import UIKit

class Steam: UITableViewController {
    var result:Result!
   
    override func viewDidLoad() {
        super.viewDidLoad()
            jsonDecoding()
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let n = result?.applist?.games?.count else{
                       return 0
                   }
                    return n
       
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaId", for: indexPath) as! Micelda
         let game = result?.applist!.games![indexPath.row]

        
        
        cell.JuegoNombre.text = game!.name

        

        return cell
    }
  
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowDetailId"{
        let indexPath = self.tableView.indexPathForSelectedRow!
        let game = result?.applist!.games![indexPath.row]
        
                  
                   let controllerDetail = segue.destination as! AppDetail
                   
                   controllerDetail.gameId = (game?.appid)!
                  

    }
   }
    
    func jsonDecoding() {
           let  urlTxt = "http://api.steampowered.com/ISteamApps/GetAppList/v0002/"
        ;
           guard let url = URL(string: urlTxt) else {return}
           URLSession.shared.dataTask(with: url) { (data, response, err) in
               guard let data = data else {return}
               do {
                   self.result =  try JSONDecoder().decode(Result.self, from: data)
             
                   self.UI()
               } catch let jsonErr {
                   print("Error serializing json", jsonErr)
               }
           }.resume()
           
       }
       func UI() {
           DispatchQueue.main.async {
               self.tableView.reloadData()
           }
           
       }
    

}

