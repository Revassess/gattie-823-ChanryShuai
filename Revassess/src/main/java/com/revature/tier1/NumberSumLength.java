package com.revature.tier1;

import java.util.ArrayList;

public class NumberSumLength {

	public static boolean checkNumberPowerLength(long num) {

		int sum = 0;
		ArrayList<Integer> array = new ArrayList<Integer>();
		do {
			array.add((int) (num % 10));
			num /= 10;

		} while (num > 0);
		int power = array.size();
		for (int i : array) {
			sum = sum + (int)Math.pow(i, power);
		}
		if (sum == num) {
			return true;
		} else {

			return false;
		}

	}
}