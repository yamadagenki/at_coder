#include <algorithm>
#include <cassert>
#include <cfloat>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <deque>
#include <iostream>
#include <limits>
#include <map>
#include <queue>
#include <set>
#include <stack>
#include <string>
#include <tuple>
#include <unordered_map>
#include <unordered_set>
#include <vector>
using namespace std;

#define FOR(i, k, n) for (int(i) = (k); (i) < (n); ++(i))
#define rep(i, n) FOR(i, 0, n)
#define all(v) begin(v), end(v)
#define debug(x) cerr << #x << ": " << x << endl
#define debug2(x, y) cerr << #x << ": " << x << ", " << #y << ": " << y << endl

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;
typedef vector<vector<int>> vvi;
typedef vector<ll> vll;
typedef vector<vector<ll>> vvll;
typedef deque<bool> db;
template <class T>
using vv = vector<vector<T>>;

int main()
{
  int X;
  cin >> X;

  if (X == 1)
  {
    cout << 1 << endl;
    return 0;
  }

  int limit = int(floor(sqrt(X)));
  int res = 1;

  for (int i = limit; 1 < i; --i)
  {
    int tmp = i * i;
    while (tmp <= X)
    {
      res = max({tmp, res});
      tmp *= i;
    }
  }

  cout << res << endl;
  return 0;
}