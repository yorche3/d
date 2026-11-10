module data_structures_advanced_test;

import data_structures_advanced;

enum int nodeValueInput = 10;
enum int nodeLeftInput = 20;
enum int nodeRightInput = 30;

enum int treeRootInput = 50;
enum int treeLowerInput = 30;
enum int treeHigherInput = 70;
enum int treeLowerLeafInput = 20;
enum int treeLowerRightLeafInput = 40;
enum int treeAbsentInput = 99;
enum size_t emptySizeOutput = 0;

enum int labelA = 10;
enum int labelB = 30;
enum int labelC = 50;
enum int labelD = 70;
enum int missingLabel = 99;
enum int secondMissingLabel = 98;

private TreeNode newParentWithChildren()
{
    auto parent = new TreeNode(nodeValueInput);
    parent.left = new TreeNode(nodeLeftInput);
    parent.right = new TreeNode(nodeRightInput);
    return parent;
}

private BinaryTree treeWith(const int[] values)
{
    auto tree = new BinaryTree();
    foreach (value; values)
    {
        assert(tree.insert(value),
            "BinaryTree should succeed when inserting a value");
    }
    return tree;
}

private void assertTreeHolds(BinaryTree tree, const int[] values, size_t expectedSize,
    string caseName)
{
    assert(tree.size == expectedSize,
        "BinaryTree should report the expected size in case: " ~ caseName);
    assert(!tree.isEmpty,
        "BinaryTree should not be empty in case: " ~ caseName);
    foreach (value; values)
    {
        assert(tree.contains(value),
            "BinaryTree should contain every inserted value in case: " ~ caseName);
    }
}

private Graph graphWith(const int[] labels)
{
    auto graph = new Graph();
    foreach (label; labels)
    {
        assert(graph.addVertex(label),
            "Graph should succeed when adding a vertex");
    }
    return graph;
}

private void assertCounts(Graph graph, size_t vertices, size_t edges, string caseName)
{
    assert(graph.vertexCount == vertices,
        "Graph should report the expected vertex count in case: " ~ caseName);
    assert(graph.edgeCount == edges,
        "Graph should report the expected edge count in case: " ~ caseName);
}

private void assertNeighbors(Graph graph, int label, const int[] expected, string caseName)
{
    int[] neighbors;
    assert(graph.getNeighbors(label, neighbors),
        "Graph should succeed when querying neighbors of an existing vertex in case: " ~ caseName);
    assert(neighbors == expected,
        "Graph should return the expected sorted neighbors in case: " ~ caseName);
}

private void assertNoNeighbors(Graph graph, int label, string caseName)
{
    int[] neighbors;
    assert(!graph.getNeighbors(label, neighbors),
        "Graph should fail when querying neighbors of a missing vertex in case: " ~ caseName);
}

// TreeNode

unittest
{
    auto node = new TreeNode(nodeValueInput);
    assert(node.value == nodeValueInput,
        "TreeNode should preserve its value in case: create a tree node");
}

unittest
{
    auto node = new TreeNode(nodeValueInput);
    assert(node.left is null,
        "TreeNode should have an absent left link in case: absent initial links");
    assert(node.right is null,
        "TreeNode should have an absent right link in case: absent initial links");
}

unittest
{
    auto parent = newParentWithChildren();
    assert(parent.left !is null && parent.left.value == nodeLeftInput,
        "TreeNode should expose the linked left child in case: link two children");
    assert(parent.right !is null && parent.right.value == nodeRightInput,
        "TreeNode should expose the linked right child in case: link two children");
}

unittest
{
    auto parent = newParentWithChildren();
    assert(parent.left !is null && parent.left.value == nodeLeftInput,
        "TreeNode should traverse to the left child in case: traverse each link");
    assert(parent.right !is null && parent.right.value == nodeRightInput,
        "TreeNode should traverse to the right child in case: traverse each link");
    assert(parent.left !is null && parent.left.left is null && parent.left.right is null,
        "TreeNode left child should have absent links in case: traverse each link");
    assert(parent.right !is null && parent.right.left is null && parent.right.right is null,
        "TreeNode right child should have absent links in case: traverse each link");
}

unittest
{
    auto parent = newParentWithChildren();

    parent.left = null;
    assert(parent.left is null,
        "TreeNode should have an absent left link after clearing it in case: unlink children");
    assert(parent.value == nodeValueInput,
        "TreeNode should keep its value after clearing left in case: unlink children");
    assert(parent.right !is null && parent.right.value == nodeRightInput,
        "TreeNode should keep the right child after clearing left in case: unlink children");

    parent.right = null;
    assert(parent.left is null && parent.right is null,
        "TreeNode should have both links absent after clearing right in case: unlink children");
    assert(parent.value == nodeValueInput,
        "TreeNode should keep its value after clearing right in case: unlink children");
}

// Immutable adaptation: not applicable; D TreeNode is a mutable class and set_left mutates in place.

// BinaryTree

unittest
{
    auto tree = new BinaryTree();
    assert(tree.isEmpty,
        "BinaryTree should be empty in case: create empty");
    assert(tree.size == emptySizeOutput,
        "BinaryTree should have size zero in case: create empty");
    assert(!tree.contains(treeRootInput),
        "BinaryTree should fail membership in case: create empty");
}

unittest
{
    auto tree = new BinaryTree();
    assert(tree.insert(treeRootInput),
        "BinaryTree should succeed inserting the root in case: insert the root");
    assertTreeHolds(tree, [treeRootInput], 1, "insert the root");
}

unittest
{
    int[] values = [treeRootInput, treeLowerInput, treeHigherInput];
    auto tree = treeWith(values);
    assertTreeHolds(tree, values, 3, "insert lower and higher");
}

unittest
{
    int[] values = [treeRootInput, treeLowerInput, treeHigherInput,
        treeLowerLeafInput, treeLowerRightLeafInput];
    auto tree = treeWith(values);
    assertTreeHolds(tree, values, 5, "multilevel branches");
}

unittest
{
    auto tree = new BinaryTree();
    tree.insert(treeRootInput);
    assert(!tree.contains(treeAbsentInput),
        "BinaryTree should fail membership for a missing value in case: missing value in nonempty tree");
    assertTreeHolds(tree, [treeRootInput], 1, "missing value in nonempty tree");
}

unittest
{
    int[] values = [treeRootInput, treeLowerInput, treeHigherInput];
    auto tree = treeWith(values);
    assert(tree.insert(treeLowerInput),
        "BinaryTree should succeed inserting a duplicate in case: idempotent duplicate");
    assertTreeHolds(tree, values, 3, "idempotent duplicate");
}

unittest
{
    int[] values = [treeLowerLeafInput, treeLowerInput, treeLowerRightLeafInput,
        treeRootInput, treeHigherInput];
    auto tree = treeWith(values);
    assertTreeHolds(tree, values, 5, "ordered insertions");
    assert(!tree.contains(treeAbsentInput),
        "BinaryTree should fail membership for a missing value in case: ordered insertions");
}

// Graph

unittest
{
    auto graph = new Graph();
    assert(graph.isEmpty,
        "Graph should be empty in case: create empty");
    assertCounts(graph, 0, 0, "create empty");
    assert(!graph.hasEdge(labelA, labelB),
        "Graph should fail edge query in case: create empty");
    assertNoNeighbors(graph, labelA, "create empty");
}

unittest
{
    auto graph = new Graph();
    assert(graph.addVertex(labelA),
        "Graph should succeed adding a vertex in case: isolated vertex");
    assert(!graph.isEmpty,
        "Graph should not be empty in case: isolated vertex");
    assertCounts(graph, 1, 0, "isolated vertex");
    assertNeighbors(graph, labelA, [], "isolated vertex");
}

unittest
{
    auto graph = graphWith([labelA, labelD]);
    assert(graph.addEdge(labelA, labelD),
        "Graph should succeed adding an edge in case: nonconsecutive labels and directed edge");
    assert(graph.hasEdge(labelA, labelD),
        "Graph should have the forward edge in case: nonconsecutive labels and directed edge");
    assert(!graph.hasEdge(labelD, labelA),
        "Graph should not have the reverse edge in case: nonconsecutive labels and directed edge");
    assertCounts(graph, 2, 1, "nonconsecutive labels and directed edge");
}

unittest
{
    auto graph = graphWith([labelA, labelB]);
    assert(graph.addEdge(labelA, labelB),
        "Graph should succeed adding an edge in case: duplicate vertex preserves adjacency");
    assert(graph.addVertex(labelA),
        "Graph should succeed re-adding a vertex in case: duplicate vertex preserves adjacency");
    assertCounts(graph, 2, 1, "duplicate vertex preserves adjacency");
    assertNeighbors(graph, labelA, [labelB], "duplicate vertex preserves adjacency");
}

unittest
{
    auto graph = graphWith([labelA, labelB]);
    assert(graph.addEdge(labelA, labelB),
        "Graph should succeed adding an edge in case: duplicate edge");
    assert(graph.addEdge(labelA, labelB),
        "Graph should succeed adding a duplicate edge in case: duplicate edge");
    assertCounts(graph, 2, 1, "duplicate edge");
    assertNeighbors(graph, labelA, [labelB], "duplicate edge");
}

unittest
{
    enum caseName = "missing endpoint without mutation";
    auto graph = graphWith([labelA, labelB]);
    assert(graph.addEdge(labelA, labelB),
        "Graph should succeed adding an edge in case: " ~ caseName);

    assert(!graph.addEdge(labelA, missingLabel),
        "Graph should fail with a missing target in case: " ~ caseName);
    assert(!graph.addEdge(missingLabel, labelA),
        "Graph should fail with a missing source in case: " ~ caseName);
    assert(!graph.addEdge(secondMissingLabel, missingLabel),
        "Graph should fail with two missing endpoints in case: " ~ caseName);
    assert(!graph.addEdge(missingLabel, missingLabel),
        "Graph should fail with a missing self-loop in case: " ~ caseName);

    assertCounts(graph, 2, 1, caseName);
    assertNeighbors(graph, labelA, [labelB], caseName);
    assertNeighbors(graph, labelB, [], caseName);
    assert(!graph.hasEdge(labelA, missingLabel),
        "Graph should not have the attempted edge to a missing target in case: " ~ caseName);
    assert(!graph.hasEdge(missingLabel, labelA),
        "Graph should not have the attempted edge from a missing source in case: " ~ caseName);
    assert(!graph.hasEdge(secondMissingLabel, missingLabel),
        "Graph should not have the attempted edge between missing vertices in case: " ~ caseName);
    assert(!graph.hasEdge(missingLabel, missingLabel),
        "Graph should not have the attempted missing self-loop in case: " ~ caseName);
    assertNoNeighbors(graph, secondMissingLabel, caseName);
    assertNoNeighbors(graph, missingLabel, caseName);
}

unittest
{
    enum caseName = "sorted neighbors and counts";
    auto graph = graphWith([labelA, labelB, labelC, labelD]);
    assert(graph.addEdge(labelA, labelD),
        "Graph should succeed adding the first edge in case: " ~ caseName);
    assert(graph.addEdge(labelA, labelB),
        "Graph should succeed adding the second edge in case: " ~ caseName);
    assert(graph.addEdge(labelA, labelC),
        "Graph should succeed adding the third edge in case: " ~ caseName);
    assert(graph.addEdge(labelB, labelC),
        "Graph should succeed adding the fourth edge in case: " ~ caseName);

    assertNeighbors(graph, labelA, [labelB, labelC, labelD], caseName);
    assertNeighbors(graph, labelB, [labelC], caseName);
    assertNeighbors(graph, labelC, [], caseName);
    assertNeighbors(graph, labelD, [], caseName);
    assertCounts(graph, 4, 4, caseName);
}

unittest
{
    auto graph = graphWith([labelA, labelB]);
    assert(!graph.hasEdge(labelA, labelB),
        "Graph should fail edge query for a missing edge in case: missing-edge query");
    assertCounts(graph, 2, 0, "missing-edge query");
    assert(!graph.isEmpty,
        "Graph should not be empty in case: missing-edge query");
}

unittest
{
    auto graph = graphWith([labelA]);
    int[] neighbors;
    assert(!graph.getNeighbors(missingLabel, neighbors),
        "Graph should fail neighbors of a missing vertex in case: neighbors of missing vertex");
    assertNeighbors(graph, labelA, [], "neighbors of missing vertex");
    assertCounts(graph, 1, 0, "neighbors of missing vertex");
}

unittest
{
    enum caseName = "self-loop and duplicate";
    auto graph = graphWith([labelA]);
    assert(graph.addEdge(labelA, labelA),
        "Graph should succeed adding a self-loop in case: " ~ caseName);
    assert(graph.addEdge(labelA, labelA),
        "Graph should succeed adding a duplicate self-loop in case: " ~ caseName);
    assert(graph.hasEdge(labelA, labelA),
        "Graph should have the self-loop in case: " ~ caseName);
    assertNeighbors(graph, labelA, [labelA], caseName);
    assertCounts(graph, 1, 1, caseName);
}

unittest
{
    enum caseName = "neighbor-result isolation";
    auto graph = graphWith([labelA, labelB, labelC]);
    assert(graph.addEdge(labelA, labelB),
        "Graph should succeed adding an edge in case: " ~ caseName);

    int[] saved;
    assert(graph.getNeighbors(labelA, saved),
        "Graph should succeed saving neighbors in case: " ~ caseName);
    int[] other;
    assert(graph.getNeighbors(labelA, other),
        "Graph should succeed returning another copy in case: " ~ caseName);
    other[0] = missingLabel;

    assertNeighbors(graph, labelA, [labelB], caseName);
    assert(saved == [labelB],
        "Graph should keep the saved neighbors unchanged after modifying another copy in case: " ~ caseName);

    assert(graph.addEdge(labelA, labelC),
        "Graph should succeed adding a later edge in case: " ~ caseName);
    assert(saved == [labelB],
        "Graph should keep the saved neighbors unchanged after a later edge in case: " ~ caseName);
    assertNeighbors(graph, labelA, [labelB, labelC], caseName);
    assertCounts(graph, 3, 2, caseName);
}
