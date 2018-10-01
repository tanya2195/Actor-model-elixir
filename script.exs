[a,b] = System.argv
{n,_} = Integer.parse(a)
{k,_} = Integer.parse(b)

Main.setup()
Main.driver(n,k)