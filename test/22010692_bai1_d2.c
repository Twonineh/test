#include <stdio.h>
#define max_size 100

void push(int stack[], int *top, int value) {
    if (*top < max_size - 1) {
        (*top)++;
        stack[*top] = value;
    }
}

void pop(int *top) {
    if (*top >= 0) {
        (*top)--;
    }
}

void printStack(int stack[], int top) {
    for (int i = 0; i <= top; i++) {
        printf("%d ", stack[i]);
    }
    printf("\n");
}

int main() {
    int n;
    scanf("%d", &n);

    int stack[max_size];
    int top = -1; 

    for (int i = 0; i < n; i++) {
        int command, value;
        scanf("%d", &command);

        if (command == 1) {
            pop(&top);
        } else if (command == 2) {
            scanf("%d", &value);
            push(stack, &top, value);
        }
    }

    printStack(stack, top);

    return 0;
}
