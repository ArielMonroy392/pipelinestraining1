using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace myApp.Tests
{
    [TestClass]
    public class MyAppPrintsOutput
    {
        [TestMethod]
        public void IsConsoleOutput_Printed()
        {

            // Program _program = new Program();
            // _program.say_hello();
            // _program.say_bye();

            Program.Main();

        }
    }
}
