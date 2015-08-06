Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-id: <55C3178A.4080607@samsung.com>
Date: Thu, 06 Aug 2015 10:15:06 +0200
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 18/26] clk: samsung: Convert to clk_hw based provider APIs
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-19-git-send-email-sboyd@codeaurora.org>
In-reply-to: <1438362246-6664-19-git-send-email-sboyd@codeaurora.org>
Content-type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 31/07/15 19:03, Stephen Boyd wrote:
> We're removing struct clk from the clk provider API, so switch
> this code to using the clk_hw based provider APIs.
> 
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>  drivers/clk/samsung/clk-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> index 8e7f36f105c1..7c1e1f58e2da 100644
> --- a/drivers/clk/samsung/clk-cpu.c
> +++ b/drivers/clk/samsung/clk-cpu.c
> @@ -100,8 +100,8 @@ static void wait_until_mux_stable(void __iomem *mux_reg, u32 mux_pos,
>  static long exynos_cpuclk_round_rate(struct clk_hw *hw,
>  			unsigned long drate, unsigned long *prate)
>  {
> -	struct clk *parent = __clk_get_parent(hw->clk);
> -	*prate = __clk_round_rate(parent, drate);
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	*prate = clk_hw_round_rate(parent, drate);
>  	return *prate;
>  }
