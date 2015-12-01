Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 18:22:38 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: qcom: gdsc: Add support for gdscs with gds hw
 controller
Message-ID: <20151201022238.GG17532@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
 <1448517297-32419-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448517297-32419-3-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/26, Rajendra Nayak wrote:
> @@ -58,30 +58,34 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>  {
>  	int ret;
>  	u32 val = en ? 0 : SW_COLLAPSE_MASK;
> -	u32 check = en ? PWR_ON_MASK : 0;
>  	unsigned long timeout;
> +	unsigned int status_reg = sc->gdscr;
>  
>  	ret = regmap_update_bits(sc->regmap, sc->gdscr, SW_COLLAPSE_MASK, val);
>  	if (ret)
>  		return ret;
>  
>  	timeout = jiffies + usecs_to_jiffies(TIMEOUT_US);
> -	do {
> -		ret = regmap_read(sc->regmap, sc->gdscr, &val);
> -		if (ret)
> -			return ret;
>  
> -		if ((val & PWR_ON_MASK) == check)
> +	if (sc->gds_hw_ctrl) {
> +		status_reg = sc->gds_hw_ctrl;
> +	/*
> +	 * The gds hw controller asserts/de-asserts the status bit soon
> +	 * after it receives a power on/off request from a master.
> +	 * The controller then takes around 8 xo cycles to start its internal
> +	 * state machine and update the status bit. During this time, the
> +	 * status bit does not reflect the true status of the core.
> +	 * Add a delay of 1 us between writing to the SW_COLLAPSE bit and
> +	 * polling the status bit
> +	 */

Please indent this correctly to the udelay indent level.

> +		udelay(1);
> +	}
> +
> +	do {
> +		if (gdsc_is_enabled(sc, status_reg) == en)
>  			return 0;
>  	} while (time_before(jiffies, timeout));
>  
> -	ret = regmap_read(sc->regmap, sc->gdscr, &val);
> -	if (ret)
> -		return ret;
> -
> -	if ((val & PWR_ON_MASK) == check)
> -		return 0;
> -

This opens a bug where we timeout and then the status bit changes
after the timeout. One more check is good and should stay. We
could also change this to ktime instead of jiffies. That would be
a good improvement.

>  	return -ETIMEDOUT;
>  }
>  
> @@ -165,6 +169,7 @@ static int gdsc_init(struct gdsc *sc)
>  {
>  	u32 mask, val;
>  	int on, ret;
> +	unsigned int reg;
>  
>  	/*
>  	 * Disable HW trigger: collapse/restore occur based on registers writes.
> @@ -185,7 +190,8 @@ static int gdsc_init(struct gdsc *sc)
>  			return ret;
>  	}
>  
> -	on = gdsc_is_enabled(sc);
> +	reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
> +	on = gdsc_is_enabled(sc, reg);

If the gdsc is voteable, then we need to make sure that the vote
is from us when we boot up. Otherwise the kernel may think that
the gdsc is enabled, but it gets turned off by some other master
later on. I don't know if this causes some sort of problem for
the power domain framework, but we can't rely on the status bit
unless we're sure that we've actually set the register to enable
it. In the normal enable/disable path we'll always know we set
the register, so this really only matters once when we boot up.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
