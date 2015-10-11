using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace _6SongsLINQ
{
    class Program
    {
        static void Main(string[] args)
        {
            XDocument document = XDocument.Load("../../../catalog.xml");
            var songs = from song in document.Descendants("song")
                        select new
                        {
                            title = song.Element("title").Value,
                            duration = song.Element("duration").Value
                        };

            Console.WriteLine("Songs found");
            foreach (var song in songs)
            {
                Console.WriteLine("{0} - {1}", song.title, song.duration);
            }
        }
    }
}
