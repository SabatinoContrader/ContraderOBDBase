package automotive;

import controller.ControllerSingleton;
import dao.ConnessioneDB;
import dao.GestioneUtenteDAO;
import model.Utente;
import utility.Utility;
import view.HomeView;

public class MainApplication {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		//Test Registrazione
		//GestioneUtenteDAO.signUp();
		
		//Test Registrazione Azienda
		//ControllerSingleton.getIstance().signUpAziende();
		
		String email;
		String password;
		
		Utente o = null;
			
		System.out.println("Benvenuto...\n");
		
		System.out.println("Log In...");
		
		
		while(o == null) {
			
			System.out.println();
			
			System.out.println("Email:");
			email = Utility.getInput();
			
			System.out.println("Password:");
			password = Utility.getInput();
			
			System.out.println("Accesso in Corso...");
			
			 o =  GestioneUtenteDAO.logIn(email, password);
			
		}
		
		
		
		for(int i = 0; i < o.getAuto().size(); i ++) System.out.println(o.getAuto().get(i).getID());
	
		HomeView.runHomeView(o);
		
		
		
		
		
		ConnessioneDB.closeConnection();
		
	}

	
}
