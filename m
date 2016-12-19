Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161215170027.28411-1-chris.brandt@renesas.com>
References: <20161215170027.28411-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Dec 2016 11:47:07 +0100
Message-ID: <CAMuHMdXxiH5ryerpCnDirOXf=b-Gw5R8gJrj4Kk8NmM_3FYBqw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: mstp: Support 8-bit registers for r7s72100
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris, Mike, Stephen,

On Thu, Dec 15, 2016 at 6:00 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A1 is different than the other Renesas SOCs because the MSTP
> registers are 8-bit instead of 32-bit and if you try writing values as
> 32-bit nothing happens...meaning this driver never worked for r7s72100.

Thanks for your patch!

The only reason it ever worked was that almost all module clocks are
enabled at boot time...

> Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Mike/Stephen: as this is a fix for stable (v3.16+), can you please take it
directly?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
