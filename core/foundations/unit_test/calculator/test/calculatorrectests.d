module d.core.foundations.unit_test.calculator.test.calculatorrectests;

import calculator;

unittest
{
    assert(sumFirstNRec(0) == 0);
    assert(sumFirstNRec(3) == 6);
}

unittest
{
    assert(factorialRec(0) == 1);
    assert(factorialRec(4) == 24);
}

unittest
{
    assert(fibonacciRec(0) == 0);
    assert(fibonacciRec(1) == 1);
    assert(fibonacciRec(6) == 8);
}

unittest
{
    assert(largestCommonDivisorRec(12, 8) == 4);
    assert(largestCommonDivisorRec(7, 5) == 1);
}

unittest
{
    assert(leastCommonMultipleRec(8, 6) == 24);
    assert(leastCommonMultipleRec(6, 4) == 12);
}