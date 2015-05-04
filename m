Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1430757460-9478-7-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-7-git-send-email-rklein@nvidia.com>
Date: Mon, 4 May 2015 13:35:09 -0700
Message-ID: <CANLzEksajPjf1VH8Zn-1oXhgL8f-b7GuCBprExTP-w18WbCC4A@mail.gmail.com>
Subject: Re: [PATCH v4 06/20] clk: tegra: pll-params: change misc_reg count
 from 3 -> 6
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
> New SoC's may have more then 3 MISC registers, so bump up the
> array size and use a #define to be more informative about the value.
>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
> ---
>  drivers/clk/tegra/clk.h |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 5759b8bfb80e..8e7361886cf9 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -156,6 +156,8 @@ struct div_nmp {
>         u8              override_divp_shift;
>  };
>
> +#define MAX_PLL_MISC_REG_COUNT 6
> +
>  /**
>   * struct clk_pll_params - PLL parameters
>   *
> @@ -213,7 +215,7 @@ struct tegra_clk_pll_params {
>         u32             iddq_bit_idx;
>         u32             aux_reg;
>         u32             dyn_ramp_reg;
> -       u32             ext_misc_reg[3];
> +       u32             ext_misc_reg[MAX_PLL_MISC_REG_COUNT];
>         u32             pmc_divnm_reg;
>         u32             pmc_divp_reg;
>         u32             flags;


Missing kernel doc above for ext_misc_reg and some other surrounding members.

Otherwise,
Reviewed-by: Benson Leung <bleung@chromium.org>



-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
