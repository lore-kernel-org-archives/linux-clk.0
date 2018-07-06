Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180704130103.31790-1-geert+renesas@glider.be> <153088993646.143105.11674939438681531758@swboyd.mtv.corp.google.com>
In-Reply-To: <153088993646.143105.11674939438681531758@swboyd.mtv.corp.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jul 2018 17:18:09 +0200
Message-ID: <CAMuHMdWKsC74T5EZ-iPaWK6d+ZZQLXp4dzbXb3PFA1+hprcbKg@mail.gmail.com>
Subject: Re: [PATCH] clk: Really show symbolic clock flags in debugfs
To: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Fri, Jul 6, 2018 at 5:12 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2018-07-04 06:01:03)
> > The last-minute fold-in of the ENTRY() macro did change behavior:
> > instead of printing the symbolic name (e.g. "CLK_IS_BASIC"), it prints
> > the expansion of it (e.g. "(1UL << (5))").
> >
> > Use "#" instead of  __stringify() to fix this.
>
> Do we need the stringify.h include anymore then?

No we don't. I had planned to remove it, but forgot in the end :-(

Thanks, v2 sent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
