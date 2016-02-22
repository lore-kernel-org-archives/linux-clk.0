Return-Path: <sboyd@codeaurora.org>
Date: Mon, 22 Feb 2016 13:55:36 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: add lpc18xx creg clk driver
Message-ID: <20160222215536.GX4847@codeaurora.org>
References: <1455994417-4471-1-git-send-email-manabian@gmail.com>
 <1455994417-4471-2-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455994417-4471-2-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/20, Joachim Eastwood wrote:
> +static int lpc18xx_creg_clk_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct regmap *syscon;
> +
> +	syscon = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(syscon)) {
> +		dev_err(&pdev->dev, "syscon lookup failed\n");
> +		return PTR_ERR(syscon);
> +	}
> +
> +	clk_creg[CREG_CLK_1KHZ] =
> +		clk_register_creg_clk(&clk_creg_clocks[CREG_CLK_1KHZ],
> +				      &clk_creg_clocks[CREG_CLK_32KHZ].name,
> +				      syscon);
> +
> +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_base_data);

If we use the same clk_base_data both times then why can't we
just insert the 1KHz clk into the clk_creg array when the
platform device probes? That would be racy if something was
trying to read the array when it's being modified, so the
alternative non-racy solution would be to make two clk_base_data
structures, one in CLK_OF_DECLARE() and one in platform device
probe.

Otherwise this looks like what I was envisioning.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
