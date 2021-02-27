int binarySearch(int a[], int size, int key)
{
  int low = 0;
  int high = size;

  while(low<=high)
  {
    int mid = (low+high)/2;
    int guess = a[mid];

    if(guess==key) return mid;
    else if(guess>key) high = mid-1;
    else low = mid + 1;
  }
  return -1;
}
