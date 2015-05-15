Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431691653-17615-1-git-send-email-bilhuang@nvidia.com>
References: <1431691653-17615-1-git-send-email-bilhuang@nvidia.com>
Date: Fri, 15 May 2015 10:12:56 -0700
Message-ID: <CANLzEktZXkggY_6UbBBsU_9SB2eqsGRoBV138cDgBqo95BaWyw@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: tegra: fix WARN_ON in PLL_RE registration
From: Benson Leung <bleung@chromium.org>
To: Bill Huang <bilhuang@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>,
	Paul Walmsley <pwalmsley@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 15, 2015 at 5:07 AM, Bill Huang <bilhuang@nvidia.com> wrote:
> This fixes two things.
>
> - Read the correct IDDQ register
> - Check the correct IDDQ bit position
>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

By the way, does it also make sense to do the same thing for
tegra_clk_register_pllss, which also reads the base register instead
of the specific iddq_reg from params?

> ---
>  drivers/clk/tegra/clk-pll.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 05c6d08..734340e 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1630,7 +1630,8 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
>
>         val = pll_readl_base(pll);
>         if (val & PLL_BASE_ENABLE)
> -               WARN_ON(val & pll_params->iddq_bit_idx);
> +               WARN_ON(readl_relaxed(clk_base + pll_params->iddq_reg) &
> +                               BIT(pll_params->iddq_bit_idx));
>         else {
>                 int m;
>
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
