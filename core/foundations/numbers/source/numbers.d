module numbers;

int sumFirstNRec(int n) {
	if(n < 1) return 0;
	return n + sumFirstNRec(n - 1);
}

int factorialRec(int n) {
	if(n < 1) return 1;
	return n * factorialRec(n - 1);
}

int fibonacciRec(int n) {
	if(n < 2) return n;
	return fibonacciRec(n - 1) + fibonacciRec(n - 2);
}

int largestCommonDivisorRec(int a, int b) {
	if(b == 0) return a;
	int bCopy = b;
	return largestCommonDivisorRec(bCopy, a % b);
}

int leastCommonMultipleRec(int a, int b) {
	return (a / largestCommonDivisorRec(a, b)) * b;
}

int sumFirstNAcc(int n) {
	return sumFirstNHelp(n, 0);
}

int sumFirstNHelp(int n, int acc) {
	if(n < 1) return acc;
	return sumFirstNHelp(n - 1, acc + n);
}

int factorialAcc(int n) {
	return factorialHelp(n, 1);
}

int factorialHelp(int n, int acc) {
	if(n < 1) return acc;
	return factorialHelp(n - 1, acc * n);
}

int fibonacciAcc(int n) {
	return fibonacciHelp(n, 0, 1);
}

int fibonacciHelp(int n, int acc1, int acc2) {
	if(n < 1) return acc1;
	if(n == 1) return acc2;
	return fibonacciHelp(n - 1, acc2, acc1 + acc2);
}

int sumFirstNIter(int n) {
	int acc = 0;
	while(n > 0) {
		acc += n;
		n--;
	}
	return acc;
}

int factorialIter(int n) {
	int acc = 1;
	while(n > 1) {
		acc *= n;
		n--;
	}
	return acc;
}

int fibonacciIter(int n) {
	if(n < 2) return n;
	int acc1 = 0;
	int acc2 = 1;
	while(n > 2) {
		int temp = acc2;
		acc2 += acc1;
		acc1 = temp;
		n--;
	}
	return acc2 + acc1;
}

int largestCommonDivisorIter(int a, int b) {
	while(b != 0) {
		int aux = a % b;
		a = b;
		b = aux;
	}
	return a;
}

int leastCommonMultipleIter(int a, int b) {
	return (a / largestCommonDivisorIter(a, b)) * b;
}