module d.core.foundations.unit_test.calculator.test.calculatoritertests;

import calculator;

unittest
{
    assert(sumFirstNIter(0) == 0);
    assert(sumFirstNIter(3) == 6);
}

unittest
{
    assert(factorialIter(0) == 1);
    assert(factorialIter(4) == 24);
}

unittest
{
    assert(fibonacciIter(0) == 0);
    assert(fibonacciIter(1) == 1);
    assert(fibonacciIter(6) == 8);
}

unittest
{
    assert(largestCommonDivisorIter(12, 8) == 4);
    assert(largestCommonDivisorIter(7, 5) == 1);
}

unittest
{
    assert(leastCommonMultipleIter(8, 6) == 24);
    assert(leastCommonMultipleIter(6, 4) == 12);
}