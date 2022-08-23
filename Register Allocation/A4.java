import syntaxtree.*;
import visitor.*;

public class A4 {
   public static void main(String [] args) {
      try {
         Node root = new microIRParser(System.in).Goal();
        
         Object table = root.accept(new GJDepthFirst1(),null); 
         
         Object table1 = root.accept(new GJDepthFirst(),table);
         root.accept(new GJDepthFirst2(),table1);
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 

