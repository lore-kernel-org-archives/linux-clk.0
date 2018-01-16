Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v5 12/44] clk: davinci: Add platform information for TI
 DA850 PSC
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>, Adam Ford
	<aford173@gmail.com>,
        <linux-kernel@vger.kernel.org>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-13-git-send-email-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <8d09dba6-9b1d-e06e-8730-256b8a4320db@ti.com>
Date: Tue, 16 Jan 2018 19:30:27 +0530
MIME-Version: 1.0
In-Reply-To: <1515377863-20358-13-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Monday 08 January 2018 07:47 AM, David Lechner wrote:
> +void __init da850_psc_clk_init(void __iomem *psc0, void __iomem *psc1)
> +{
> +	struct clk_onecell_data *clk_data;
> +
> +	clk_data = davinci_psc_register_clocks(psc0, da850_psc0_info, 16);
> +	if (!clk_data)
> +		return;
> +
> +	clk_register_clkdev(clk_data->clks[3], NULL, "ti-aemif");
> +	clk_register_clkdev(clk_data->clks[3], "aemif", "davinci-nand.0");
> +	clk_register_clkdev(clk_data->clks[4], NULL, "spi_davinci.0");
> +	clk_register_clkdev(clk_data->clks[5], NULL, "da830-mmc.0");
> +	clk_register_clkdev(clk_data->clks[9], NULL, "serial8250.0");
> +	clk_register_clkdev(clk_data->clks[14], "arm", NULL);
> +	clk_register_clkdev(clk_data->clks[15], NULL, "davinci-rproc.0");
> +
> +	clk_free_onecell_data(clk_data);
> +
> +	clk_data = davinci_psc_register_clocks(psc1, da850_psc1_info, 32);
> +	if (!clk_data)
> +		return;
> +
> +	clk_register_clkdev(clk_data->clks[1], "usb20_psc_clk", NULL);

Is this con_id really needed now? Searching for "usb20_psc_clk" in your
tree results in only this one hit.

> +	clk_register_clkdev(clk_data->clks[1], NULL, "musb-da8xx");
> +	clk_register_clkdev(clk_data->clks[1], NULL, "cppi41-dmaengine");

I guess multiple dev_id matches like these are another hurdle in moving
them to davinci_psc_clk_info[] table? If its too cumbersome to keep
multiple entries in the table, they can be handled as an exception at
the end of processing the table? Still they are not the norm so I hope
the normal case will still benefit.

> +	clk_register_clkdev(clk_data->clks[2], NULL, "ohci-da8xx");
> +	clk_register_clkdev(clk_data->clks[3], "gpio", NULL);
> +	clk_register_clkdev(clk_data->clks[5], NULL, "davinci_emac.1");
> +	clk_register_clkdev(clk_data->clks[5], "fck", "davinci_mdio.0");
> +	clk_register_clkdev(clk_data->clks[7], NULL, "davinci-mcasp.0");
> +	clk_register_clkdev(clk_data->clks[8], "fck", "ahci_da850");
> +	clk_register_clkdev(clk_data->clks[9], NULL, "vpif");
> +	clk_register_clkdev(clk_data->clks[10], NULL, "spi_davinci.1");
> +	clk_register_clkdev(clk_data->clks[11], NULL, "i2c_davinci.2");
> +	clk_register_clkdev(clk_data->clks[12], NULL, "serial8250.1");
> +	clk_register_clkdev(clk_data->clks[13], NULL, "serial8250.2");
> +	clk_register_clkdev(clk_data->clks[14], NULL, "davinci-mcbsp.0");
> +	clk_register_clkdev(clk_data->clks[15], NULL, "davinci-mcbsp.1");
> +	clk_register_clkdev(clk_data->clks[16], "fck", "da8xx_lcdc.0");
> +	clk_register_clkdev(clk_data->clks[17], "fck", "ehrpwm.0");
> +	clk_register_clkdev(clk_data->clks[17], "fck", "ehrpwm.1");
> +	clk_register_clkdev(clk_data->clks[18], NULL, "da830-mmc.1");
> +	clk_register_clkdev(clk_data->clks[20], "fck", "ecap.0");
> +	clk_register_clkdev(clk_data->clks[20], "fck", "ecap.1");
> +	clk_register_clkdev(clk_data->clks[20], "fck", "ecap.2");
> +
> +	clk_free_onecell_data(clk_data);
> +}

Thanks,
Sekhar
