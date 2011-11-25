module kullanici;

import std.stdio;
import std.string;
import std.xml;

class Kullanici
{
	private string _kullaniciAdi;
	
	public this()
	{
		//
	}
	
	public void KullaniciEkle(string kullaniciAdi)
	{
		string[] kullaniciListesi;
		
		kullaniciListesi ~= VerKullaniciListesi();
		kullaniciListesi ~= kullaniciAdi;
		
		auto doc = new Document(new Tag("kullanicilar"));
    
		foreach(i, isim; kullaniciListesi)
		{
			auto birKullanici = new Element("kullanici");
			
			auto birIsim = new Element("isim", isim);

			birKullanici ~= birIsim;
			doc ~= birKullanici;
		}
    
		File xmlDosya = File("data/kullanicilar.xml", "w");
		xmlDosya.writeln("<?xml version=\"1.0\"?>");
		xmlDosya.writefln(join(doc.pretty(3),"\n"));
	}
	
	private string[] VerKullaniciListesi()
	{
		string[] isimListesi;
		
		string s = cast(string)std.file.read("data/kullanicilar.xml"); 
	
		// XML formatını kontrol et
		check(s); 
	
		DocumentParser xml = new DocumentParser(s); 
		xml.onStartTag["kullanici"] = (ElementParser xml) 
		{ 
			string isim;
		
			xml.onEndTag["isim"] = (in Element e) { isim = e.text; }; 
			xml.parse(); 
		
			isimListesi ~= isim;
		}; 
		
		xml.parse(); 
		
		return isimListesi;
	}
	
	@property string[] liste()
	{
		return VerKullaniciListesi();
	}
}
