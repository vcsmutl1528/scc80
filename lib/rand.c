
int xxseed;

srand (x) int x; {
        xxseed = x;

}

rand () {
        xxseed = xxseed * 251 + 123;
        if (xxseed < 0) xxseed = - xxseed;
        return (xxseed);

}
