## Definition od different type of networks

# Network is a weighted directed graph and use the Arc type
type Network
  source::Int
  target::Int # Also called sink
  tails::Vector{Int} # Used to store the start of the arcs incident to each node
  links::Vector{Arc}
end

function findArc(g::Network,t::Int,h::Int)
  for (id,e) in enumerate(g.links[g.tails[t]:(g.tails[t+1]-1)])
    if e.head == h
      return g.tails[t] + id - 1
    end
  end
  return 0
end

function minmaxCapacity(g::Network)
  cmin, cmax = typemax(Float64), 0.
  for a in g.links
    if a.cap != 0.
      cmin = min(cmin,a.cap)
    end
    cmax = max(cmax,a.cap)
  end
  return cmin, cmax
end
