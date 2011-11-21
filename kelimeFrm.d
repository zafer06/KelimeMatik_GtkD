module kelimeFrm;

import gtk.Main;

import kelime;

version(unittest) 
{
	void main()
	{
		// main
	}

} 
else 
{ // version(unittest)

	void main(string[] args)
	{
		Main.init(args);
		
		AnaEkran ae = new AnaEkran();
		
		Main.run();
	}

} // version(unittest)
