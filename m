Return-Path: <s.nawrocki@samsung.com>
Message-id: <5549F292.3090906@samsung.com>
Date: Wed, 06 May 2015 12:53:06 +0200
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/19] clk: samsung: Silence sparse warnings
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
 <1430897996-11597-9-git-send-email-sboyd@codeaurora.org>
In-reply-to: <1430897996-11597-9-git-send-email-sboyd@codeaurora.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/05/15 09:39, Stephen Boyd wrote:
> drivers/clk/samsung/clk-exynos5260.c:138:40: warning: Using plain integer as NULL pointer

> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/samsung/clk-exynos5260.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
> index df1d83c45554..06f96eb7cf93 100644
> --- a/drivers/clk/samsung/clk-exynos5260.c
> +++ b/drivers/clk/samsung/clk-exynos5260.c
> @@ -135,7 +135,7 @@ static struct samsung_gate_clock aud_gate_clks[] __initdata = {
>  
>  static void __init exynos5260_clk_aud_init(struct device_node *np)
>  {
> -	struct samsung_cmu_info cmu = {0};
> +	struct samsung_cmu_info cmu = { NULL };

I'd vote for an empty initializer list, anyway, thanks for
correcting that.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
