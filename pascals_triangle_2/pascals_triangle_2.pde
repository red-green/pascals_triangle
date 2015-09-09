import java.math.BigInteger;

color[] colors = {
  color(0,0,0),
  color(128,0,0),
  color(0,128,0),
  color(0,0,128),
  color(255,0,0),
  color(0,255,0),
  color(0,0,255),
  color(255,255,0),
  color(0,255,255),
  color(255,255,255)
};

void setup() {
  size(800,800);
  frameRate(200);
}

int n=0;

void draw() {
    for (int k = 0; k <= n; k++) {
        BigInteger nCk = binomial(n,k);
        BigInteger rem[] = nCk.divideAndRemainder(BigInteger.valueOf(8));
        int r = rem[1].intValue();
        stroke(colors[r]);
        
        point((width/2-n/2)+k,n);
        //point(k,n-k);
        //point(k,n);
    }
    
    n++;
    if (n>height) noLoop();
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
