Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1519985872-3809-1-git-send-email-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <1519985872-3809-1-git-send-email-geert+renesas@glider.be>
Message-ID: <152106382662.179530.17640698731932597086@swboyd.mtv.corp.google.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.17
Date: Wed, 14 Mar 2018 14:43:46 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-03-02 02:17:52)
>         Hi Mike, Stephen,
> =

> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1=
b2:
> =

>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
> =

> are available in the git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v4.17-tag1
> =

> for you to fetch changes up to 7ce36da900c0a2ff4777d9ba51c4f1cb74205463:
> =

>   clk: renesas: cpg-mssr: Add support for R-Car M3-N (2018-02-26 09:13:29=
 +0100)
> =

> ----------------------------------------------------------------
> clk: renesas: Updates for v4.17
> =

>   - Update legacy DT Kconfig default,
>   - Add support for CPU (Z/Z2) clocks on R-Car H3 and M3-W,
>   - Add support for the watchdog module clocks on R-Car Gen2 and RZ/G1,
>   - Add support for the new R-Car M3-N and V3H SoCs.
> =

> Thanks for pulling!
> =


Thanks. Pulled into clk-next.

Did you need to use clk_readl() or was it just copy-paste? I hope we can
get rid of that function at some point.
