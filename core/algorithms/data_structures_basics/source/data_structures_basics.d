module data_structures_basics;

private enum int FAILURE_VALUE = -1;

class Node
{
    private int _value;
    private Node _next;

    this(int value)
    {
        this._value = value;
        this._next = null;
    }

    @property int value() { return this._value; }
    @property Node next() { return this._next; }
    @property void next(Node next) { this._next = next; }
}

class LinkedList
{
    private Node _head;
    private Node _tail;
    private size_t _count;

    this()
    {
        this._head = null;
        this._tail = null;
        this._count = 0;
    }

    @property int headValue() {
        return FAILURE_VALUE;
    }
    @property bool isEmpty() { return this._count == 0; }
    @property size_t size() { return this._count; }

    void insertHead(int value)
    {
    }

    void insertTail(int value)
    {
    }

    bool deleteValue(int value)
    {
        return false;
    }
}

class Stack
{
    private Node _top;
    private size_t _count;

    this()
    {
        this._top = null;
        this._count = 0;
    }

    @property bool isEmpty() { return this._count == 0; }
    @property size_t size() { return this._count; }

    void push(int value)
    {
    }

    int peek()
    {
        return FAILURE_VALUE;
    }

    int pop()
    {
        return FAILURE_VALUE;
    }
}

class Queue
{
    private Node _front;
    private Node _rear;
    private size_t _count;

    this()
    {
        this._front = null;
        this._rear = null;
        this._count = 0;
    }

    @property bool isEmpty() { return this._count == 0; }
    @property size_t size() { return this._count; }

    void enqueue(int value)
    {
    }

    int peek()
    {
        return FAILURE_VALUE;
    }

    int dequeue()
    {
        return FAILURE_VALUE;
    }
}
