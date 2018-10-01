defmodule Squarecheck do
  
  use GenServer
  #Client
  def start_link(_opts) do
    IO.puts("Starting the server....")
    GenServer.start_link(__MODULE__, _opts, name: __MODULE__)        
  end
  

  def calc(pid, num , k) do       
    GenServer.cast(pid, {:calc, num , k})    
  end
  
  def calc2(pid, num , k) do       
    GenServer.call(pid, {:calc2, num , k}, 100000)    
  end

  # Server (callbacks)
  def init(args) do
    {:ok, args}
  end

  def handle_cast({:calc, num,k},state) do
    
    diff = (((num+k-1)*(num+k)*(2*(num+k-1)+1))/6) -(((num-1)*(num)*(2*(num-1)+1))/6)
    sqrt = :math.sqrt(diff)    
    sqrt1 = Float.ceil(sqrt)
    temp = sqrt - sqrt1
    
    if (temp == 0) do
      IO.puts(num)            
    end 
    {:noreply, state}
  end 
  
  def handle_call({:calc2, num,k},_,state) do
    
    diff = (((num+k-1)*(num+k)*(2*(num+k-1)+1))/6) -(((num-1)*(num)*(2*(num-1)+1))/6)
    sqrt = :math.sqrt(diff)    
    sqrt1 = Float.ceil(sqrt)
    temp = sqrt - sqrt1
    
    if (temp == 0) do
      IO.puts(num)            
    end 
    {:reply,num, state}
  end


end


