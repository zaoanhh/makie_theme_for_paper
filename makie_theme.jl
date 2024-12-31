using CairoMakie
# my_colors = ["#1C3C63", "#A13E38", "#8A8A88","#176A7A",
#          "#357EBDFF", "#9632B8FF", "#B8B8B8FF", "#002FA7FF"]
my_colors = ["#034ea1ff", "#ffaa00ff", "#00aa44ff","#8A8A88ff",
         "#804000ff", "#e67024", "#e4e4e4ff", "#002FA7FF"]
function myfig(;length_div_width=4/2,linewidth=28,fig_width_div_linewidth=0.5,scale=2.0)
    cm_to_pt = 28.3464566929134
    fig_length = floor(Int,linewidth * fig_width_div_linewidth * cm_to_pt * scale)
    fig_width = floor(Int,fig_length / length_div_width)
    return Figure(size =(fig_length,fig_width),pt_per_unit = 1)
end
function new_cycle_theme(;fontsize=8,scale=2.0)
    # https://nanx.me/ggsci/reference/pal_locuszoom.html
    cycle = Cycle([:color, :linestyle, :marker], covary=true) # alltogether
    my_markers = [:circle, :rect, :utriangle, :dtriangle, :diamond,
        :pentagon, :cross, :xcross]
    my_linestyle = [nothing, :dash, :dot, :dashdot, :dashdotdot]
    
    
    return Theme(
        fontsize = fontsize * scale,
        labelsize = (fontsize-1) * scale,
        linewidth = 1 * scale ,
        # spinewidth = (2 * scale > 3 ? 3 : 1.5 * scale),
        markersize = 4 * scale,
        # font="Sarasa Mono SC Nerd",
        colormap = :linear_bmy_10_95_c78_n256,
        palette = (
            color = my_colors,
            marker = my_markers,
            linestyle = my_linestyle,
        ),
        Axis = (
            backgroundcolor= (:white, 0.2),
            xgridstyle = :dash,
            ygridstyle = :dash,
            spinewidth = (1 * scale > 1.5 ? 1.5 : 1 * scale)
        ),
        Lines = (
            cycle= cycle,
        ),
        ScatterLines = (
            cycle = cycle,
        ),
        Scatter = (
            cycle = cycle,
        ),
        Legend = (
            backgroundcolor = (:grey, 0.05),
            framecolor = (:white, 0.2),
        )
    )
end;
set_theme!(merge(new_cycle_theme(),theme_latexfonts()))
CairoMakie.activate!(type="svg")
