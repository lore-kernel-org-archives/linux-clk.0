Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Fri, 12 Feb 2016 08:03:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
	geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
	rklein@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v42 1/6] clk: Allow clocks to be marked as CRITICAL
Message-ID: <20160212080325.GL20693@x1>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-2-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1455225554-13267-2-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, 11 Feb 2016, Michael Turquette wrote:

> From: Lee Jones <lee.jones@linaro.org>
> 
> Critical clocks are those which must not be gated, else undefined
> or catastrophic failure would occur.  Here we have chosen to
> ensure the prepare/enable counts are correctly incremented, so as
> not to confuse users with enabled clocks with no visible users.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> ---
> Changes in v42:
>   * Moved code from clk_register into __clk_init

I'm happy with this change.  Thanks Mike!

>  drivers/clk/clk.c            | 5 +++++
>  include/linux/clk-provider.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b4db67a..993f775 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2484,6 +2484,11 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
>  	if (core->ops->init)
>  		core->ops->init(core->hw);
>  
> +	if (core->flags & CLK_IS_CRITICAL) {
> +		clk_core_prepare(core);
> +		clk_core_enable(core);
> +	}
> +
>  	kref_init(&core->ref);
>  out:
>  	clk_prepare_unlock();
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1143e38..1d986ea 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,7 @@
>  #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
>  #define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
>  #define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
> +#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
>  
>  struct clk;
>  struct clk_hw;

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
