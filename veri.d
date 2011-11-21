module veri;

import std.stdio;
import std.file;
import std.array;
import std.conv;
import std.xml;

enum Seviye { temel, orta, ileri }

struct Kelime
{
	Seviye seviye;
	string soru;
	string[] cevaplar;
	string[] zitAnlamlar;
}

class Veri
{
	private Kelime[] _kelimeListesi; 
	private string _kelimeDosyasi;
	
	public this(string veriDosyasi)
	{
		assert(exists(veriDosyasi), "Hata, dosya bulunamadi!");
		
		_kelimeDosyasi = veriDosyasi;
		
		KelimeListesiHazirla();
	}

	private void KelimeListesiHazirla()
	{
		string s = cast(string)std.file.read(_kelimeDosyasi); 
	
		// XML formatını kontrol et
		check(s); 
	
		DocumentParser xml = new DocumentParser(s); 
		xml.onStartTag["kelime"] = (ElementParser xml) 
		{ 
			Kelime kelime;
			kelime.seviye = to!Seviye(xml.tag.attr["seviye"]); 
		
			xml.onEndTag["soru"] = (in Element e) { kelime.soru = e.text; }; 
			
			xml.onStartTag["cevaplar"] = (ElementParser xml)
			{
				xml.onEndTag["cevap"] = (in Element e) { kelime.cevaplar ~= e.text; }; 
				xml.parse();
			};
			
			xml.onStartTag["zit-anlamlilar"] = (ElementParser xml)
			{
				xml.onEndTag["zit-anlam"] = (in Element e) { kelime.zitAnlamlar ~= e.text; }; 
				xml.parse();
			};
		
			xml.parse(); 
		
			_kelimeListesi ~= kelime;
		}; 
		
		xml.parse(); 
	}
	
	public Kelime[] VerKelimeListesi()
	{
		return _kelimeListesi;
	}
}

