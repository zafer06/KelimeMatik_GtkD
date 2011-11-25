module defter;

import gtk.Notebook;
import gtk.Label;
import gtk.Frame;
import gtk.ComboBox;
import gtk.Button;
import gtk.VBox;
import gtk.HBox;
import gtk.Box;
import gtk.Entry;

import kullaniciFrm;
import kullanici;

class Defter : Notebook
{ 
    private ComboBox cmbKullanici;
    
	public this()
	{
		KullaniciGiris_Sayfasi();
		EgzersizHazirla_Sayfasi();
		Hakkinda_Sayfasi();
	}
    
	private void KullaniciGiris_Sayfasi()
	{
		Label lblSecimMetin = new Label("Lütfen bir kullanıcı seçin");
		
		cmbKullanici = new ComboBox();
		
		Kullanici kullanicilar = new Kullanici();
		
		foreach(isim; kullanicilar.liste)
		{
			cmbKullanici.appendText(isim);	
		}
		
		Label lblVeya = new Label("veya");
		
		Button btnYeniKullaniciEkle = new Button();
		btnYeniKullaniciEkle.setLabel("Yeni kullanıcı ekle");
		btnYeniKullaniciEkle.addOnClicked(&YeniKullaniciEkle_Click);
		
		Box boxGirisKutu = new VBox(false, 3);
		boxGirisKutu.setSpacing = 10;
		
		boxGirisKutu.packStart(lblSecimMetin, false, false, 1);
		boxGirisKutu.packStart(cmbKullanici, false, false, 1);
		boxGirisKutu.packStart(lblVeya, false, false, 1);
		boxGirisKutu.packStart(btnYeniKullaniciEkle, false, false, 1);
		
		Label lblSolBosluk = new Label("");
		Label lblSagBosluk = new Label("");
		
		Box boxHizaKutu = new HBox(false, 3);
		boxHizaKutu.packStartDefaults(lblSolBosluk);
		boxHizaKutu.packStart(boxGirisKutu, false, false, 2);
		boxHizaKutu.packStartDefaults(lblSagBosluk);
		
				
		Frame frame = new Frame("Kullanıcı Girişi");
		frame.setSizeRequest(100, 300);
		frame.add(boxHizaKutu);
		
		Label lblTabGirisBaslik = new Label("Kullanıcı Girişi");
		this.appendPage(frame, lblTabGirisBaslik);		
	}
	
	private void EgzersizHazirla_Sayfasi()
	{
		// Soru kelimesi başlık metni
		Label lblBaslik = new Label("Soru Kelimesi");
		lblBaslik.setMarkup("<span foreground='black' font='20' font_weight='bold'>Soru Kelimesi</span>");
		
		Label lblSoru = new Label("Book");
		lblSoru.setMarkup("<span foreground='black' font='20' font_weight='bold'>Book</span>");
		
		Entry txtCevap = new Entry();
		
		Button btnCevap = new Button("Cevapla");
		btnCevap.addOnClicked(&SoruCevapla_Click);
		
		VBox boxKutu = new VBox(false, 3);
		boxKutu.setSpacing = 10;
		
		boxKutu.packStart(lblSoru, false, false, 1);
		boxKutu.packStart(txtCevap, false, false, 1);
		boxKutu.packStart(btnCevap, false, false, 1);
		
		
		Label lblSolBosluk = new Label("");
		Label lblSagBosluk = new Label("");
		
		HBox boxHizaKutu = new HBox(false, 3);
		boxHizaKutu.packStartDefaults(lblSolBosluk);
		boxHizaKutu.packStart(boxKutu, false, false, 2);
		boxHizaKutu.packStartDefaults(lblSagBosluk);
		
		Frame frame = new Frame("Egzersiz");
		frame.setSizeRequest(50, 50);
		frame.add(boxHizaKutu);
		
		Label lblTabEgzersizBaslik = new Label("Egzersiz Hazırla");
		this.appendPage(frame, lblTabEgzersizBaslik);	
	}
	
	private void Hakkinda_Sayfasi()
	{
		Label lblProgram = new Label("KelimeMatik");
		lblProgram.setMarkup("<span foreground='red' font='32' font_weight='bold'>KelimeMatik</span>");
		
		Label lblSurum = new Label("KelimeMatik");
		lblSurum.setMarkup("<span foreground='red' font='10' font_weight='bold'>sürüm : 0.5.0 (Begonya)</span>");
		
		Label lblHazirlayan = new Label("Hazırlayanlar");
		lblHazirlayan.setMarkup("<span foreground='black' font='20' font_weight='bold'>Hazırlayanlar</span>");
		
		Label lblZafer = new Label("Zafer Çelenk");
		lblZafer.setMarkup("<span foreground='black' font='12'>Zafer Çelenk</span>");
		
		Label lblAli = new Label("Ali Çehreli");
		lblAli.setMarkup("<span foreground='black' font='12'>Ali Çehreli</span>");
		
		VBox kutu = new VBox(false, 5);
		kutu.packStart(lblProgram, false, false, 1);
		kutu.packStart(lblSurum, false, false, 1);
		kutu.packStart(lblHazirlayan, false, false, 20);
		kutu.packStart(lblZafer, false, false, 1);
		kutu.packStart(lblAli, false, false, 1);
		
		Frame frame = new Frame("Hakkında");
		//frame.setSizeRequest(100, 300);
		frame.add(kutu);
		
		Label lblTabHakkinda = new Label("Hakkında");
		this.appendPage(frame, lblTabHakkinda);	
	}
	
	private void YeniKullaniciEkle_Click(Button btn)
	{
		KullaniciEkran kullanici = new KullaniciEkran(cmbKullanici);
		
		//cmbKullanici.appendText(kullanici.KullaniciAdi);
	}
	
	private void SoruCevapla_Click(Button btn)
	{
		//
	}
}
