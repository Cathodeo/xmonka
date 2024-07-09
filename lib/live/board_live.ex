defmodule XmonkaWeb.BoardLive
do
  use Phoenix.LiveView, layout: {XmonkaWeb.LayoutView, "live.html"}
  def mount(_params, _session, socket) do
    {:ok, assign(socket, dummy)}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
      <div style="display:inline-block; width: 15%; background-color:teal;
      color:white; text-align:center;">

      <h3>B:0 R:6</h3>

      </div>

      <div style="display:inline-block; width: 40%; background-color:white; color:white">

      </div>

      <div style="display:inline-block; width: 30%; background-color:purple; color:white;
      text-align:center;">
      <h3>Goostav <img style="height: 45px; width: 45px"src="/images/element3.jpeg"></h3>
      </div>


      <div style="text-align:left; display:inline-block; width:20%">
      </div>
      <div style="text-align:right; display:inline-block; width:60%"><h4>Equiped item: Corroder <br> Status: OK</h4></div>
      <div style="display:inline-block; width: 35%">
      </div>

      <div style="display:inline-block; width: 25%">
      </div>

      <div style="display:inline-block; width: 30%">
          <img style="border:solid; height: 220px"src="/images/monster7.png"><br>  <h1 style="color:darkblue">○○●●●●</h1>
      </div>

      <div style="display:inline-block; width: 30%">
          <img style="border:solid; height: 220px;"src="/images/monster1.png"><br>  <h1 style="color:darkblue">○○○○○○●●●●</h1>
      </div>
      <div style="display:inline-block; width: 40%">
      </div>

      <div style="display:inline-block; width: 25% ;background-color:brown; color:white;
      text-align:center;">
      <h4>Crimson Bovid  <img style="height: 45px; width: 45px"src="/images/element2.jpeg"></h4>
      </div>


      <div style="display:inline-block; background-color:teal; color:white; width: 25%;
      text-align:center;">
      <h3>B:2 R:5</h3>
      </div>
      <div style="display:inline-block; width: 45%"></div>
      <div style="display:inline-block; width: 25%">
      <h4>Equiped item: Horn Helmet <br> Status: POISON</h4></div>
      <br>
      <div>
      <br>
      <button>Power: 2     Stompede</button>
      <br>
      <button style="background-color:gray;">Power: 3     Horned tackle</button>
      </div>

    """

  end

end
