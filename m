Return-Path: <sboyd@codeaurora.org>
Date: Tue, 28 Jun 2016 16:35:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [git pull] clk: renesas: Updates for v4.8 (take two)
Message-ID: <20160628233504.GH1521@codeaurora.org>
References: <1466690683-28949-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1466690683-28949-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 06/23, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The following changes since commit e4e2d7c388350eba8b1dbc2569441ac9b545a8c4:
> 
>   clk: renesas: cpg-mssr: Add support for R-Car M3-W (2016-06-06 11:58:35 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.8-tag2
> 
> for you to fetch changes up to e4c82863fd17bacb60080481c11eb0303d3f83d0:
> 
>   clk: renesas: r8a7795: Add THS/TSC clock (2016-06-21 09:21:06 +0200)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v4.8 (take two)
> 
>   - Add support for R-Car V2H,
>   - Add FDP1, DRIF, and thermal clocks on R-Car H3,
>   - Correct a wrong parent clock.
> 
> This pull request is based on my previous request "[git pull] clk:
> renesas: Add support for R-Car M3-W".
> For proper merge history (auto-grabbing the commit message from the
> signed tag), you should pull tags/clk-renesas-for-v4.8-tag1 first.
> As <dt-bindings/clock/r8a7796-cpg-mssr.h> is a hard dependency for the
> initial r8a7796.dtsi file, I would appreciate if you could do that
> sooner rather than later, so Simon can pull it as well, and start
> queueing up the DT files for R-Car M3-W, which need to go through
> arm-soc.

Thanks. Pulled into clk-next. BTW, please don't use clk_readl()
unless you really need it. Just use readl/writel directly. I
should put a big fat warning over those functions that they
shouldn't be used.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
