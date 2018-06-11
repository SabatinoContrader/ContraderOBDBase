import { Utente } from '../../models/Utente';
import { Component, OnInit } from '@angular/core';
import { GuastiService } from '../../services/guasti.service';
import { NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';
import swal from 'sweetalert2';

declare var jquery:any;
declare var $ :any;
@Component({
  selector: 'app-guasti',
  templateUrl: './guasti.component.html',
  styleUrls: ['./guasti.component.css']
})
export class GuastiComponent implements OnInit {

listaGuasti:any;
utente:Utente;
idguasto:number;
telemetria:any;
lat: number = 41.54061;
  lng: number = 14.381826;
  infoWindowOpened;
  constructor(private guastiService:GuastiService) { }

  ngOnInit() {
	   this.utente = JSON.parse(sessionStorage.getItem("loginEntity")).utente;
	  this.getListaGuasti();
	  
  }

   
  clickedMarker(label: string, infoWindow, marker,index: number) {

 if (this.infoWindowOpened === infoWindow) {
        console.log("window already opened");
        return;
    }

    if (this.infoWindowOpened !== null && this.infoWindowOpened !== undefined) {
        this.infoWindowOpened.close();
    }
    this.infoWindowOpened = infoWindow;
  }
  
  
  openModalRisolviGuasto(id: any): void {

    this.idguasto = id;

    $('#modalrisolviguasto').modal("show");

  }

  
  
risolviGuasto(): void{
	this.guastiService.risolviGuasto(this.idguasto).subscribe(
        response => {
			swal("Success", "Guasto risolto con successo", "success");
this.getListaGuasti();
 $('#modalrisolviguasto').modal("hide");

		}
      );
	
}
  
  getListaGuasti():void{
    this.guastiService.getGuasti(this.utente.id)
      .subscribe(
        response => { this.listaGuasti = response.data }
      );
  }
  
  openModalTelemetria(telemetria:any):void{
	  this.telemetria=telemetria;
	  $('#modaldatitelemetria').modal("show");
  }
}