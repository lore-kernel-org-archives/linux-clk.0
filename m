Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431451444-23155-17-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-17-git-send-email-rklein@nvidia.com>
Date: Wed, 13 May 2015 15:20:31 -0700
Message-ID: <CANLzEks_bEnpyKuVHJEn8XZbdMDaqj9bQ+SjpgrM-uQo0W28Ug@mail.gmail.com>
Subject: Re: [PATCH v5 15/21] clk: tegra: pll: Add dyn_ramp callback
From: Benson Leung <bleung@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 12, 2015 at 10:23 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> From: Bill Huang <bilhuang@nvidia.com>
>
> Add a callback to the pll_params for custom dynamic ramping
> functions which can be specified per PLL.
>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>

Modulo kerneldoc addition,
Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/clk/tegra/clk.h |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 330729a822cf..a61d388364b3 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -160,6 +160,8 @@ struct div_nmp {
>
>  #define MAX_PLL_MISC_REG_COUNT 6
>
> +struct tegra_clk_pll;
> +
>  /**
>   * struct tegra_clk_pll_params - PLL parameters
>   *
> @@ -271,6 +273,8 @@ struct tegra_clk_pll_params {
>                         unsigned long rate, unsigned long parent_rate);
>         unsigned long   (*adjust_vco)(struct tegra_clk_pll_params *pll_params,
>                                 unsigned long parent_rate);
> +       int     (*dyn_ramp)(struct tegra_clk_pll *pll,
> +                       struct tegra_clk_pll_freq_table *cfg);

Please add kerneldoc for dyn_ramp member above.

>  };
>
>  #define TEGRA_PLL_USE_LOCK BIT(0)
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
