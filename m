Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455872150-7632-1-git-send-email-geert+renesas@glider.be>
Cc: "Simon Horman" <horms@verge.net.au>, "Magnus Damm" <magnus.damm@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 "Geert Uytterhoeven" <geert+renesas@glider.be>
References: <1455872150-7632-1-git-send-email-geert+renesas@glider.be>
Message-ID: <20160219201829.2278.41674@quark.deferred.io>
Subject: Re: [git pull] clk: shmobile: Updates for v4.6
Date: Fri, 19 Feb 2016 12:18:29 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2016-02-19 00:55:50)
>         Hi Mike, Stephen,
> =

> The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f0=
8d:
> =

>   Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)
> =

> are available in the git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 clk-shmobile-for-v4.6

Pulled.

Regards,
Mike

> =

> for you to fetch changes up to f099aa075749c6fadb79554ce175fbdc31c45d7a:
> =

>   clk: shmobile: r8a7795: Add INTC-EX clock (2016-02-18 09:01:46 +0100)
> =

> Summary:
>   - Add more module clocks for R-Car H3,
>   - Update example in DT bindings.
> =

> Thanks for pulling!
> =

> ----------------------------------------------------------------
> Dirk Behme (1):
>       clk: shmobile: r8a7795: Add SD divider support
> =

> Geert Uytterhoeven (1):
>       clk: shmobile: cpg-mssr: Update serial port clock in example
> =

> Magnus Damm (1):
>       clk: shmobile: r8a7795: Add INTC-EX clock
> =

> Yoshihiro Shimoda (2):
>       clk: shmobile: r8a7795: Add USB3.0 clocks
>       clk: shmobile: r8a7795: Add USB-DMAC clocks
> =

>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   2 +-
>  drivers/clk/shmobile/r8a7795-cpg-mssr.c            | 235 +++++++++++++++=
++++++
>  drivers/clk/shmobile/renesas-cpg-mssr.h            |   2 +
>  3 files changed, 238 insertions(+), 1 deletion(-)
> =

> Gr{oetje,eeting}s,
> =

>                                                 Geert
> =

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
> =

> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds
