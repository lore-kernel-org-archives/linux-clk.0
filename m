Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170213184405.5657-1-chris.brandt@renesas.com>
References: <20170213184405.5657-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2017 09:38:07 +0100
Message-ID: <CAMuHMdUm6-FQSuQYt_h2M21QZLz4UbMxPss8mv2ACWCa6rwfCA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: mstp: ensure register writes complete
To: Chris Brandt <chris.brandt@renesas.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Mon, Feb 13, 2017 at 7:44 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> When there is no status bit, it is possible for the clock enable/disable
> operation to have not completed by the time the driver code resumes
> execution. This is due to the fact that write operations are sometimes
> queued and delayed internally. Doing a read ensures the write operations
> has completed.
>
> Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I've regression-tested your patch on R-Car Gen1 (r8a7778/bock-w), which
also doesn't have status bits for some module clocks, and its SPI FLASH
is still identified.

Mike/Stephen: As this is a fix, can you please take it directly?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
