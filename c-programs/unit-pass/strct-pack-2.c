#include <stdlib.h>
typedef struct
{
  short a __attribute__ ((aligned (2),packed));
  short *ap[2]  __attribute__ ((aligned (2),packed));
} A;

int main ()
{
  short i, j = 1;
  A a, *ap = &a;
  ap->ap[j] = &i;
  exit (0);
}
