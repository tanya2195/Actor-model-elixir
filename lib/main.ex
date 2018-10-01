defmodule Main do
    def setup() do
        Supercalc.start_link(:ok)
        DynamicSupervisor.start_child(Supercalc,%{id: Squarecheck, start: {Squarecheck, :start_link, []}})
    end
    

    def driver(1,k) do
        Squarecheck.calc2(Squarecheck,1,k)                     
        IO.puts("All actors have been started ") 
    end

    def driver(num,k) do        
        Squarecheck.calc(Squarecheck,num,k)          
        driver( num-1, k)
    end
end

