class Factorial{
    public static void main(String[] a){
        System.out.println(new Fac().ComputeFac((10+0)));
    }
}



class Fac extends Factorial{
    int num_aux;
    public int ComputeFac(int num){
        if ((num <= 1)&&(num != 1)){ // Initially it was num <= 0
            num_aux = (1+0) ; 
        }    // Initially it was num_aux = 1
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }
    
}




