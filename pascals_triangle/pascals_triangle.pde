import java.math.BigInteger;


void setup() {
  size(800,800);
}
int n=0;

void draw() {
    for (int k = 0; k <= n; k++) {
        BigInteger nCk = binomial(n,k);
        if (shade(nCk)) {
          stroke(0);
        } else {
          stroke(255);
        }
        point((width/2-n/2)+k,n);
        //point(k,n-k);
    }
    n++;
    if (n>height) noLoop();
}

boolean shade(BigInteger x) {
  //return !x.mod(new BigInteger("8")).equals(BigInteger.ZERO); // even
  //return x.isProbablePrime(100000); // prime
  return !x.subtract(new BigInteger("4")).mod(new BigInteger("8")).equals(BigInteger.ZERO); // ends in
  //return 
}

// per http://stackoverflow.com/a/2929897/2635662
static BigInteger binomial(final int N, final int K) {
    BigInteger ret = BigInteger.ONE;
    for (int k = 0; k < K; k++) {
        ret = ret.multiply(BigInteger.valueOf(N-k))
                 .divide(BigInteger.valueOf(k+1));
    }
    return ret;
}
