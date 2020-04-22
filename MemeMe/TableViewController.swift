
import UIKit

class TableViewController: UITableViewController{

    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(createMeme))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @objc func createMeme(){
//        performSegue(withIdentifier: "tableMemeSegue", sender: self)
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "MemeCreationViewController") as! MemeCreationViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell")
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell?.textLabel?.text = meme.topText
        cell?.imageView?.image = meme.memedImage
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = self.memes[(indexPath as NSIndexPath).row]
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowMemeViewController") as! ShowMemeViewController
        controller.image = meme.memedImage
        present(controller, animated: true)    }
}