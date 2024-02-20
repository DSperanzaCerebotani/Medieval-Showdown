class Timer 
{
  int elapsed;
  int delay;
  
  Timer(int delay) 
  {
    elapsed = 0;
    this.delay = delay;
  }

  void reset() 
  {
    elapsed = 0;
  }
  
  void setDelay(int delay)
  {
    this.delay = delay;
  }

  void update() 
  {
    if (elapsed < delay) 
    {
      elapsed++;
    }
  }

  boolean tick() 
  {
    if (elapsed >= delay) 
    {
      elapsed = 0;
      return true;
    }
    return false;
  }
}
