module data_structures_advanced;

abstract class Node
{
    private int _value;

    protected this(int value)
    {
    }

    @property int value()
    {
        return 0;
    }
}

class TreeNode : Node
{
    this(int value)
    {
        super(value);
    }

    @property TreeNode left()
    {
        return null;
    }

    @property TreeNode right()
    {
        return null;
    }

    @property void left(TreeNode node)
    {
    }

    @property void right(TreeNode node)
    {
    }
}

class BinaryTree
{
    this()
    {
    }

    bool insert(int value)
    {
        return false;
    }

    bool contains(int value)
    {
        return false;
    }

    @property bool isEmpty()
    {
        return false;
    }

    @property size_t size()
    {
        return 0;
    }
}

private class GraphNode : Node
{
    this(int label)
    {
        super(label);
    }
}

class Graph
{
    this()
    {
    }

    bool addVertex(int label)
    {
        return false;
    }

    bool addEdge(int u, int v)
    {
        return false;
    }

    bool hasEdge(int u, int v)
    {
        return false;
    }

    bool getNeighbors(int u, out int[] neighbors)
    {
        return false;
    }

    @property bool isEmpty()
    {
        return false;
    }

    @property size_t vertexCount()
    {
        return 0;
    }

    @property size_t edgeCount()
    {
        return 0;
    }
}
