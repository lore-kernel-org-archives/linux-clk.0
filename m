Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160218071403.11935.50948.sendpatchset@little-apple>
References: <20160218071403.11935.50948.sendpatchset@little-apple>
Date: Thu, 18 Feb 2016 09:01:00 +0100
Message-ID: <CAMuHMdUf1JLv-JF3pojhWSyChHAv2sXdxE7Wzf5mvWeNhsou-A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: shmobile: r8a7795: Add INTC-EX clock
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms@verge.net.au>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Magnus,

On Thu, Feb 18, 2016 at 8:14 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add the "intc-ex" clock to the r8a7795 CPG MSSR driver V2.
>
> According to information from the hardware team the INTC_EX
> parent clock is CP. The next data sheet version will include
> this information.

That makes sense, as it matches R-Car Gen2.

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue in clk-shmobile-for-v4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
