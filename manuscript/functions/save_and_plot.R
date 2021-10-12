
save_and_plot_eps = function(x, bname, width, height,
    use_cowplot = FALSE, ncol = 1, nrow = 1,
    base_height = 4, base_width = NULL, base_aspect_ratio = 1,
    plot = FALSE) {
    if (!use_cowplot) {
        cairo_ps(filename = file.path(paste0(bname, "_cairo_ps.eps")),
            onefile = TRUE, height = height, width = width,
            family = "Helvetica", pointsize = 8, antialias = "none")
        print(x)
        while (length(dev.list()) > 0) invisible(dev.off())
        postscript(file = file.path(paste0(bname, "_postscript.eps")),
            onefile = TRUE, paper = "special", height = height, width = width,
            family = "Helvetica", pointsize = 8, horizontal = FALSE)
        print(x)
        while (length(dev.list()) > 0) invisible(dev.off())
    } else {
        cowplot::save_plot(x,
            filename = file.path(paste0(bname, "_cairo_ps.eps")),
            ncol = ncol, nrow = nrow, base_height = base_height,
            base_width = base_width, base_aspect_ratio = base_aspect_ratio,
            device = cairo_ps)
        cowplot::save_plot(x,
            filename = file.path(paste0(bname, "_postscript.eps")),
            ncol = ncol, nrow = nrow, base_height = base_height,
            base_width = base_width, base_aspect_ratio = base_aspect_ratio,
            device = "ps")
        while (length(dev.list()) > 0) invisible(dev.off())
    }
    if (plot) print(x)
}

save_and_plot_pdf = function(x, bname, width, height,
    use_cowplot = FALSE, ncol = 1, nrow = 1,
    base_height = 4, base_width = NULL, base_aspect_ratio = 1,
    plot = FALSE) {
    if (!use_cowplot) {
        cairo_pdf(filename = file.path(paste0(bname, "_cairo_pdf.pdf")),
            onefile = TRUE, height = height, width = width,
            family = "Helvetica", pointsize = 8, antialias = "none")
        print(x)
        while (length(dev.list()) > 0) invisible(dev.off())
    }else{
        cowplot::save_plot(x,
            filename = file.path(paste0(bname, "_cairo_pdf.pdf")),
            ncol = ncol, nrow = nrow, base_height = base_height,
            base_width = base_width, base_aspect_ratio = base_aspect_ratio,
            device = cairo_pdf)
        while (length(dev.list()) > 0) invisible(dev.off())
    }
    if (plot) print(x)
}

save_and_plot_png = function(x, bname, width, height,
    dpi = 300, use_cowplot = FALSE, ncol = 1, nrow = 1,
    base_height = 4, base_width = NULL, base_aspect_ratio = 1,
    plot = FALSE) {
    if (!use_cowplot) {
        png(filename = file.path(paste0(bname, ".png")),
            units = "in", height = height, width = width, res = dpi)
        print(x)
        while (length(dev.list()) > 0) invisible(dev.off())
    }else{
        cowplot::save_plot(x, filename = file.path(paste0(bname, ".png")),
            ncol = ncol, nrow = nrow, base_height = base_height,
            base_width = base_width, base_aspect_ratio = base_aspect_ratio,
            dpi = dpi)
        while (length(dev.list()) > 0) invisible(dev.off())
    }
    if (plot) print(x)
}

save_and_plot_jpg = function(x, bname, width, height,
    dpi = 300, use_cowplot = FALSE, ncol = 1, nrow = 1,
    base_height = 4, base_width = NULL, base_aspect_ratio = 1,
    plot = FALSE) {
    if (!use_cowplot) {
        jpeg(filename = file.path(paste0(bname, ".jpg")),
            units = "in", height = height, width = width, res = dpi)
        print(x)
        while (length(dev.list()) > 0) invisible(dev.off())
    }else{
        cowplot::save_plot(x, filename = file.path(paste0(bname, ".jpg")),
            ncol = ncol, nrow = nrow, base_height = base_height,
            base_width = base_width, base_aspect_ratio = base_aspect_ratio,
            dpi = dpi)
        while (length(dev.list()) > 0) invisible(dev.off())
    }
    if (plot) print(x)
}

save_and_plot = function(x, bname, width, height,
    dpi = 300, use_cowplot = FALSE, ncol = 1, nrow = 1,
    base_height = 4, base_width = NULL, base_aspect_ratio = 1,
    plot = FALSE, formats = c("png", "pdf")) {
    if ("jpg" %in% formats) {
        save_and_plot_jpg(x, bname, width, height, dpi, use_cowplot, ncol, nrow,
            base_height, base_width, base_aspect_ratio, plot)
    }
    if ("png" %in% formats) {
        save_and_plot_png(x, bname, width, height, dpi, use_cowplot, ncol, nrow,
            base_height, base_width, base_aspect_ratio, plot)
    }
    if ("eps" %in% formats) {
        save_and_plot_eps(x, bname, width, height, use_cowplot, ncol, nrow,
            base_height, base_width, base_aspect_ratio, plot)
    }
    if ("pdf" %in% formats) {
        save_and_plot_pdf(x, bname, width, height, use_cowplot, ncol, nrow,
            base_height, base_width, base_aspect_ratio, plot)
    }
}
