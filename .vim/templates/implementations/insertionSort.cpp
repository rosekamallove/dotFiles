void insertionSort(int arr[], int size)
{
  for(int i=1; i<size; i++)
  {
    int key = arr[i];

    int j = i-1;//start of the unsorted region
    
    while(j>=0 && arr[j]>key)
    {
      arr[j+1] = arr[j];
      j = j-1;
    }

    arr[j+1] = key;
  }

}

