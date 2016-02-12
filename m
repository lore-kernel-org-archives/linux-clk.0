Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Fri, 12 Feb 2016 08:02:54 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
	geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
	rklein@nvidia.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v42 3/6] clk: Provide OF helper to mark clocks as CRITICAL
Message-ID: <20160212080254.GK20693@x1>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-4-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1455225554-13267-4-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, 11 Feb 2016, Michael Turquette wrote:

> From: Lee Jones <lee.jones@linaro.org>
> 
> This call matches clocks which have been marked as critical in DT
> and sets the appropriate flag.  These flags can then be used to
> mark the clock core flags appropriately prior to registration.
> 
> Legacy bindings requiring this feature must add the clock-critical
> property to their binding descriptions, as it is not a part of
> common-clock binding.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> ---
> Changed in vWhatever:
>   * Added kerneldoc
>   * Moved to clk.c, removed static inline
>   * s/of_clk_mark_if_critical/of_clk_detect_critical/

Looks like you didn't fold this change in.

Only the kerneldoc is correct.

>   * s/critical-clock/clock-critical/
> 
>  drivers/clk/clk.c            | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h |  8 +++++++-
>  2 files changed, 42 insertions(+), 1 deletion(-)

Appart from the small aforementioned issue, the changes look good to
me.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 39f9527..5181a15 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3202,6 +3202,41 @@ static int parent_ready(struct device_node *np)
>  }
>  
>  /**
> + * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Device Tree
> + * @np: Device node pointer associated with clock provider
> + * @index: clock index
> + * @flags: pointer to clk_core->flags
> + *
> + * Detects if the clock-critical property exists and, if so, sets the
> + * corresponding CLK_IS_CRITICAL flag.
> + *
> + * Do not use this function. It exists only for legacy Device Tree
> + * bindings, such as the one-clock-per-node style that are outdated.
> + * Those bindings typically put all clock data into .dts and the Linux
> + * driver has no clock data, thus making it impossible to set this flag
> + * correctly from the driver. Only those drivers may call
> + * of_clk_detect_critical from their setup functions.
> + *
> + * Return: error code or zero on success
> + */
> +int of_clk_mark_if_critical(struct device_node *np,
> +					  int index, unsigned long *flags)
> +{
> +	struct property *prop;
> +	const __be32 *cur;
> +	uint32_t idx;
> +
> +	if (!np || !flags)
> +		return -EINVAL;
> +
> +	of_property_for_each_u32(np, "clock-critical", prop, cur, idx)
> +		if (index == idx)
> +			*flags |= CLK_IS_CRITICAL;
> +
> +	return 0;
> +}
> +
> +/**
>   * of_clk_init() - Scan and init clock providers from the DT
>   * @matches: array of compatible values and init functions for providers.
>   *
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1d986ea..d15d3cc 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -705,7 +705,8 @@ int of_clk_get_parent_count(struct device_node *np);
>  int of_clk_parent_fill(struct device_node *np, const char **parents,
>  		       unsigned int size);
>  const char *of_clk_get_parent_name(struct device_node *np, int index);
> -
> +int of_clk_mark_if_critical(struct device_node *np, int index,
> +			    unsigned long *flags);
>  void of_clk_init(const struct of_device_id *matches);
>  
>  #else /* !CONFIG_OF */
> @@ -742,6 +743,11 @@ static inline const char *of_clk_get_parent_name(struct device_node *np,
>  {
>  	return NULL;
>  }
> +static inline int of_clk_mark_if_critical(struct device_node *np, int index,
> +					  unsigned long *flags)
> +{
> +	return 0;
> +}
>  static inline void of_clk_init(const struct of_device_id *matches) {}
>  #endif /* CONFIG_OF */
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
