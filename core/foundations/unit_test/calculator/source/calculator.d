module calculator;

int addition(int a, int b) {
	return a + b;
}

int subtraction(int a, int b) {
	return a - b;
}

int multiplication(int a, int b) {
	int result = 0;
	int aCopy = a;
	foreach (i; 0..b) {
		result = addition(result, aCopy);
	}
	return result;
}

int division(int a, int b) {
	int quotient = 0;
	while (a >= b) {
		a = subtraction(a, b);
		quotient = addition(quotient, 1);
	}
	return quotient;
}

int modulus(int a, int b) {
	int quotient = division(a, b);
	return subtraction(a, multiplication(quotient, b));
}