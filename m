Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1457315065-28705-1-git-send-email-horms+renesas@verge.net.au>
References: <1457315065-28705-1-git-send-email-horms+renesas@verge.net.au>
Date: Mon, 7 Mar 2016 14:51:19 +0100
Message-ID: <CAMuHMdX_GhW+NJNjN9r3KgUAnrp-v+5hFq9H0+hdPxRRFTP8kw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Rename header file renesas.h
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Simon,

On Mon, Mar 7, 2016 at 2:44 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> --- /dev/null
> +++ b/include/linux/clk/renesas.h
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright 2013 Ideas On Board SPRL
> + * Copyright 2013, 2014 Horms Solutions Ltd.
> + *
> + * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + * Contact: Simon Horman <horms@verge.net.au>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __LINUX_CLK_SHMOBILE_H_
> +#define __LINUX_CLK_SHMOBILE_H_

Ideally these should be changed to __LINUX_CLK_RENESAS_H_

Sorry for not noticing before.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
