using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace _5XmlReaderSongs
{
    class Program
    {
        static void Main(string[] args)
        {
            using (XmlReader reader = XmlReader.Create("../../../catalog.xml"))
            {
                while (reader.Read())
                {
                    if (reader.IsStartElement() && reader.Name == "song")
                    {
                        string songTitle = string.Empty;
                        string songDuration = string.Empty;
                        if (reader.ReadToDescendant("title"))
                        {
                            songTitle = reader.ReadElementString();
                        }

                        if (reader.ReadToNextSibling("duration"))
                        {
                            songDuration = reader.ReadElementString();
                        }

                        Console.WriteLine("{0} - {1}", songTitle, songDuration);
                    }
                }
            }
        }
    }
}
