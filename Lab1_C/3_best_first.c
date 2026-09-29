/*
 * Lab 1, Q3: Write a computer program to implement Best-First Search.
 */
// Greedy Best-First Search: always expand the node with the lowest heuristic h(n)
#include <stdio.h>
#define N 6
char name[N] = {'S','A','B','C','D','G'};
int h[N] = {10, 8, 5, 7, 3, 0};           // heuristic: estimated distance to G
int adj[N][N] = {0};

void addEdge(int u, int v) { adj[u][v] = adj[v][u] = 1; }

void bestFirst(int start, int goal) {
    int open[N] = {0}, closed[N] = {0}, parent[N];
    for (int i = 0; i < N; i++) parent[i] = -1;
    open[start] = 1;
    printf("Order of expansion: ");
    while (1) {
        int u = -1;
        for (int i = 0; i < N; i++)               // pick open node with min h
            if (open[i] && (u == -1 || h[i] < h[u])) u = i;
        if (u == -1) { printf("\nGoal not reachable\n"); return; }
        open[u] = 0; closed[u] = 1;
        printf("%c(h=%d) ", name[u], h[u]);
        if (u == goal) break;
        for (int v = 0; v < N; v++)
            if (adj[u][v] && !open[v] && !closed[v]) { open[v] = 1; parent[v] = u; }
    }
    int path[N], len = 0;
    for (int v = goal; v != -1; v = parent[v]) path[len++] = v;
    printf("\nPath found: ");
    for (int i = len - 1; i >= 0; i--) printf("%c%s", name[path[i]], i ? " -> " : "\n");
}

int main() {
    addEdge(0,1); addEdge(0,2); addEdge(1,3);
    addEdge(2,4); addEdge(3,5); addEdge(4,5); addEdge(1,2);
    printf("Heuristic values: S=10 A=8 B=5 C=7 D=3 G=0\n");
    printf("Edges: S-A, S-B, A-B, A-C, B-D, C-G, D-G\n");
    bestFirst(0, 5);
    return 0;
}
