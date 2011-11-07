import std.stdio;
import std.array;
import std.string;
import std.process;

import egzersiz;

version(unittest) {

void main()
{}

} else { // version(unittest)

void main()
{
	Egzersiz calisma = new Egzersiz("data/en-tr.xml");
	calisma.EgzersizBaslat();
}

} // version(unittest)
