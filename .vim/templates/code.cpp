#include <bits/stdc++.h>
using namespace std;

const int N = 1e6;
bool isPrime[N + 1];

#define int long long
#define endl "\n"
#define deb (x)        cout << #x << ": " << x << endl;
#define tdeb(x, y)     cout << #x << ": " << x << #y << ": " << y << endl;
#define rep (i, n)     for (int i(0); i <  n; i++)
#define rip (i, n)     for (int i(1); i <= n; i++)
#define rap (i, a, n)  for (int i(a); i <  n; i++)

int  Power   (int x, int n);
void sieve   (int N);
void readVect( vector<int> v);
void readArr ( int a[],       int n  )  { rep(i,n) cin >>  a[i]; }
void printArr( int a[],        int n )  { rep(i,n) cout<<  a[i]<<' '; cout<<endl; }
void readArr ( vector<int> a, int n  )  { rep(i,n) cin >>  a[i]; }
void printArr( vector<int> a,  int n )  { rep(i,n) cout<<  a[i]<<' '; cout<<endl; }

void solve()
{
    int T;
    cin >> T;
    while (T--)
    {
    }
}

signed main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    solve();
}

void readVect(vector<int> v) 
{
    int x; cin>>x;
    v.push_back(x);
}

int Power(int x, int n, int M)
{
    if (n == 0)
        return 1;
    else if (n % 2 == 0) //n is even
        return Power((x * x) % M, n / 2, M);
    else //n is odd
        return (x * Power((x * x) % M, (n - 1) / 2, M)) % M;
}

void sieve()
{
    for (int i = 0; i <= N; ++i)
        isPrime[i] = true;

    isPrime[0] = false;
    isPrime[1] = false;

    for (int i = 2; i * i <= N; ++i)
        if (isPrime[i] == true)
            for (int j = i * i; j <= N; j += i)
                isPrime[j] = false;
}

void modularAirthematic()
{
    /*
     * (a+b)%c == (a%c + b%c)%c
     * (a*b)%c == ((a%c) * (b%c))%c
     * (a-b)%c == ((a%c) - (b%c) + c)%c
     * (a/b)%c == ((a%c) * (b^-1 %c))%c
     */
}
