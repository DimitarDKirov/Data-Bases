using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;

namespace _7AddressFile
{
    class Program
    {
        static void Main(string[] args)
        {
            string textFile = "../../PersonData.txt";
            string xmlFile = "../../Person.xml";

            using (XmlTextWriter xmlWriter = new XmlTextWriter(xmlFile, Encoding.GetEncoding("utf-8")))
            {
                xmlWriter.Formatting = Formatting.Indented;
                xmlWriter.IndentChar = '\t';
                xmlWriter.Indentation = 1;

                xmlWriter.WriteStartDocument();
                xmlWriter.WriteStartElement("person");
                xmlWriter.WriteAttributeString("id", "1");

                using (StreamReader fileReader = new StreamReader(textFile))
                {
                    string name = fileReader.ReadLine();
                    xmlWriter.WriteElementString("name", name);
                    string address = fileReader.ReadLine();
                    xmlWriter.WriteElementString("address", address);
                    string phone = fileReader.ReadLine();
                    xmlWriter.WriteElementString("phone", phone);
                }

                xmlWriter.WriteEndElement();
                xmlWriter.WriteEndDocument();
            }
        }
    }
}
