defmodule Supercalc do
    use DynamicSupervisor
    def start_link(arg) do
        IO.puts("Starting the Supervisor.......")
        DynamicSupervisor.start_link(__MODULE__, arg, name: __MODULE__)
    end
    
      
    @impl true
    def init(initial_arg) do
        DynamicSupervisor.init(
          strategy: :one_for_one,
          extra_arguments: [initial_arg]
        )
    end
end

