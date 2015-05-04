Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1430757460-9478-10-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-10-git-send-email-rklein@nvidia.com>
Date: Mon, 4 May 2015 16:11:55 -0700
Message-ID: <CANLzEkvqniogx9AUzK-Vx0TYg-=qQB_JwPEU+DbHDcNRx3c4xA@mail.gmail.com>
Subject: Re: [PATCH v4 09/20] clk: tegra: pll: Add logic for SS
From: Benson Leung <bleung@chromium.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bill Huang <bilhuang@nvidia.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> From: Bill Huang <bilhuang@nvidia.com>
>
> Add some logic for Spread Spectrum control. It is used in conjuncture
> with SDM fractional dividers. SSC has to be disabled when we configure
> the divider settings.
>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c |   25 ++++++++++++++++++++++++-
>  drivers/clk/tegra/clk.h     |    2 ++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index c64b75185d6b..2a559408cee1 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -621,6 +621,26 @@ static void _update_pll_cpcon(struct tegra_clk_pll *pll,
>         pll_writel_misc(val, pll);
>  }
>
> +static void pll_clk_start_ss(struct tegra_clk_pll *pll)
> +{
> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {

defaults_set looks like it's introduced later (patch 16/20). Can you
remove references to that, or reorder the patches if that makes more
sense?

> +               u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
> +
> +               val |= pll->params->ssc_ctrl_en_mask;
> +               pll_writel(val, pll->params->ssc_ctrl_reg, pll);
> +       }
> +}
> +
> +static void pll_clk_stop_ss(struct tegra_clk_pll *pll)
> +{
> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {

Ditto here for defaults_set.

> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index eb8103ec335e..3f92f1ad3961 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -219,6 +219,8 @@ struct tegra_clk_pll_params {
>         u32             sdm_din_mask;
>         u32             sdm_ctrl_reg;
>         u32             sdm_ctrl_en_mask;
> +       u32             ssc_ctrl_reg;
> +       u32             ssc_ctrl_en_mask;

Please add kerneldoc for these.





-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
