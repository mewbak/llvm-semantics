#include <stdio.h>
struct foo {
	int a;
	char b;
	unsigned int x : 12, y : 4, : 0, : 4, z : 3;
	char c;
} x = { 1, 2, 3, 4, 5, 6 };
int i = 16;
struct baz { unsigned int a:2, b:4, c:32;} y = { 7, 8, 9};

int main()
{
	printf("x = %d %d %d %d %d %d\n", x.a, x.b, x.x, x.y, x.z, x.c);
	printf("y = %d %d %d\n", y.a, y.b, y.c);
	x.y = i;
	x.z = 070;
	printf("x = %d %d %d %d %d %d\n", x.a, x.b, x.x, x.y, x.z, x.c);
	y.a = 2;
	y.c = i;
	printf("y = %d %d %d\n", y.a, y.b, y.c);
	f2(&x);
	return 0;
}

void f1(struct baz *p) {
	p->a = 0;
	p->b = 0;
	if (p->b)
		printf("p->b != 0!\n");
	p->a = 0x3; p->b = 0xf;
	printf("p->a = 0x%x, p->b = 0x%x\n", p->a, p->b);
}
void f2(struct baz *p) {
	p->a = (i==0);
	p->b = (f1(p),0);
}