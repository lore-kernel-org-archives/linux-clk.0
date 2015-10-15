Return-Path: <sboyd@codeaurora.org>
Date: Thu, 15 Oct 2015 12:28:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@arm.linux.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Will Deacon <will.deacon@arm.com>, Rob Herring <robh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 07/13] clk: versatile-icst: refactor to allocate regmap
 separately
Message-ID: <20151015192859.GQ4558@codeaurora.org>
References: <1444916813-31024-1-git-send-email-linus.walleij@linaro.org>
 <1444916813-31024-8-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1444916813-31024-8-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/15, Linus Walleij wrote:
> @@ -140,21 +141,16 @@ static const struct clk_ops icst_ops = {
>  	.set_rate = icst_set_rate,
>  };
>  
> -struct clk *icst_clk_register(struct device *dev,
> +struct clk *icst_clk_setup(struct device *dev,

This needs static now.

>  			const struct clk_icst_desc *desc,
>  			const char *name,
>  			const char *parent_name,
> -			void __iomem *base)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
