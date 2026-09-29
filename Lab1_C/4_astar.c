/*
 * Lab 1, Q4: Write a computer program to implement A* Search.
 */
// A* Search: expand node with lowest f(n) = g(n) + h(n)
#include <stdio.h>
#define N 6
#define INF 9999
char name[N] = {'S','A','B','C','D','G'};
int h[N] = {7, 6, 4, 3, 1, 0};            // admissible heuristic to G
int cost[N][N];

void addEdge(int u, int v, int w) { cost[u][v] = w; }

void astar(int start, int goal) {
    int g[N], parent[N], open[N] = {0}, closed[N] = {0};
    for (int i = 0; i < N; i++) { g[i] = INF; parent[i] = -1; }
    g[start] = 0; open[start] = 1;
    printf("Order of expansion:\n");
    while (1) {
        int u = -1;
        for (int i = 0; i < N; i++)               // pick open node with min f
            if (open[i] && (u == -1 || g[i] + h[i] < g[u] + h[u])) u = i;
        if (u == -1) { printf("Goal not reachable\n"); return; }
        printf("  %c  g=%-2d h=%-2d f=%d\n", name[u], g[u], h[u], g[u] + h[u]);
        if (u == goal) break;
        open[u] = 0; closed[u] = 1;
        for (int v = 0; v < N; v++)
            if (cost[u][v] && !closed[v] && g[u] + cost[u][v] < g[v]) {
                g[v] = g[u] + cost[u][v]; parent[v] = u; open[v] = 1;
            }
    }
    int path[N], len = 0;
    for (int v = goal; v != -1; v = parent[v]) path[len++] = v;
    printf("Optimal path: ");
    for (int i = len - 1; i >= 0; i--) printf("%c%s", name[path[i]], i ? " -> " : "");
    printf("\nTotal cost: %d\n", g[goal]);
}

int main() {
    addEdge(0,1,1); addEdge(0,2,4); addEdge(1,2,2); addEdge(1,3,5);
    addEdge(1,4,12); addEdge(2,3,2); addEdge(3,4,3); addEdge(3,5,5); addEdge(4,5,1);
    printf("Edges (cost): S-A(1) S-B(4) A-B(2) A-C(5) A-D(12) B-C(2) C-D(3) C-G(5) D-G(1)\n");
    printf("Heuristic: S=7 A=6 B=4 C=3 D=1 G=0\n");
    astar(0, 5);
    return 0;
}
