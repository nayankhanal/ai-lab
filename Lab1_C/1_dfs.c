/*
 * Lab 1, Q1: Write a computer program to implement Depth First Search.
 */
// Depth First Search (recursive) on an undirected graph
#include <stdio.h>
#define N 7
char name[N] = {'A','B','C','D','E','F','G'};
int adj[N][N] = {0}, visited[N] = {0};

void addEdge(int u, int v) { adj[u][v] = adj[v][u] = 1; }

void dfs(int u) {
    visited[u] = 1;
    printf("%c ", name[u]);
    for (int v = 0; v < N; v++)
        if (adj[u][v] && !visited[v]) dfs(v);
}

int main() {
    addEdge(0,1); addEdge(0,2); addEdge(1,3);
    addEdge(1,4); addEdge(2,5); addEdge(2,6);
    printf("Graph edges: A-B, A-C, B-D, B-E, C-F, C-G\n");
    printf("DFS traversal starting from A: ");
    dfs(0);
    printf("\n");
    return 0;
}
