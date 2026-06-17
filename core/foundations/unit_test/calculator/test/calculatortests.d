module d.core.foundations.unit_test.calculator.test.calculatortests;

import calculator;

unittest
{
    assert(addition(3, 2) == 5);
}

unittest
{
    assert(substraction(5, 2) == 3);
}

unittest
{
    assert(multiplication(4, 3) == 12);
}

unittest
{
    assert(division(10, 3) == 3);
}

unittest
{
    assert(modulus(10, 3) == 1);
}