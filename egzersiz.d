module egzersiz;

import std.stdio;
import std.array;
import std.string;
import std.process;

import veri;

class Egzersiz
{
	private string _dosyaAdresi	;
	
	public this(string dosyaAdresi)
	{
		_dosyaAdresi = dosyaAdresi;
	}
	
	public void EgzersizBaslat()
	{
		Veri veriler = new Veri(_dosyaAdresi);
	
		Kelime[] kelimeListe = veriler.VerKelimeListesi();
	
		foreach (kelime; kelimeListe)
		{
			//EkraniTemizle();
			
			writeln("Soru  : ", kelime.soru);
			
			write("Cevap : ");
			string verilenCevap = chomp(readln());

			if (CevabiKontrolEt(kelime, verilenCevap))
			{
				writeln("Tebrikler! dogru cevap\n");
			}
			else
			{
				writeln("Uzgunum! yanlis cevap\n");
			}
		}	
	}
	
	public void EgzersizBaslat(int soruSayisi)
	{
		Veri veriler = new Veri(_dosyaAdresi);
	
		Kelime[] kelimeListe = veriler.VerKelimeListesi();
		
		foreach (kelime; kelimeListe)
		{
			//EkraniTemizle();
			
			writeln("Soru  : ", kelime.soru);
			
			write("Cevap : ");
			string verilenCevap = chomp(readln());

			if (CevabiKontrolEt(kelime, verilenCevap))
			{
				writeln("Tebrikler! dogru cevap\n");
			}
			else
			{
				writeln("Uzgunum! yanlis cevap\n");
			}
		}
	}
	
	private bool CevabiKontrolEt(Kelime kelime, string verilenCevap)
	{
		bool cevapDogruMu = false;
		
		foreach (cevap; kelime.cevaplar)
		{
			if (toLower(verilenCevap) == toLower(cevap))
			{
				cevapDogruMu = true;
				break;
			}
		}
		
		return cevapDogruMu;
	}
	
	private void EkraniTemizle()
	{
		system("clear");
	}
}	
