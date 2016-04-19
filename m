Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34266 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754820AbcDSV3q (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2016 17:29:46 -0400
Date: Tue, 19 Apr 2016 14:29:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: Add Oxford Semiconductor OXNAS Standard
 Clocks
Message-ID: <20160419212944.GF15324@codeaurora.org>
References: <1460973696-5977-1-git-send-email-narmstrong@baylibre.com>
 <1460973696-5977-2-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460973696-5977-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/18, Neil Armstrong wrote:
> +
> +static int oxnas_stdclk_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct clk_oxnas_data *clk_oxnas;
> +	struct regmap *regmap;
> +	int i;
> +
> +	clk_oxnas = devm_kzalloc(&pdev->dev, sizeof(*clk_oxnas), GFP_KERNEL);
> +	if (!clk_oxnas)
> +		return -ENOMEM;
> +
> +	regmap = syscon_node_to_regmap(of_get_parent(np));
> +	if (!regmap) {
> +		dev_err(&pdev->dev, "failed to have parent regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(clk_oxnas_init); i++) {
> +		struct clk_oxnas *_clk;
> +
> +		if (!clk_oxnas_init[i].clk_init)
> +			continue;

New design is fine, really it's up to you, but then this check
isn't needed anymore, right?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
