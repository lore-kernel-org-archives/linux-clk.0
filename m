Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 15 Jul 2015 16:48:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Maxime Coquelin <maxime.coquelin@st.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Olivier Bideau <olivier.bideau@st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabian Frederick <fabf@skynet.be>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@stlinux.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] drivers: clk: st: Support for enable/disable in
 Clockgen PLLs
Message-ID: <20150715234823.GT30412@codeaurora.org>
References: <1436443060-12866-1-git-send-email-gabriel.fernandez@linaro.org>
 <1436443060-12866-2-git-send-email-gabriel.fernandez@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436443060-12866-2-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/09, Gabriel Fernandez wrote:
> @@ -270,6 +285,73 @@ static int clkgen_pll_is_enabled(struct clk_hw *hw)
>  	return !poweroff;
>  }
>  
> +static int __clkgen_pll_enable(struct clk_hw *hw)
> +{
> +	struct clkgen_pll *pll = to_clkgen_pll(hw);
> +	unsigned long timeout;
> +	int ret = 0;
> +
> +	if (clkgen_pll_is_enabled(hw))
> +		return 0;
> +
> +	CLKGEN_WRITE(pll, pdn_ctrl, 0);
> +
> +	timeout = jiffies + msecs_to_jiffies(10);

Jiffies isn't guaranteed to increment here because
.enable/.disable is called with irqs disabled and if this is the
only CPU running it won't be getting interrupts to update
jiffies.

> +
> +	while (!clkgen_pll_is_locked(hw)) {
> +		if (time_after(jiffies, timeout))
> +			return -ETIMEDOUT;
> +		cpu_relax();
> +	}
> +
> +	pr_debug("%s:%s enabled\n", __clk_get_name(hw->clk), __func__);
> +
> +	return ret;
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
