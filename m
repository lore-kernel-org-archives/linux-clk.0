Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
References: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
Date: Thu, 7 Apr 2016 17:28:01 +0200
Message-ID: <CAMuHMdU7-nA1PuyYpG=800=uj_YFoJ_o180BXNRdAWgWvx2HCg@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: renesas: PM Domain Cleanups and Preparation
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 9, 2016 at 8:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series performs some cleanups related to PM Domains on the
> Renesas clock drivers, and prepares the CPG/MSSR driver for the advent
> of R-Car SYSC PM Domains.
>
> Support for the latter will be introduced in 3 patch series:
>   - "[PATCH v3 0/7] PM / Domains: Add DT bindings for the R-Car System
>     Controller",
>   - "[PATCH v3 00/11] soc: renesas: Add R-Car SYSC PM Domain Support",
>   - "[PATCH v3 0/6] ARM/arm64: dts: rcar: Add SYSC PM domains".
>
> This patch series is against clk/clk-next with "[PATCH v2] clk: renesas:
> Rename header file renesas.h" applied.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   clk: renesas: mstp: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
>   clk: renesas: cpg-mssr: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
>   clk: renesas: mstp: Clarify cpg_mstp_{at,de}tach_dev() domain
>     parameter

I've queue up these three patches in clk-renesas-for-v4.7.

>   clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev()

I've dropped this one, as it's no longer needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
