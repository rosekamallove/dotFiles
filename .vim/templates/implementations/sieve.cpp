void sieve()
{
  for(int i = 2; i < 10000001; ++i)
  {
    if(isprime[i] == 0)
    {
      for(int j = 2; i*j < 10000001; ++j)
      {
        isprime[i*j] = 1;
      }
    }
  }
}
