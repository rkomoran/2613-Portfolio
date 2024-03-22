class Graph {
    constructor() {
        this.adjacencyList = {};
    }

    addVertex(vertex) {
        if (!this.adjacencyList[vertex]) {
            this.adjacencyList[vertex] = [];
        }
    }

    addEdge(vertex1, vertex2) {
        // Assuming an undirected graph
        if (!this.adjacencyList[vertex1] || !this.adjacencyList[vertex2]) {
            return "Vertex not found";
        }
        this.adjacencyList[vertex1].push(vertex2);
        this.adjacencyList[vertex2].push(vertex1);
    }

    addEdge(vertex1, vertexes) {
        // Check if vertex1 exists in the adjacency list
        if (!this.adjacencyList[vertex1]) {
            return "Vertex not found";
        }
    
        // Loop through each vertex in vertexes array
        for (let vertex of vertexes) {
            // Check if the current vertex exists in the adjacency list
            if (!this.adjacencyList[vertex]) {
                return "Vertex not found";
            }
            // Add the edge between vertex1 and the current vertex
            this.adjacencyList[vertex1].push(vertex);
            // For undirected graph, also add the edge from the current vertex to vertex1
            this.adjacencyList[vertex].push(vertex1);
        }
    }
    

    printGraph() {
        for (let vertex in this.adjacencyList) {
            console.log(`${vertex} -> ${this.adjacencyList[vertex].join(', ')}`);
        }
    }
}

// Example usage:
let graph = new Graph();

graph.addVertex('A');
graph.addVertex('B');
graph.addVertex('C');
graph.addVertex('D');

// graph.addEdge('A', 'B');
// graph.addEdge('A', 'C');
// graph.addEdge('B', 'D');
// graph.addEdge('C', 'D');

// Adding edges between vertices
graph.addEdge('A', ['B', 'C']);
graph.addEdge('B', ['A', 'D']);
graph.addEdge('C', ['A', 'D']);
graph.addEdge('D', ['B', 'C']);

graph.printGraph();
