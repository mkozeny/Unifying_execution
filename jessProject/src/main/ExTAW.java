package main;

import java.awt.TextArea;
import jess.awt.*;
import jess.*;

public class ExTAW {
	public static void main(String[] unused) throws JessException {
		TextArea ta = new TextArea(20, 80);
		TextAreaWriter taw = new TextAreaWriter(ta);
		Rete r = new Rete();
		r.addOutputRouter("t", taw);
		r.addOutputRouter("WSTDOUT", taw);
		r.addOutputRouter("WSTDERR", taw);
		// Do something interesting, then...
		System.exit(0);
	}
}
