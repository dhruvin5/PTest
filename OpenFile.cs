using System;
using System.Runtime;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using PChecker.PRuntime;
using PChecker.PRuntime.Values;
using PChecker.PRuntime.Exceptions;
using System.Threading;
using System.Threading.Tasks;

#pragma warning disable 162, 219, 414
namespace PImplementation
{
  public static partial class GlobalFunctions
  {
    public static PrtInt OpenForeignFunction(PrtString filePath,PMachine pMachine)
    { 
        String line;
        try
        {
            //Pass the file path and file name to the StreamReader constructor
            StreamReader sr = new StreamReader(filePath);
            //Read the first line of text
            line = sr.ReadLine();
            //Continue to read until you reach end of file
            while (line != null)
            {
                //write the line to console window
                Console.WriteLine(line);
                //Read the next line
                line = sr.ReadLine();
            }
            //close the file
            sr.Close();
           Console.WriteLine(" Read : "); 
        }
        catch(Exception e)
        {
            Console.WriteLine("Exception: " + e.Message);
            return -1;
        }
        return 0;
    }
  }
}