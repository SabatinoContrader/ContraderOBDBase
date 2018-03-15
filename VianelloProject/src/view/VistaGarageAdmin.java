package view;

import controller.ControllerSingleton;
import model.Utente;
import utility.Utility;

public class VistaGarageAdmin {

    public void runVistaCliente(Utente user) {
        //this is an admin;
        System.out.println("SEI LOGGATO COME ADMIN:" + user.getNome());
        System.out.println("//////ADMIN MENU\\\\\\");
        System.out.println("SELEZIONA UN'OPZIONE");
        System.out.println("1) VISUALIZZA AUTO CON GUASTI");
        System.out.println("2) VISUALIZZA LISTA AUTO DELL'AZIENDA");
        System.out.println("3) VAI ARRETRU");


        String opzioneSelezionata = Utility.getInput();
        switch (opzioneSelezionata) {
            case "1":
                showAlerts(user);
                break;
            case "2":
                showCarList(user);
                break;
            case "3":System.out
                    .println("bravo sei tornato indiet");
                HomeView.runHomeView(user);

        }
    }

    private void showAlerts(Utente u) {
        ControllerSingleton.getIstance().showAlerts(u);
    }

    private void showCarList(Utente u) {

        ControllerSingleton.getIstance().showCarList(u);

    }

}
