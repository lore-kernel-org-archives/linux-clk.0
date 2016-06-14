Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1465212804-21391-1-git-send-email-geert+renesas@glider.be>
References: <1465212804-21391-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jun 2016 14:23:59 +0200
Message-ID: <CAMuHMdWwsmXYE8h3LDT5XyftMiqAnXc+GEAWKfMAUGW8_N+5NQ@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Add support for R-Car M3-W
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>,
	linux-renesas-soc@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 6, 2016 at 1:33 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
>
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.8-tag1
>
> for you to fetch changes up to e4e2d7c388350eba8b1dbc2569441ac9b545a8c4:
>
>   clk: renesas: cpg-mssr: Add support for R-Car M3-W (2016-06-06 11:58:35 +0200)
>
> ----------------------------------------------------------------
> clk: renesas: Add support for R-Car M3-W
>
> Add initial support for the Clock Pulse Generator and Module Standby and
> Software Reset modules on the Renesas R-Car M3-W SoC:
>   - Basic core clocks,
>   - SCIF2 (console) module clock,
>   - INTC-AP (GIC) module clock.
>
> As <dt-bindings/clock/r8a7796-cpg-mssr.h> is a hard dependency for the
> initial r8a7796.dtsi file, I would appreciate if you could pull this
> sooner rather than later, so Simon can pull it as well, and start
> queueing up the DT files for R-Car M3-W.
>
> Thanks for pulling!

Ping?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
