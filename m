Return-Path: <peter.chen@nxp.com>
From: Peter Chen <peter.chen@nxp.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Jacky Bai <ping.bai@nxp.com>, Peng Fan
	<peng.fan@nxp.com>
Subject: RE: [PATCH 3/3] clk: imx: clk-imx6ul: add clk support for imx6ull
Date: Wed, 2 Nov 2016 06:45:57 +0000
Message-ID: <HE1PR04MB14508C014D6370FBC875B9508BA00@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1477969343-19887-1-git-send-email-peter.chen@nxp.com>
 <1477969343-19887-4-git-send-email-peter.chen@nxp.com>
 <20161102001205.GA16026@codeaurora.org>
In-Reply-To: <20161102001205.GA16026@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

=20
>
>On 11/01, Peter Chen wrote:
>>  	clks[IMX6UL_CLK_USDHC1]		=3D imx_clk_gate2("usdhc1",
>	"usdhc1_podf",	 base + 0x80,	2);
>>  	clks[IMX6UL_CLK_USDHC2]		=3D imx_clk_gate2("usdhc2",
>	"usdhc2_podf",	 base + 0x80,	4);
>> -	clks[IMX6UL_CLK_SIM1]		=3D imx_clk_gate2("sim1",
>	"sim_sel",	 base + 0x80,	6);
>> -	clks[IMX6UL_CLK_SIM2]		=3D imx_clk_gate2("sim2",
>	"sim_sel",	 base + 0x80,	8);
>> +	if (clk_on_imx6ul()) {
>> +		clks[IMX6UL_CLK_SIM1]		=3D imx_clk_gate2("sim1",
>	"sim_sel",	 base + 0x80,	6);
>> +		clks[IMX6UL_CLK_SIM2]		=3D imx_clk_gate2("sim2",
>	"sim_sel",	 base + 0x80,	8);
>> +	}
>>  	clks[IMX6UL_CLK_EIM]		=3D imx_clk_gate2("eim",
>	"eim_slow_podf", base + 0x80,	10);
>>  	clks[IMX6UL_CLK_PWM8]		=3D imx_clk_gate2("pwm8",
>	"perclk",	 base + 0x80,	16);
>>  	clks[IMX6UL_CLK_UART8_IPG]	=3D imx_clk_gate2("uart8_ipg",	"ipg",
>	 base + 0x80,	14);
>> @@ -430,6 +478,7 @@ static void __init imx6ul_clocks_init(struct device_=
node
>*ccm_node)
>>  	clk_set_rate(clks[IMX6UL_CLK_ENET_REF], 50000000);
>>  	clk_set_rate(clks[IMX6UL_CLK_ENET2_REF], 50000000);
>>  	clk_set_rate(clks[IMX6UL_CLK_CSI], 24000000);
>> +	clk_set_rate(clks[IMX6UL_CLK_PLL3_PFD2], 320000000);
>
>Can you use assigned clock rates for this instead?
>

Thanks, I will move it to dts.

Peter
