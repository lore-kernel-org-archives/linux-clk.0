Return-Path: <sboyd@codeaurora.org>
Date: Thu, 15 Oct 2015 12:08:09 -0700
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
Subject: Re: [PATCH 06/13] clk: versatile-icst: convert to use regmap
Message-ID: <20151015190809.GL4558@codeaurora.org>
References: <1444916813-31024-1-git-send-email-linus.walleij@linaro.org>
 <1444916813-31024-7-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1444916813-31024-7-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/15, Linus Walleij wrote:
> @@ -151,10 +174,19 @@ struct clk *icst_clk_register(struct device *dev,
>  	init.flags = CLK_IS_ROOT;
>  	init.parent_names = (parent_name ? &parent_name : NULL);
>  	init.num_parents = (parent_name ? 1 : 0);
> +	icst->map = regmap_init_mmio(NULL, base, &icst_regmap_conf);
> +	if (IS_ERR(icst->map)) {
> +		int ret;
> +
> +		pr_err("could not initialize ICST regmap\n");
> +		kfree(icst);
> +		ret = PTR_ERR(icst->map);

drivers/clk/versatile/clk-icst.c:183
icst_clk_register() error: dereferencing freed memory 'icst'
drivers/clk/versatile/clk-icst.c:184
icst_clk_register() warn: possible memory leak of 'pclone'


> +		return ERR_PTR(ret);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
