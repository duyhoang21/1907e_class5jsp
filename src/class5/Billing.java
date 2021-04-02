package class5;

import java.util.Iterator;

public class Billing {
	/**
     * Initialize the registrationcost and quantity as zero
     */
    private int registrationcost = 0;
    private int quantity = 0;
    /** 
     * Creates a new instance of Billing 
     */
    public Billing() {
    }
    public void setRegistrationcost(int prod) {
        this.registrationcost = prod;
    }

    /**
     * Return the total cost
     */
    public int getRegistrationcost() {
        return (registrationcost * quantity);
    }
    public void setQuantity(int quant) {
        this.quantity = quant;
    }
    /**
     * Return the total quantity
     */
    public int getQuantity() {
        return quantity;
    }
}
