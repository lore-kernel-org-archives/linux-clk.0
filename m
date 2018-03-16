Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
Message-ID: <152121759057.209902.1121973322672096604@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 0/8] clk: renesas: Always use readl()/writel()
Date: Fri, 16 Mar 2018 09:26:30 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-03-16 06:40:14)
>         Hi Mike, Stephen,
> =

> On arm32/arm64, there is no reason to use the (soon deprecated)
> clk_readl()/clk_writel(), and the generic readl()/writel() should be
> used in instead.
> =

> Commit 30ad3cf00e94f4a7 ("clk: renesas: rcar-gen3-cpg: Always use
> readl()/writel()") already got rid of them in the R-Car Gen3 clock
> driver, but Stephen noticed that a few new users crept in recently.
> =

> Hence this series fixes that, and replaces all other uses in the Renesas
> clock drivers as a bonus.
> =

> I plan to queue these up in clk-renesas-for-v4.17.
> =


Ok. I'll wait for the PR. Thanks!
