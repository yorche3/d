module data_structures_advanced;

abstract class Node
{
    private int _value;

    protected this(int value)
    {
        _value = value;
    }

    @property int value()
    {
        return _value;
    }
}

class TreeNode : Node
{
    private TreeNode _left;
    private TreeNode _right;

    this(int value)
    {
        super(value);
        _left = null;
        _right = null;
    }

    @property TreeNode left()
    {
        return _left;
    }

    @property TreeNode right()
    {
        return _right;
    }

    @property void left(TreeNode node)
    {
        _left = node;
    }

    @property void right(TreeNode node)
    {
        _right = node;
    }
}

class BinaryTree
{
    private TreeNode _root;
    private size_t _count;

    this()
    {
        _root = null;
        _count = 0;
    }

    bool insert(int value)
    {
        if (_root is null)
        {
            _root = new TreeNode(value);
            _count++;
            return true;
        }
        TreeNode current = _root;
        while (true)
        {
            if (value < current.value)
            {
                if (current.left is null)
                {
                    current.left = new TreeNode(value);
                    _count++;
                    return true;
                }
                current = current.left;
            }
            else if (value > current.value)
            {
                if (current.right is null)
                {
                    current.right = new TreeNode(value);
                    _count++;
                    return true;
                }
                current = current.right;
            }
            else
            {
                return true;
            }
        }
    }

    bool contains(int value)
    {
        TreeNode current = _root;
        while (current !is null)
        {
            if (value < current.value)
            {
                current = current.left;
            }
            else if (value > current.value)
            {
                current = current.right;
            }
            else
            {
                return true;
            }
        }
        return false;
    }

    @property bool isEmpty()
    {
        return _count == 0;
    }

    @property size_t size()
    {
        return _count;
    }
}

private class GraphNode : Node
{
    int[] neighbors;
    GraphNode nextVertex;

    this(int label)
    {
        super(label);
        neighbors = null;
        nextVertex = null;
    }
}

class Graph
{
    private GraphNode _vertices;
    private size_t _vertexTotal;
    private size_t _edges;

    this()
    {
        _vertices = null;
        _vertexTotal = 0;
        _edges = 0;
    }

    private GraphNode findVertex(int label)
    {
        GraphNode current = _vertices;
        while (current !is null)
        {
            if (current.value == label)
            {
                return current;
            }
            current = current.nextVertex;
        }
        return null;
    }

    bool addVertex(int label)
    {
        if (findVertex(label) !is null)
        {
            return true;
        }
        GraphNode newVertex = new GraphNode(label);
        newVertex.nextVertex = _vertices;
        _vertices = newVertex;
        _vertexTotal++;
        return true;
    }

    bool addEdge(int u, int v)
    {
        auto vertexU = findVertex(u);
        if (vertexU is null)
        {
            return false;
        }
        if (findVertex(v) is null)
        {
            return false;
        }
        auto neighbors = vertexU.neighbors;
        size_t position = 0;
        while (position < neighbors.length && neighbors[position] < v)
        {
            position++;
        }
        if (position < neighbors.length && neighbors[position] == v)
        {
            return true;
        }
        vertexU.neighbors =
            neighbors[0 .. position] ~ v ~ neighbors[position .. $];
        _edges++;
        return true;
    }

    bool hasEdge(int u, int v)
    {
        auto vertexU = findVertex(u);
        if (vertexU is null)
        {
            return false;
        }
        auto neighbors = vertexU.neighbors;
        size_t position = 0;
        while (position < neighbors.length)
        {
            if (neighbors[position] == v)
            {
                return true;
            }
            position++;
        }
        return false;
    }

    bool getNeighbors(int u, out int[] neighbors)
    {
        auto vertexU = findVertex(u);
        if (vertexU is null)
        {
            neighbors = null;
            return false;
        }
        neighbors = vertexU.neighbors.dup;
        return true;
    }

    @property bool isEmpty()
    {
        return _vertexTotal == 0;
    }

    @property size_t vertexCount()
    {
        return _vertexTotal;
    }

    @property size_t edgeCount()
    {
        return _edges;
    }
}
