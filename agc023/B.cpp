#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;



bool is_good(vector<string> box, int n) {
  for(int i = 0; i < n; i++) {
    for(int j = i; j < n; j++) {
      if (box[i][j] != box[j][i]) {
        return false;
      }
    }    
  }
  return true;
}

int main()
{
    // 整数の入力
    int N;
    int res = 0;
    cin >> N;

    vector<string> S;
    string tmp;

    for(int i = 0; i < N; i++) {
      cin >> tmp;
      S.push_back(tmp);
    }

    for(int i = 0; i < N; i++) {
      if(is_good(S, N)) {
        ++res;
      }

      S.push_back(S[0]);
      S.erase(S.begin());
    }
    cout << res * N << "\n";
    return 0;
}