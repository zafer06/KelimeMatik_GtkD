module kullaniciFrm;

import gtk.Window;
import gtk.Label;
import gtk.Entry;
import gtk.VBox;
import gtk.HBox;
import gtk.Button;
import gtk.MessageDialog;
import gtk.AboutDialog;
import gtk.ComboBox;

import kullanici;

class KullaniciEkran : Window
{
	private Label lblKullaniciAdi;
	private Entry txtKullaniciAdi;
	private ComboBox cmbKullanici;
    
	public this(ComboBox kullanicilar)
	{
        cmbKullanici = kullanicilar;
        
		super("Kullanıcı Ekle");
		EkraniHazirla();
		setSizeRequest(250, 100);
		setPosition(GtkWindowPosition.POS_CENTER_ALWAYS);
		showAll();
	}
	
	private void EkraniHazirla()
	{
		lblKullaniciAdi = new Label("Bir kullanıcı adı girin");
		txtKullaniciAdi = new Entry();

		Button btnKaydet = new Button(" Kaydet ");
		btnKaydet.addOnClicked(&Kaydet_Click);
		
		VBox boxAnaKutu = new VBox(true, 3);
		boxAnaKutu.packStart(lblKullaniciAdi, false, false, 1);
		boxAnaKutu.packStart(txtKullaniciAdi, false, false, 1);
		boxAnaKutu.packStart(btnKaydet, false, false, 0);
		
		add(boxAnaKutu);
	}
	
	private void Kaydet_Click(Button btn)
	{
		Kullanici kisi = new Kullanici();
		kisi.KullaniciEkle(txtKullaniciAdi.getText());
        cmbKullanici.appendText(txtKullaniciAdi.getText());
		
		//MessageDialog d = new MessageDialog(this, GtkDialogFlags.MODAL, MessageType.WARNING, ButtonsType.OK, "This is a popup message!");
		//d.run();
		//d.destroy();
	}
	
	@property string KullaniciAdi()
	{
		return txtKullaniciAdi.getText();
	}
}


