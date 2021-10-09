@isTest
private class Test_FactorialController {
    
    @isTest
    static void factorialResultTest() {
        FactorialController factorialCtrl = new FactorialController();
        
        String expected1 = 'number, please';
        String expected2 = 'Way too high!';
        String expected3 = '';
        String expected4 = '¿?';
        
        // Test first if
        factorialCtrl.input = 0;
        factorialCtrl.factorialResult();
        System.assertEquals(expected1, factorialCtrl.overflowOutput);
        System.assertEquals(null, factorialCtrl.output);
        
        // Test first else if
        factorialCtrl.input = 20;
        factorialCtrl.factorialResult();
        System.assertEquals(expected2, factorialCtrl.overflowOutput);
        System.assertEquals(null, factorialCtrl.output);
        
        // Test second else if
        factorialCtrl.input = 5;
        factorialCtrl.factorialResult();
        System.assertEquals(expected3, factorialCtrl.overflowOutput);
        System.assertEquals(120, factorialCtrl.output);
        
        // Test else
        factorialCtrl.input = -8;
        factorialCtrl.factorialResult();
        System.assertEquals(expected4, factorialCtrl.overflowOutput);
        System.assertEquals(null, factorialCtrl.output);
    }
    
    @isTest
    static void factorialTest() {
        FactorialController factorialCtrl = new FactorialController();
        
        Integer result1 = factorialCtrl.factorial(10);
        Integer result2 = factorialCtrl.factorial(6);
        Integer result3 = factorialCtrl.factorial(4);
        
        System.assertEquals(3628800, result1);
        System.assertEquals(720, result2);
        System.assertEquals(24, result3);
    }
    
	@isTest
    static void randomColorTest() {
        FactorialController factorialCtrl = new FactorialController();
        
        String returnedStr = factorialCtrl.randomColor();
        List<String> arr = returnedStr.split('');
        Boolean checkArrSize = (arr.size() >= 5 && arr.size() <= 11);
        System.assert(checkArrSize);
    }
}