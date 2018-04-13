import { Utente } from '../../models/Utente';
import { Component, OnInit } from '@angular/core';
import { DispositiviService } from '../../services/dispositivi.service';
import swal from 'sweetalert2';
declare var jquery:any;
declare var $ :any;

@Component({
  selector: 'app-dispositivi',
  templateUrl: './dispositivi.component.html',
  styleUrls: ['./dispositivi.component.css']
})
export class DispositiviComponent implements OnInit {
	listaDispositivi: any;
	utente: Utente;
	codice;
	
  constructor(private dispositiviService: DispositiviService) { }

  ngOnInit() {
	    this.utente = JSON.parse(sessionStorage.getItem("loginEntity")).utente;
	 this.getListaDispositivi();
  }

   getListaDispositivi(): void{
	  this.dispositiviService.getDispositivi(this.utente.officina.id)
    .subscribe(
      response =>  { this.listaDispositivi = response.data } 
    );
  }
  
      
  public insertDispositivo(){
	  this.dispositiviService.insertDispositivo(this.utente.officina.id,this.codice).subscribe(
      (response) => {
		 this.getListaDispositivi();
      swal("Complimenti", "Dispositivo inserito correttamente", "success");

           $('#modaladddispositivo').modal("hide");
      
      },
      err => {
        console.log("Error occured");
      });
  
  };
  
}