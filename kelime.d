module kelime;

import gtk.Main;
import gtk.MainWindow;
import gtk.Box;
import gtk.VBox;
import gtk.HBox;
import gtk.TextView;
import gtk.Label;
import gtk.Window;
import gtk.Button;
import gtk.Image;
import gtk.Alignment;

import defter;

class AnaEkran : MainWindow
{
	//Label label1;
	//TextView textBox1;
	
	public this()
	{
		super("KelimeMatik -- 0.5.0 (Begonya)");
		EkraniHazirla();
		setSizeRequest(640, 480);
		setPosition(GtkWindowPosition.POS_CENTER_ALWAYS);
		showAll();
	}
	
	private void EkraniHazirla()
	{
		Box main = new VBox(false, 3);
		
		Image imgLogo = new Image("/home/zafer/DProjeler/gtk_test/logo.png");
	
		Defter sayfa = new Defter();
		
		Button btnKapat = new Button();
		btnKapat.setLabel("< Kapat >");
		btnKapat.addOnClicked(&ProgramiKapat);
		
		Alignment hiza = new Alignment(0.97, 0, 0, 0);
		hiza.add(btnKapat);
			
		main.packStart(imgLogo, false, false, 1);
		main.packStart(sayfa, false, false, 2);
		main.packStart(hiza, false, false, 1);

		add(main);
	}
	
	private void ProgramiKapat(Button btn)
	{
		Main.exit(0);
	}
}
