public class FactorialController {
	// Input
    public Integer input {get; set;}
    
    // Output
    public Integer output {get; set;}
    public String overflowOutput {get; set;}
    
    // Help variables
    public String color {get{return randomColor();} set;}
    public String color2 {get{return randomColor();} set;}
    
    // Functions or Actions
    public void factorialResult() {
        if(this.input == 0) {
            this.overflowOutput = 'number, please';
            this.output = null;
            return;
        }else if(this.input >= 16){
            this.overflowOutput = 'Way too high!';
            this.output = null;
            return;
        } else if(this.input > 0 && this.input <= 15){
            this.overflowOutput = '';
            this.output = factorial(this.input);
        } else {
            this.overflowOutput = '¿?';
            this.output = null;
            return;
        }
        
    }
    
    @testVisible
    private Integer factorial(Integer n) {
        return n == 1 ? n : n * factorial(n - 1);
    }
    
    @testVisible
    private String randomColor() {
        Integer red = Integer.valueOf(Math.random() * 255);
    	Integer green = Integer.valueOf(Math.random() * 255);
        Integer blue = Integer.valueOf(Math.random() * 255);
        return red+','+green+','+blue;
    }
}