Return-Path: <jerome.forissier@linaro.org>
Return-Path: <jerome.forissier@linaro.org>
Subject: Re: [PATCH 2/2] clk: imx: imx7d: remove clks_init_on array
To: Stephen Boyd <sboyd@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Anson Huang <anson.huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
References: <1533703167-26583-1-git-send-email-Anson.Huang@nxp.com>
 <1533703167-26583-2-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB4481FC2BAD71B75D7BE84C0788260@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916F8BC381BBA01DB21D1C0F5260@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB44813C7A3E0AF4F3BCFFCF0088390@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <153567894721.93865.4092113232222931488@swboyd.mtv.corp.google.com>
From: Jerome Forissier <jerome.forissier@linaro.org>
Message-ID: <a6489bda-703f-207c-0b24-60f4044fe89f@linaro.org>
Date: Fri, 31 Aug 2018 10:01:44 +0200
MIME-Version: 1.0
In-Reply-To: <153567894721.93865.4092113232222931488@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 08/31/2018 03:29 AM, Stephen Boyd wrote:
> Quoting Peng Fan (2018-08-12 18:15:41)
>> Hi Anson,
>>
>>>>> -----Original Message-----
>>>>> From: Anson Huang
>>>>> Sent: 2018年8月8日 12:39
>>>>> To: shawnguo@kernel.org; s.hauer@pengutronix.de;
>>>>> kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>;
>>>>> mturquette@baylibre.com; sboyd@kernel.org;
>>>>> linux-arm-kernel@lists.infradead.org;
>>>>> linux-clk@vger.kernel.org; linux-kernel@vger.kernel.org
>>>>> Cc: dl-linux-imx <linux-imx@nxp.com>
>>>>> Subject: [PATCH 2/2] clk: imx: imx7d: remove clks_init_on array
>>>>>
>>>>> Clock framework will enable those clocks registered with
>>>>> CLK_IS_CRITICAL flag, so no need to have clks_init_on array during
>>>>> clock
>>>> initialization now.
>>>>
>>>> Will it be more flexible to parse dts saying "critical-clocks = <xxx>"
>>>> or "init-on-arrary=<xxx>"
>>>> and enable those clocks?
>>>
>>> Parsing the clocks arrays from dtb is another way of enabling critical clocks, but
>>> for current i.MX6/7 platforms, we implement it in same way as most of other
>>> SoCs, currently I did NOT see any necessity of putting them in dtb, just adding
>>> flag during clock registering is more simple, if there is any special requirement
>>> for different clocks set to be enabled, then we can add support to enable the
>>> method of parsing critical-clocks from dtb. Just my two cents.
>>
>> Thinking about OP-TEE want to use one device, but it's clocks are registered
>> by Linux, because there is no module in Linux side use it, it will shutdown the clock,
>> which cause OP-TEE could not access the device.
>>
>> Then people have to modify clk code to add CLK_IS_CRITICAL flag to make sure
>> the clocks are not shutdown by Linux.
>>
>> However adding a new property in clk node and let driver code parse the dts,
>> there is no need to modify clk driver code when OP-TEE needs another device clock.
>>
> 
> If OP-TEE needs linux to keep things on then why can't the OP-TEE driver
> in Linux probe, acquire clocks, and keep the clks enabled forever?

Sounds reasonable, but how could this be done without introducing
platform-specific stuff in the OP-TEE driver?

> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
