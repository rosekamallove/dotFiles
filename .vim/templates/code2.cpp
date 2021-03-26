#include <bits/stdc++.h>
using namespace std;
#define int long long
#define endl "\n"
#define deb(x) cout << #x << ": " << x << endl;

vector<int> hsh;
vector<int> pr;

void fileIO();
template <typename... T>
void read(T &...args)
{
	((cin >> args), ...);
}
template <typename... T>
void write(T &...args)
{
	((cout << args << " "), ...);
}

void solve()
{
	int a, b, c, d(100);
	read(a, b, c);
	write(a, b, c, d);
}

void solveT()
{
	int t;
	cin >> t;
	while (t--)
	{
	}
}
int32_t main()
{
	ios::sync_with_stdio(0);
	cin.tie(0);
	solve();
	// solveT();
}

void fileIO()
{
#ifndef ONLINE_JUDGE
	//for getting input from input.txt
	freopen("input.txt", "r", stdin);
	//for writing output to output.txt
	freopen("output.txt", "w", stdout);
#endif
}
