module naive_sort;

// Selection sort implementation
// Input: an array of integers
// Output: the sorted array of integers
int[] selectionSort(int[] arr)
{
    if (arr is null) return null;
    foreach (i; 0 .. arr.length)
    {
        size_t minIndex = i;
        foreach (j; i + 1 .. arr.length)
        {
            if (arr[j] < arr[minIndex])
            {
                minIndex = j;
            }
        }
        if (minIndex != i)
        {
            int temp = arr[i];
            arr[i] = arr[minIndex];
            arr[minIndex] = temp;
        }
    }
    return arr;
}

// Bubble sort implementation
// Input: an array of integers
// Output: the sorted array of integers
int[] bubbleSort(int[] arr)
{
    if (arr is null) return null;
    foreach (i; 0 .. arr.length)
    {
        bool swapped = false;
        foreach (j; 0 .. arr.length - i - 1)
        {
            if (arr[j] > arr[j + 1])
            {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped)
        {
            break;
        }
    }
    return arr;
}

// Insertion sort implementation
// Input: an array of integers
// Output: the sorted array of integers
int[] insertionSort(int[] arr)
{
    if (arr is null) return null;
    foreach (i; 1 .. arr.length)
    {
        int key = arr[i];
        size_t j = i;
        while (j > 0 && arr[j - 1] > key)
        {
            arr[j] = arr[j - 1];
            j--;
        }
        arr[j] = key;
    }
    return arr;
}