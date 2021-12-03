using System;
using System.Collections;
class Program
{
	void Main(string[] args)
	{
        part2();
	}
    
    public void part1()
    {
		string file = "input.txt";
		StreamReader sr = new StreamReader(file);
		int increase = 0;
		int decrease = 0;
		int last = Int32.Parse(sr.ReadLine());

        while (!sr.EndOfStream)
        {
			int current = Int32.Parse(sr.ReadLine());
			if (last > current)//decrease
			{
				decrease++;
			} else { increase++; }
			last = current;
        }
        System.Diagnostics.Debug.WriteLine("Part 1");
		System.Diagnostics.Debug.WriteLine("Increases are " + increase);
		System.Diagnostics.Debug.WriteLine("Decreases are at " + decrease);
    }
    public void part2()
    {
        string file = "input.txt";
		StreamReader sr = new StreamReader(file);
        List<int> winList = new List<int>();
		int increase = 0;
		int decrease = 0;
        
        winList.Add(Int32.Parse(sr.ReadLine()));
        winList.Add(Int32.Parse(sr.ReadLine()));
        winList.Add(Int32.Parse(sr.ReadLine()));


		int last = winList[0]+winList[1]+winList[2];
        
        do
        {
            winList.RemoveAt(0);
            winList.Add(Int32.Parse(sr.ReadLine()));
            int current = winList[0]+winList[1]+winList[2];
			//int current = Int32.Parse(sr.ReadLine());
			if (last > current)//decrease
			{
				decrease++;
			} else { increase++; }
			last = current;
        }while (sr.Peek != null);
		System.Diagnostics.Debug.WriteLine("Part 2");
		System.Diagnostics.Debug.WriteLine("Increases are " + increase);
		System.Diagnostics.Debug.WriteLine("Decreases are at " + decrease);

    }
}
