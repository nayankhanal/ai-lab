/*
 * Lab 1, Q2: Write a computer program to implement Breadth First Search.
 */
// Breadth First Search using a queue on an undirected graph
#include <stdio.h>
#define N 7
char name[N] = {'A','B','C','D','E','F','G'};
int adj[N][N] = {0};

void addEdge(int u, int v) { adj[u][v] = adj[v][u] = 1; }

void bfs(int start) {
    int queue[N], front = 0, rear = 0, visited[N] = {0};
    queue[rear++] = start;
    visited[start] = 1;
    while (front < rear) {
        int u = queue[front++];
        printf("%c ", name[u]);
        for (int v = 0; v < N; v++)
            if (adj[u][v] && !visited[v]) {
                visited[v] = 1;
                queue[rear++] = v;
            }
    }
}

int main() {
    addEdge(0,1); addEdge(0,2); addEdge(1,3);
    addEdge(1,4); addEdge(2,5); addEdge(2,6);
    printf("Graph edges: A-B, A-C, B-D, B-E, C-F, C-G\n");
    printf("BFS traversal starting from A: ");
    bfs(0);
    printf("\n");
    return 0;
}
