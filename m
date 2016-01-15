Return-Path: <sboyd@codeaurora.org>
Date: Thu, 14 Jan 2016 18:02:37 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 04/13] clk: at91: make IRQ optional and register them
 later
Message-ID: <20160115020237.GJ22188@codeaurora.org>
References: <1449248628-3486-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1449248628-3486-5-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1449248628-3486-5-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/04, Alexandre Belloni wrote:
> @@ -686,3 +652,45 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>  }
>  CLK_OF_DECLARE(at91sam9x5_clk_main, "atmel,at91sam9x5-clk-main",
>  	       of_at91sam9x5_clk_main_setup);
> +
> +static const struct of_device_id atmel_clk_main_dt_ids[] = {
> +	{ .compatible = "atmel,at91rm9200-clk-main-osc" },
> +	{ .compatible = "atmel,at91sam9x5-clk-main-rc-osc" },
> +	{ .compatible = "atmel,at91sam9x5-clk-main" },
> +	{ /* sentinel */ }
> +};
> +
> +static int __init atmel_clk_main_probe(struct platform_device *pdev)
> +{
> +	struct of_phandle_args clkspec = { .np = pdev->dev.of_node};
> +	struct clk_main *clkmain;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	hw = __clk_get_hw(of_clk_get_from_provider(&clkspec));
> +	if (!hw)
> +		return -ENODEV;
> +
> +	clkmain = to_clk_main(hw);
> +	clkmain->irq = platform_get_irq(pdev, 0);
> +	if (!clkmain->irq)
> +		return 0;

Is there any way to get the irq into this probe function without
getting a clk pointer and then unwrapping it to get an irq
value out of the clk_hw wrapper structure? That's a pretty
convoluted design.

> +
> +	init_waitqueue_head(&clkmain->wait);
> +	irq_set_status_flags(clkmain->irq, IRQ_NOAUTOEN);
> +	ret = devm_request_irq(&pdev->dev, clkmain->irq, clk_main_irq_handler,
> +			       IRQF_TRIGGER_HIGH, __clk_get_name(hw->clk),
> +			       clkmain);
> +	if (ret)
> +		clkmain->irq = 0;
> +
> +	return ret;
> +}
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
