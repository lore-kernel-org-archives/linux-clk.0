Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45548 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbeIGA0S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 20:26:18 -0400
Subject: Re: [PATCH 09/10] clk: samsung: exynos4: Use generic helper for
 handling suspend/resume
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
 <CGME20180829155102eucas1p2a4b1c554623ff97a23f85f26a6b537e2@eucas1p2.samsung.com>
 <20180829155046.29359-10-m.szyprowski@samsung.com>
From: Sylwester Nawrocki <sylwester.nawrocki@gmail.com>
Message-ID: <5140d376-b5dc-0021-6a78-782ffbfe0a7f@gmail.com>
Date: Thu, 6 Sep 2018 21:49:14 +0200
MIME-Version: 1.0
In-Reply-To: <20180829155046.29359-10-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

On 08/29/2018 05:50 PM, Marek Szyprowski wrote:
> Replace common suspend/resume handling code by generic helper.
> Handling of PLLs is a bit different in generic code, as they are handled
> in the same way as other clock registers. Such approach was already used
> on later Exynos SoCs and worked fine. Tests have shown that it works also
> on Exynos4 SoCs and significantly simplifies the code.

I was going to ask whether it is safe to drop that PLL state polling code after 
looking at the diff but then I found it all explained in the commit message. 
Thank you for this clean up series, I have applied it to the samsung-clk tree.
Thanks Chanwoo and Krzysztof for review and testing.

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos4.c | 147 ++++--------------------------
>   1 file changed, 16 insertions(+), 131 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 0421960eb963..d3bd9ffd8a09 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -16,7 +16,6 @@

> -static void exynos4_clk_enable_pll(u32 reg)
> -{
> -	u32 pll_con = readl(reg_base + reg);
> -	pll_con |= PLL_ENABLED;
> -	writel(pll_con, reg_base + reg);
> -
> -	while (!(pll_con & PLL_LOCKED)) {
> -		cpu_relax();
> -		pll_con = readl(reg_base + reg);
> -	}
> -}
> -
> -static void exynos4_clk_wait_for_pll(u32 reg)
> -{
> -	u32 pll_con;
> -
> -	pll_con = readl(reg_base + reg);
> -	if (!(pll_con & PLL_ENABLED))
> -		return;
> -
> -	while (!(pll_con & PLL_LOCKED)) {
> -		cpu_relax();
> -		pll_con = readl(reg_base + reg);
> -	}
> -}
> -
> -static int exynos4_clk_suspend(void)
> -{

> -	exynos4_clk_enable_pll(EPLL_CON0);
> -	exynos4_clk_enable_pll(VPLL_CON0);

> -	return 0;
> -}

--
Regards,
Sylwester
