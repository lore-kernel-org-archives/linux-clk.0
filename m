Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 17:35:09 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: mturquette@baylibre.com, Vineet.Gupta1@synopsys.com,
	linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] clk/axs10x: Add I2S PLL clock driver
Message-ID: <20160416003509.GM26353@codeaurora.org>
References: <4018d5e586f6a5b37c665000fbec8f6aad9388f3.1459443839.git.joabreu@synopsys.com>
 <20160402010237.GY18567@codeaurora.org>
 <57027A79.8060708@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <57027A79.8060708@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/04, Jose Abreu wrote:
> >> +	fbdiv = i2s_pll_get_value(readl((void *)PLL_FBDIV_ADDR));
> >> +	odiv = i2s_pll_get_value(readl((void *)PLL_ODIV0_ADDR));
> >> +
> >> +	return (((clk->ref_clk / idiv ) * fbdiv) / odiv);
> > Again, too many parentheses. Also, any concerns of 32-bit
> > truncation here (i.e. is 64-bit math needed)?
> 
> You are right there is no need to use 64-bit math, will change in next version.

Well it wasn't 64-bit math in the first place, so the question
was more if you wanted to use 64-bit math.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
