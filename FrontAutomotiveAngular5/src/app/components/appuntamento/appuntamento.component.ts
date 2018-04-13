import { Appuntamento } from '../../models/Appuntamento';
import { Component, OnInit } from '@angular/core';
import { AppuntamentoService } from '../../services/appuntamento.service';
import { Utente } from '../../models/Utente';
import swal from 'sweetalert2';
declare var jquery:any;
declare var $ :any;
@Component({
  selector: 'app-appuntamento',
  templateUrl: './appuntamento.component.html',
  styleUrls: ['./appuntamento.component.css']
})
export class AppuntamentoComponent implements OnInit {

  listaAppuntamenti: Appuntamento[];
  utente: Utente;
idrispapp;
rispostaapp;
statoappuntamento;
  constructor(private appuntamentoService: AppuntamentoService) { }

  ngOnInit() {
	  this.utente = JSON.parse(sessionStorage.getItem("loginEntity")).utente;
	  if(this.utente.ruolo==0){
		  
    
    this.appuntamentoService.getAppuntamenti(this.utente.id)
    .subscribe(
      response =>  { this.listaAppuntamenti = response.data } 
    );
	
	  }else if(this.utente.ruolo==1){
		  
		  this.loadAppuntamentiOfficina();
	
  }
  
  
  }

   rispondiAppuntamento(): void {
	   
	   this.appuntamentoService.rispondiAppuntamento(this.rispostaapp,this.idrispapp,this.statoappuntamento).subscribe(
    
      (response) => {
		  console.log(response);
       /* if (response) {
          
		  this.loginEntity = response;
		sessionStorage.setItem('loginEntity', JSON.stringify(this.loginEntity));
		this.auto = response.statoAuto;
		console.log(response.statoAuto);
		  alert('Auto inserita correttamente');
           $('#modaladdauto').modal("hide");
        }*/
		 this.loadAppuntamentiOfficina();
		 swal("Complimenti", "appuntamento risposto correttamente", "success");

		$('#modalrispondipreventivo').modal("hide");
      },
      err => {
        console.log("Error occured");
      });
       
    
  }
  
   openModalRispondiAppuntamento(id:any):void{
	   
	 this.idrispapp=id;

$('#modalrispondiappuntamento').modal("show");
	  
  }
  
loadAppuntamentiOfficina(): void {
	 this.appuntamentoService.getAppuntamentiOfficina(this.utente.officina.id)
    .subscribe(
      response =>  { console.log("RISOPIs: " + response.data); this.listaAppuntamenti = response.data } 
    );
}
}
