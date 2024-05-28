
/* print a number in any radish */
#define DIGARR "0123456789ABCDEF"
strprintn(number, radix, str)
int number, radix; char *str;{
        int i;
        char *digitreps;
        if (number < 0 & radix == 10){
                *str++ = '-';
                number = -number;
                }
        if ((i = number / radix) != 0)
                strprintn(i, radix, str);
        digitreps=DIGARR;
        *str++ = digitreps[number % radix];
        }
