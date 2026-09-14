module d.core.algorithms.naive_sort.test.naivesorttests;

import naive_sort;

// Fixtures: one immutable manifest constant per input/output case. Immutable
// fixtures are shared between cases, so each input is duplicated (`.dup`) when
// passed to an in-place sort to guarantee no mutation leaks between cases.
static immutable int[] standardInput = [5, 2, 9, 1, 5, 6];
static immutable int[] standardOutput = [1, 2, 5, 5, 6, 9];

static immutable int[] sortedInput = [1, 2, 3, 4, 5];
static immutable int[] sortedOutput = [1, 2, 3, 4, 5];

static immutable int[] reverseInput = [5, 4, 3, 2, 1];
static immutable int[] reverseOutput = [1, 2, 3, 4, 5];

static immutable int[] identicalInput = [7, 7, 7, 7];
static immutable int[] identicalOutput = [7, 7, 7, 7];

static immutable int[] negativeInput = [3, -1, 4, -5, 0];
static immutable int[] negativeOutput = [-5, -1, 0, 3, 4];

static immutable int[] singleInput = [42];
static immutable int[] singleOutput = [42];

static immutable int[] emptyInput = [];
static immutable int[] emptyOutput = [];

alias SortFn = int[] function(int[]);

// Runs the 8 shared cases against any sort function.
private void assertSortsAllCases(SortFn sort, string algorithmName)
{
    assert(sort(standardInput.dup) == standardOutput,
        algorithmName ~ " should sort an unsorted array");
    assert(sort(sortedInput.dup) == sortedOutput,
        algorithmName ~ " should keep an already sorted array sorted");
    assert(sort(reverseInput.dup) == reverseOutput,
        algorithmName ~ " should sort a reverse ordered array");
    assert(sort(identicalInput.dup) == identicalOutput,
        algorithmName ~ " should sort identical elements");
    assert(sort(negativeInput.dup) == negativeOutput,
        algorithmName ~ " should sort an array with negative numbers");
    assert(sort(singleInput.dup) == singleOutput,
        algorithmName ~ " should sort a single element array");
    assert(sort(emptyInput.dup) == emptyOutput,
        algorithmName ~ " should sort an empty array");
    assert(sort(null) is null,
        algorithmName ~ " should return the failure indicator for a null array");
}

unittest
{
    assertSortsAllCases(&selectionSort, "selectionSort");
}

unittest
{
    assertSortsAllCases(&bubbleSort, "bubbleSort");
}

unittest
{
    assertSortsAllCases(&insertionSort, "insertionSort");
}
