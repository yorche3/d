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

    @property bool isEmpty() { return this._count == 0; }
    @property size_t size() { return this._count; }
    @property int headValue() {
        if (isEmpty)
        {
            return FAILURE_VALUE;
        }
        return this._head.value;
    }

    void insertHead(int value)
    {
        auto newNode = new Node(value);
        if (isEmpty)
        {
            this._head = newNode;
            this._tail = newNode;
        }
        else
        {
            newNode.next = this._head;
            this._head = newNode;
        }
        this._count++;
    }

    void insertTail(int value)
    {
        auto newNode = new Node(value);
        if (isEmpty)
        {
            this._head = newNode;
            this._tail = newNode;
        }
        else
        {
            this._tail.next = newNode;
            this._tail = newNode;
        }
        this._count++;
    }

    bool deleteValue(int value)
    {
        Node previous = null;
        Node current = this._head;
        while (current !is null)
        {
            if (current.value == value)
            {
                if (previous is null)
                {
                    this._head = current.next;
                    if (this._head is null)
                    {
                        this._tail = null;
                    }
                }
                else
                {
                    previous.next = current.next;
                    if (previous.next is null)
                    {
                        this._tail = previous;
                    }
                }
                this._count--;
                return true;
            }
            previous = current;
            current = current.next;
        }
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
        auto newNode = new Node(value);
        if (isEmpty)
        {
            this._top = newNode;
        }
        else
        {
            newNode.next = this._top;
            this._top = newNode;
        }
        this._count++;
    }

    int peek()
    {
        if (isEmpty)
        {
            return FAILURE_VALUE;
        }
        return this._top.value;
    }

    int pop()
    {
        if (isEmpty)
        {
            return FAILURE_VALUE;
        }
        auto value = this._top.value;
        this._top = this._top.next;
        this._count--;
        return value;
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
        auto newNode = new Node(value);
        if (isEmpty)
        {
            this._front = newNode;
            this._rear = newNode;
        }
        else
        {
            this._rear.next = newNode;
            this._rear = newNode;
        }
        this._count++;
    }

    int peek()
    {
        if (isEmpty)
        {
            return FAILURE_VALUE;
        }
        return this._front.value;
    }

    int dequeue()
    {
        if (isEmpty)
        {
            return FAILURE_VALUE;
        }
        auto value = this._front.value;
        this._front = this._front.next;
        if (this._front is null)
        {
            this._rear = null;
        }
        this._count--;
        return value;
    }
}
