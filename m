Return-Path: <sboyd@codeaurora.org>
Date: Fri, 27 Jan 2017 11:52:42 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [git pull] clk: renesas: Updates for v4.11 (take two)
Message-ID: <20170127195242.GF8801@codeaurora.org>
References: <1485508898-22923-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485508898-22923-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/27, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The following changes since commit e6bdf28eff475a026b922abe78ae710e7179bdf7:
> 
>   clk: renesas: r8a7796: Add MSIOF controller clocks (2016-12-27 10:56:08 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.11-tag2
> 
> for you to fetch changes up to d963654e109565cf73399815d7585917f2d69a30:
> 
>   clk: renesas: r8a7796: Add IIC-DVFS clock (2017-01-27 08:59:24 +0100)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v4.11 (take two)
> 
>   - Use CLK_IS_CRITICAL to handle critical clocks,
>   - Add Reset Control Support for R-Car Gen2 and Gen3, and RZ/G1,
>   - Add IIC-DVFS clocks for R-Car H3 and M3-W,
>   - Minor cleanups.
> 

Thanks. Pulled into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
