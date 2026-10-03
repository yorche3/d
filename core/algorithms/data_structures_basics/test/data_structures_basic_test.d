module data_structures_basic_test;

import data_structures_basics;

enum int failureValue = -1;

enum int nodeFirstInput = 10;
enum int nodeSecondInput = 20;
enum int nodeFirstOutput = 10;
enum int nodeSecondOutput = 20;

enum int listTailFirstInput = 10;
enum int listTailSecondInput = 20;
enum int listHeadInput = 5;
enum int listTailDuplicateInput = 10;
enum int listAbsentInput = 99;
enum size_t listInsertedSizeOutput = 4;
enum size_t listDeletedSizeOutput = 3;
enum size_t emptySizeOutput = 0;

enum int stackFirstInput = 10;
enum int stackSecondInput = 20;
enum int stackThirdInput = 30;
enum int stackReuseInput = 40;
enum size_t stackFilledSizeOutput = 3;

enum int queueFirstInput = 10;
enum int queueSecondInput = 20;
enum int queueThirdInput = 30;
enum int queueReuseInput = 40;
enum size_t queueFilledSizeOutput = 3;

private void assertNodeCases()
{
    auto firstNode = new Node(nodeFirstInput);

    assert(firstNode.value == nodeFirstOutput,
        "Node should preserve its initialized value");
    assert(firstNode.next is null,
        "Node should have an absent next link after initialization");

    auto secondNode = new Node(nodeSecondInput);
    firstNode.next = secondNode;

    assert(firstNode.next.value == nodeSecondOutput,
        "Node should traverse to its linked node");
    assert(secondNode.next is null,
        "Node should leave a newly initialized linked node without a next link");
}

private void assertLinkedListCases()
{
    auto list = new LinkedList();

    assert(list.isEmpty,
        "LinkedList should be empty after initialization");
    assert(list.size == emptySizeOutput,
        "LinkedList should have size zero after initialization");
    assert(list.headValue == failureValue,
        "LinkedList should return the failure indicator when empty");

    list.insertTail(listTailFirstInput);
    list.insertTail(listTailSecondInput);
    list.insertHead(listHeadInput);
    list.insertTail(listTailDuplicateInput);

    assert(list.size == listInsertedSizeOutput,
        "LinkedList should contain four values after inserts at both ends");
    assert(list.headValue == listHeadInput,
        "LinkedList should expose the head value after inserts at both ends");

    assert(list.deleteValue(listTailFirstInput),
        "LinkedList should delete the first occurrence of a value");
    assert(list.headValue == listHeadInput,
        "LinkedList should preserve the head after deleting a later value");
    assert(list.size == listDeletedSizeOutput,
        "LinkedList should decrease size after deleting the first occurrence");

    assert(!list.deleteValue(listAbsentInput),
        "LinkedList should return failure for an absent value");
    assert(list.headValue == listHeadInput,
        "LinkedList should preserve contents after an absent value deletion");
    assert(list.size == listDeletedSizeOutput,
        "LinkedList should preserve size after an absent value deletion");

    assert(list.deleteValue(listHeadInput),
        "LinkedList should delete the head while emptying the list");
    assert(list.deleteValue(listTailSecondInput),
        "LinkedList should delete the middle value while emptying the list");
    assert(list.deleteValue(listTailDuplicateInput),
        "LinkedList should delete the final value while emptying the list");
    assert(list.isEmpty,
        "LinkedList should be empty after deleting all values");
    assert(list.size == emptySizeOutput,
        "LinkedList should have size zero after deleting all values");
    assert(list.headValue == failureValue,
        "LinkedList should return the failure indicator after being emptied");
}

private void assertStackCases()
{
    auto stack = new Stack();

    assert(stack.isEmpty,
        "Stack should be empty after initialization");
    assert(stack.size == emptySizeOutput,
        "Stack should have size zero after initialization");
    assert(stack.peek() == failureValue,
        "Stack should return the failure indicator when peeking empty");
    assert(stack.pop() == failureValue,
        "Stack should return the failure indicator when popping empty");

    stack.push(stackFirstInput);
    stack.push(stackSecondInput);
    stack.push(stackThirdInput);

    assert(stack.peek() == stackThirdInput,
        "Stack should peek the most recently pushed value");
    assert(stack.size == stackFilledSizeOutput,
        "Stack should preserve size after a non-mutating peek");

    assert(stack.pop() == stackThirdInput,
        "Stack should pop the top value first");
    stack.push(stackReuseInput);
    assert(stack.pop() == stackReuseInput,
        "Stack should pop a reused top value first");
    assert(stack.pop() == stackSecondInput,
        "Stack should retain LIFO order after reuse");
    assert(stack.pop() == stackFirstInput,
        "Stack should pop the earliest value last");
    assert(stack.isEmpty,
        "Stack should be empty after all values are popped");
    assert(stack.size == emptySizeOutput,
        "Stack should have size zero after all values are popped");

    assert(stack.pop() == failureValue,
        "Stack should return the failure indicator after being emptied");
    assert(stack.isEmpty,
        "Stack should remain empty after a failed pop");
}

private void assertQueueCases()
{
    auto queue = new Queue();

    assert(queue.isEmpty,
        "Queue should be empty after initialization");
    assert(queue.size == emptySizeOutput,
        "Queue should have size zero after initialization");
    assert(queue.peek() == failureValue,
        "Queue should return the failure indicator when peeking empty");
    assert(queue.dequeue() == failureValue,
        "Queue should return the failure indicator when dequeuing empty");

    queue.enqueue(queueFirstInput);
    queue.enqueue(queueSecondInput);
    queue.enqueue(queueThirdInput);

    assert(queue.peek() == queueFirstInput,
        "Queue should peek the first enqueued value");
    assert(queue.size == queueFilledSizeOutput,
        "Queue should preserve size after a non-mutating peek");

    assert(queue.dequeue() == queueFirstInput,
        "Queue should dequeue the first value first");
    queue.enqueue(queueReuseInput);
    assert(queue.dequeue() == queueSecondInput,
        "Queue should retain FIFO order after reuse");
    assert(queue.dequeue() == queueThirdInput,
        "Queue should dequeue the earlier remaining value before reuse");
    assert(queue.dequeue() == queueReuseInput,
        "Queue should dequeue the reused value last");
    assert(queue.isEmpty,
        "Queue should be empty after all values are dequeued");
    assert(queue.size == emptySizeOutput,
        "Queue should have size zero after all values are dequeued");

    assert(queue.dequeue() == failureValue,
        "Queue should return the failure indicator after being emptied");
    assert(queue.isEmpty,
        "Queue should remain empty after a failed dequeue");
}

unittest
{
    assertNodeCases();
}

unittest
{
    assertLinkedListCases();
}

unittest
{
    assertStackCases();
}

unittest
{
    assertQueueCases();
}