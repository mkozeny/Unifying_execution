package main;

import java.io.Serializable;

public class Account implements Serializable {
	private float balance;

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}
	// Other, more interesting methods
}
