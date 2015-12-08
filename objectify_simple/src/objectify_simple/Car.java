package objectify_simple;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Car {
	@Id String vin; // Can be Long, long, or String
    String color;
    
    public Car(String vin, String color) {
    	this.vin = vin;
    	this.color = color;
    }
}
