# makie_theme_for_paper         

这是一个目前在用的[Makie](https://docs.makie.org/)绘图主题。颜色和mark在循环，可以支持latex字符渲染。默认字号是8号、纵横比是2:1。在使用时，仅需要将`makie_theme.jl`的两个函数粘贴到文档中并执行`set_theme!(merge(new_cycle_theme(),theme_latexfonts()))`就可以了。



关于字号的问题，额外做一些说明。
在进行论文数据图绘制时，经常会遇到字体大小不合适的问题，由于尺寸、缩放的原因导致图、文字体大小失调。一种处理办法使用仅导出图片但是保留文字不渲染、等到latex文档编译时由latex统一渲染文字的模式，如[这篇博客中](https://castel.dev/post/lecture-notes-2/)展示的这种方式。

但大多数数据绘制程序（例如Julia的Makie包，python的matplotlib等）不支持这样的导出模式。因此，有两种办法可以处理：

- 直接绘制tikz图片或者用类似的包将绘图转为tikz，如matlab的[matlab2tikz](https://github.com/matlab2tikz/matlab2tikz)、python的tikzplotlib、  Julia的[PGFPlots](https://github.com/JuliaTeX/PGFPlots.jl)。

- 设置图片的Figure的size,然后等比设置字体。例如《中国科学信息科学》的投稿模板将\textwidth设置为16cm，如果想画一个宽度为半页、字体为8pt的图、纵横比为2：1的图，可以设置Figsize为（2,1）* 16cm * 0.5 * 28.3465 pt，然后将字号设置为8pt即可（如果是julia的[Makie](https://docs.makie.org/)）。这里的换算是1cm=28.3465 pt，1 in = 72pt。    
