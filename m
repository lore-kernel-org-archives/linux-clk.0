Return-Path: <bleung@google.com>
MIME-Version: 1.0
Sender: bleung@google.com
In-Reply-To: <1431451444-23155-14-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-14-git-send-email-rklein@nvidia.com>
Date: Wed, 13 May 2015 13:59:37 -0700
Message-ID: <CANLzEkuqCB+wF65MrtWwnsgTDhw0T9Vae9C5sBALGDbPvwrr_w@mail.gmail.com>
Subject: Re: [PATCH v5 12/21] clk: tegra: pll: Add specialized logic for T210
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
> On Tegra210 SoC's, the logic to enable several of the plls is different
> from previous generations. Therefore, add registeration functions specific

s/registeration/registration

> to Tegra210 which will handle them appropriately.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
> v5:
>   - Removed unused variables.
>
> v4:
>   - Fixed plle_tegra210_is_enabled callback typos
>
> v2:
>   - Fixed plle logic. PLLE on Tegra210 has had its enable bit moved, so
>     we can't use the default _clk_pll_enable/disable routines. Instead,
>     manually set/clear the correct bit for PLLE within its functions.
>
>  drivers/clk/tegra/clk-pll.c |  347 ++++++++++++++++++++++++++++++++++++++++++-
>  drivers/clk/tegra/clk.h     |   24 +++
>  2 files changed, 369 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 54ebab2b85e5..2b1f672e3bdb 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -65,6 +65,7 @@
>  #define PLLE_BASE_DIVN_WIDTH 8
>  #define PLLE_BASE_DIVM_SHIFT 0
>  #define PLLE_BASE_DIVM_WIDTH 8
> +#define PLLE_BASE_ENABLE BIT(31)
>
>  #define PLLE_MISC_SETUP_BASE_SHIFT 16
>  #define PLLE_MISC_SETUP_BASE_MASK (0xffff << PLLE_MISC_SETUP_BASE_SHIFT)
> @@ -910,7 +911,8 @@ const struct clk_ops tegra_clk_plle_ops = {
>
>  #if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
>         defined(CONFIG_ARCH_TEGRA_124_SOC) || \
> -       defined(CONFIG_ARCH_TEGRA_132_SOC)
> +       defined(CONFIG_ARCH_TEGRA_132_SOC) || \
> +       defined(CONFIG_ARCH_TEGRA_210_SOC)
>
>  static int _pll_fixed_mdiv(struct tegra_clk_pll_params *pll_params,
>                            unsigned long parent_rate)
> @@ -1579,7 +1581,8 @@ struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
>
>  #if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
>         defined(CONFIG_ARCH_TEGRA_124_SOC) || \
> -       defined(CONFIG_ARCH_TEGRA_132_SOC)
> +       defined(CONFIG_ARCH_TEGRA_132_SOC) || \
> +       defined(CONFIG_ARCH_TEGRA_210_SOC)
>  static const struct clk_ops tegra_clk_pllxc_ops = {
>         .is_enabled = clk_pll_is_enabled,
>         .enable = clk_pll_enable,


It looks like you might have missed changing one set of #if defined
further down below to include CONFIG_ARCH_TEGRA_210_SOC :

#if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
static const struct clk_ops tegra_clk_pllss_ops = {
.is_enabled = clk_pll_is_enabled,
.enable = clk_pll_enable,
.disable = clk_pll_disable,
.recalc_rate = clk_pll_recalc_rate,
.round_rate = clk_pll_ramp_round_rate,
.set_rate = clk_pllxc_set_rate,
};

struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
void __iomem *clk_base, unsigned long flags,
struct tegra_clk_pll_params *pll_params,
spinlock_t *lock)

...

#endif

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
