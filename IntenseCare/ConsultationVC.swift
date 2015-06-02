//
//  ConsultationVC.swift
//  IntenseCare
//
//  Created by Felipe on 5/6/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation

class ConsultationViewController: UIViewController, UITextFieldDelegate {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //respiratory
    var p_FIO2TF:Double!
    var p_pa02:Double!
    var p_mechVentSwitch:Int!
    
    var p_glasgowTF:Double!
    var p_bilirubinTF:Double!
    
    var p_mapTF:Double!
    var p_dopTF:Double!
    var p_dobTF:Double!
    var p_epiTF:Double!
    var p_norTF:Double!
    var p_plateletsTF:Double!
    var p_creatinineTF:Double!
    var p_creaUrineSegmentTF:Int!
    var p_creaUrineSegment: UISegmentedControl = UISegmentedControl()
    
    //OUTLETS AND ACTIONS
    @IBOutlet weak var navItem: UINavigationItem!
    
        //Respiratory System
    @IBOutlet weak var FIO2TF: UITextField!
    @IBOutlet weak var pa02: UITextField!
    @IBOutlet weak var mechVentSwitch: UISwitch!
    
    @IBAction func RespiratorySaveButton(sender: AnyObject) {
        if ((FIO2TF.text == "" && pa02.text != "") || (FIO2TF.text != "" && pa02.text == "") ){
            let alert = UIAlertController(title: "Missing Information", message: "Please, insert information for FIO2 and PAO2." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
        else{
            println ("entrei no else")
            if (p_glasgowTF != -2 && p_mapTF != -3 && p_creatinineTF != -4 && p_plateletsTF != -5 && p_bilirubinTF != -6){
                var doubleFIO2:Double = (FIO2TF.text as NSString).doubleValue
                
                var doublepa02:Double = (pa02.text as NSString).doubleValue
                println ("Double FIO2 \(doubleFIO2)  E PAO2 \(doublepa02)")
                if (p_creaUrineSegmentTF == 0) {
                    println ("entro aqui sim \(p_creaUrineSegmentTF)")
                                        p_creaUrineSegment.selectedSegmentIndex = 0
                }
                else{
                    p_creaUrineSegment.selectedSegmentIndex = 1
                }
                //calcSofa(doubleFIO2:Double, doublepa02:Double, mechVentSwitch:UISwitch, doubleglasgow:Double, doubleBilirubin:Double, doubleMap:Double, doubleDop:Double, doubleDob:Double, doubleEpi:Double, doubleNor:Double, vasoopressorSwitch:String, doublePlatelets:Double, doubleCreatinine:Double)
                calcSofa( doubleFIO2, doublepa02: doublepa02, mechVentSwitch: mechVentSwitch, doubleglasgow: self.p_glasgowTF, doubleBilirubin: self.p_bilirubinTF, doubleMap: self.p_mapTF, doubleDop: self.p_dopTF, doubleDob: self.p_dobTF, doubleEpi: self.p_epiTF, doubleNor: self.p_norTF,  doublePlatelets: self.p_plateletsTF , doubleCreatinine: self.p_creatinineTF , creaUrineSegmentTF: p_creaUrineSegment )

            }
            else{
                let alert = UIAlertController(title: "Information", message: "It is not possible to calculate Sofa, because there is not enought information yet for this patient." , preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                //return ;
                //save in db
            }
        }

    }

        //Nervous System
    @IBOutlet weak var glasgowTF: UITextField!
    @IBAction func NervousSaveButton(sender: AnyObject) {
        if (glasgowTF.text == ""){
            let alert = UIAlertController(title: "Missing Information", message: "Please, insert information for glasgow." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
        else{
            
        }
        
    }
    
        //Liver
    @IBOutlet weak var bilirubinTF: UITextField!
    @IBAction func liverSaveButton(sender: AnyObject) {
        if (bilirubinTF.text == ""){
            let alert = UIAlertController(title: "Missing Information", message: "Please, insert information for bilirubin." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
        else{
            
        }
    }
    
        // cardio vascular system
    @IBOutlet weak var mapTF: UITextField!
    @IBOutlet weak var vasopressorsSwitch: UISwitch!
    @IBOutlet weak var dopTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var epiTF: UITextField!
    @IBOutlet weak var norTF: UITextField!
    
    @IBAction func CardioSaveButton(sender: AnyObject) {
        if (mapTF.text == ""){
            let alert = UIAlertController(title: "Missing Information", message: "Please, insert information for Map." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
        else if ( vasopressorsSwitch.on && dopTF.text == "" && dobTF.text == "" && epiTF.text == "" && norTF.text == "" ){
            let alert = UIAlertController(title: "Missing Information", message: "Please, Vaso Opressors is selected, insert information for Dopamine, Dobutamine, Epinephrine or Noropinephrine." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
        else {

        }

    }
    
        // Coagulation
    @IBOutlet weak var plateletsTF: UITextField!
    @IBAction func coagulationSaveButton(sender: AnyObject) {
        if (plateletsTF.text == ""){
            let alert = UIAlertController(title: "Missing Information", message: "Please, insert information for platelets." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
        else{
            
        }
    }
    
        // Renal System
    @IBOutlet weak var creatinineTF: UITextField!
    @IBOutlet weak var creaUrineSegment: UISegmentedControl!
    @IBOutlet weak var creaUrineLabel: UILabel!
    
    // altera os cantos de sistema renal dependendo a escolha
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: // creatine
            self.creaUrineLabel.text = "Creatinine"
            self.creatinineTF.placeholder = "mg/dL"
            break
        case 1: // urine
            self.creaUrineLabel.text = "Urine Output"
            self.creatinineTF.placeholder = "mL/day"
            break
        default:
            break
        }
    }
    
    @IBAction func renalSaveButton(sender: UIButton) {
        if (creatinineTF.text == ""){
            let alert = UIAlertController(title: "Missing Information", message: "Please, insert information for Renal System." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
        else{

        }
        
        
    }
    


    func getParameters(){
        
        var webService = WebServiceResource.webService
        var id_patient=1
        var postParam = "id_patient=\(id_patient)"
        //respiratory
        webService.getWebContent(webService.SEARCH_ALL, postVariables: postParam)
        dispatch_group_notify(webService.serviceGroup, dispatch_get_main_queue(), { () -> Void in
            var result = webService.result!
                if result["error"] != nil {
                    //significa que houve um erro
                }//end of id
                else{
                    //self.p_pa02                 = result[0]["pao2"].string as NSString).doubleValue
                    self.p_pa02                 = result[0]["pao2"].doubleValue
                    self.p_FIO2TF               = result[0]["fio2"].doubleValue
                    self.p_mechVentSwitch       = result[0]["mechVent"].intValue
                    self.p_glasgowTF            = result[1]["glasgow"].doubleValue
                    self.p_mapTF                = result[2]["map"].doubleValue
                    self.p_dopTF                = result[2]["dop"].doubleValue
                    self.p_dobTF                = result[2]["dob"].doubleValue
                    self.p_epiTF                = result[2]["epi"].doubleValue
                    self.p_norTF                = result[2]["nor"].doubleValue
                    self.p_creatinineTF         = result[3]["creat_urine"].doubleValue
                    self.p_creaUrineSegmentTF   = result[3]["type"].intValue
                    self.p_plateletsTF          = result[4]["platelets"].doubleValue
                    self.p_bilirubinTF          = result[5]["bilirubin"].doubleValue
                    
                    
                    println("inicio")
                    println(self.p_pa02)
                    println(self.p_FIO2TF)
                    println(self.p_mechVentSwitch)
                    println(self.p_glasgowTF)
                    println(self.p_mapTF)
                    println(self.p_dopTF)
                    println(self.p_dobTF)
                    println(self.p_epiTF)
                    println(self.p_norTF)
                    println(self.p_creatinineTF)
                    println(self.p_creaUrineSegmentTF)
                    println(self.p_plateletsTF)
                    println(self.p_bilirubinTF)
                    println("fim")
                    
                }//end of else
                
            })//end of notify
    }//end of getParameters
     var sofa:Int=0
    func calcResultSofa(){
        
        if (sofa >= 0 && sofa <= 6){
            
            //mortality = 10%
            //paciente recebe a cor: #D1F2A5
            let alert = UIAlertController(title: "Sofa Result", message: "Sofa = \(sofa)"  , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
            
        else if (sofa >= 7 && sofa <= 9){
            
            //mortality = 15% - 20%
            //paciente recebe a cor: #EFFAB4
            let alert = UIAlertController(title: "Sofa Result", message: "Sofa = \(sofa)"  , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
            
        else if (sofa >= 10 && sofa <= 12){
            
            //mortality = 40 - 50%
            //paciente recebe a cor: #FFC48C
            let alert = UIAlertController(title: "Sofa Result", message: "Sofa = \(sofa)"  , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
            
        else if (sofa >= 13 && sofa <= 14){
            
            //mortality = 50% - 60%
            //paciente recebe a cor: #FF9F80
            let alert = UIAlertController(title: "Sofa Result", message: "Sofa = \(sofa)"  , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
            
        else if (sofa >= 15){
            
            //mortality > 60%
            //paciente recebe a cor: #F56991
            let alert = UIAlertController(title: "Sofa Result", message: "Sofa = \(sofa)"  , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return ;
        }
            
        else{
            //erro
        }
    }//fim da funcao calc result sofa
    
 
    
    
    func calcSofa(doubleFIO2:Double, doublepa02:Double, mechVentSwitch:UISwitch, doubleglasgow:Double, doubleBilirubin:Double, doubleMap:Double, doubleDop:Double, doubleDob:Double, doubleEpi:Double, doubleNor:Double, doublePlatelets:Double, doubleCreatinine:Double , creaUrineSegmentTF:UISegmentedControl){
        
        
            //calculating FIO2
            
            //fio2 comes in %
            
            //var doubleFIO2:Double = (FIO2TF as NSString).doubleValue
            
            //var doublepa02:Double = (pa02 as NSString).doubleValue
            
            var doubleRespiratory = doublepa02 / (doubleFIO2/100)
            
            if (doubleRespiratory > 400){
                sofa = sofa+0
            }
                
            else if(doublepa02 > 300 && doublepa02 <= 400){
                sofa = sofa+1
            }
                
            else if (doublepa02 > 200 && doublepa02 <= 300){
                sofa = sofa+2
            }
                
            else if (doublepa02 > 100 && doublepa02 <= 200
                
                && mechVentSwitch.on ){
                    sofa = sofa+3
                    
            }
                
            else if (doublepa02 >= 1 && doublepa02 <= 100 && mechVentSwitch.on){
                
                sofa = sofa+4
                
            }
                
            else{
                //erro Apenas preciso verificar se mechVentSwith sempre vai estar ON nos dois ultimos casos
            }

            //calculating glasgow
            
            /*
            
            3 = coma profundo com 85% de probabilidade de morte, estado vegetativo
            
            4 = coma profundo
            
            7 = coma intermediario
            
            11 = coma superficial
            
            15 = normalidade
            
            
            
            Nao aceitar valores < 0
            
            */
            
//            var doubleglasgow:Double = (glasgowTF as NSString).doubleValue
            
            if(doubleglasgow == 13 || doubleglasgow == 14){
                
                sofa = sofa+1
                
            }
                
            else if (doubleglasgow >= 10 && doubleglasgow <= 12){
                
                sofa = sofa+2
                
            }
                
            else if (doubleglasgow >= 6 && doubleglasgow <= 9 ){
                
                sofa = sofa+3
                
            }
                
            else if (doubleglasgow < 6 && doubleglasgow >= 0){
                
                sofa = sofa+4
                
            }
                
            else if (doubleglasgow == 15){
                
                sofa = sofa+0
                
            }
                
            else{
                
                //erro
                
            }

            //calculating bilirubing
            
            /*
            
            bilirubin tem duas unidades mesmo. A em mg/dl pode ser double
            
            a em mol eh inteiro. Acho melhor tratarmos como double tudo.
            
            */
            
            //var doubleBilirubin:Double = (bilirubinTF as NSString).doubleValue
            
            if (doubleBilirubin < 1.2 || doubleBilirubin < 20 ){
                
                sofa = sofa+0
                
            }
            
            if( (doubleBilirubin >= 1.2 && doubleBilirubin <= 1.9)
                
                || (doubleBilirubin >= 20 && doubleBilirubin <= 32) ){
                    
                    sofa = sofa+1
            }
                
            else if( (doubleBilirubin > 1.9 && doubleBilirubin <= 5.9)
                
                || (doubleBilirubin > 32 && doubleBilirubin <= 101) ){
                    
                    sofa = sofa+2
            }
                
            else if( (doubleBilirubin > 5.9 && doubleBilirubin <= 11.9)
                
                || (doubleBilirubin > 101 && doubleBilirubin <= 204) ){
                    
                    sofa = sofa+3
            }
                
            else if( doubleBilirubin > 11.9 || doubleBilirubin > 204 ){
                
                sofa = sofa+4
            }
                
            else{
                //erro
            }

            //calculating cardiovascular using wikipedia
            
            /*
            
            MAP = pressao arterial media
            
            dop = dopamina
            
            dob = dobutamina
            
            epi = epinefrina ou adrenalina (mesma coisa)
            
            nor = noradrenalina
            
            */
            
            /*var doubleMap:Double = (mapTF as NSString).doubleValue
            
            var doubleDop:Double = (dopTF as NSString).doubleValue
            
            var doubleEpi:Double = (epiTF as NSString).doubleValue
            
            var doubleNor:Double = (norTF as NSString).doubleValue*/
            
            if (doubleMap > 70){
                sofa = sofa + 0
            }
            else if (doubleMap < 70){
                
                sofa = sofa+1
                
            }
                
            else if (doubleDop <= 5 || doubleDob > 0){
                
                sofa = sofa+2
                
            }
                
            else if ((doubleDop > 5 && doubleDop <= 15) || doubleEpi <= 0.1 || doubleNor <= 0.1){
                
                sofa = sofa+3
                
            }
                
            else if (doubleDop > 15 || doubleEpi > 0.1 || doubleNor > 0.1){
                
                sofa = sofa+4
                
            }
                
            else{
                
                //erro
                
            }

            //calculating coagulation (platelets)
            
            //var doublePlatelets:Double = (plateletsTF as NSString).doubleValue
            
            if (doublePlatelets > 150){
                
                sofa = sofa+0
                
            }
                
            else if(doublePlatelets > 100 && doublePlatelets <= 150){
                
                sofa = sofa+1
                
            }
                
            else if (doublePlatelets > 50 && doublePlatelets <= 100){
                
                sofa = sofa+2
                
            }
                
            else if (doublePlatelets > 20 && doublePlatelets <= 50 ){
                
                sofa = sofa+3
                
            }
                
            else if (doublePlatelets > 0 && doublePlatelets <= 20 ){
                
                sofa = sofa+4
            }
                
            else{
                
                //erro
                
            }

            //calculating creatinine
            //arrumar para caso creatinina, caso urina output
            
            //var doubleCreatinine:Double = (creatinineTF as NSString).doubleValue
        
        //println ("SELECTED")
       // creaUrineSegment.selectedSegmentIndex = 0
            var selected:Int = creaUrineSegmentTF.selectedSegmentIndex
            
            // creatinine
            
            if (selected == 0){
                
                if (doubleCreatinine < 1.2 || doubleCreatinine < 110){
                    
                    sofa = sofa+0
                    
                }
                    
                else if( (doubleCreatinine >= 1.2 && doubleCreatinine <= 1.9)
                    
                    || (doubleCreatinine >= 110 && doubleCreatinine <= 170) ){
                        
                        sofa = sofa+1
                        
                }
                    
                else if( (doubleCreatinine > 1.9 && doubleCreatinine <= 3.4)
                    
                    || (doubleCreatinine > 170 && doubleCreatinine <= 299) ){
                        
                        sofa = sofa+2
                        
                }
                    
                else if( (doubleCreatinine > 3.4 && doubleCreatinine <= 4.9)
                    
                    || (doubleCreatinine > 299 && doubleCreatinine <= 440) ){
                        
                        sofa = sofa+3
                        
                }
                    
                else if( doubleCreatinine > 4.9 || doubleCreatinine > 440 ){
                    
                    sofa = sofa+4
                    
                }
                    
                else{
                    
                    //erro
                    
                }
                
            }//fim do if de selected == 0
                
            else {
                
                //urine output
                
                if (doubleCreatinine < 500 && doubleCreatinine >= 200){
                    
                    sofa = sofa+3
                    
                }
                    
                else if (doubleCreatinine < 200){
                    
                    sofa = sofa+4
                    
                }
                    
                else{
                    //erro
                }
                
            }//fim do else de selected = 1
    
        calcResultSofa()
    }//fim da funcao
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabController = self.tabBarController as! ConsultationTabsController
        
        self.parentViewController?.navigationItem.title = tabController.patientName
        self.parentViewController?.navigationController?.navigationBar.barTintColor = tabController.barColor
        self.parentViewController?.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        getParameters()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // esses dois métodos são para o teclado minimizar quando clicar fora
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}