Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v5 29/44] ARM: da8xx: add new USB PHY clock init using
 common clock framework
To: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-30-git-send-email-david@lechnology.com>
 <83dfab9a-be30-6313-d756-50fa018e757e@ti.com>
From: David Lechner <david@lechnology.com>
Message-ID: <c31d26b6-fb79-4581-039f-b977d737da2d@lechnology.com>
Date: Thu, 18 Jan 2018 12:43:59 -0600
MIME-Version: 1.0
In-Reply-To: <83dfab9a-be30-6313-d756-50fa018e757e@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 01/18/2018 09:14 AM, Sekhar Nori wrote:
> On Monday 08 January 2018 07:47 AM, David Lechner wrote:
>> +int __init da8xx_register_usb20_phy_clk(bool use_usb_refclkin)
>> +{
>> +	struct regmap *cfgchip;
>> +	struct clk *usb0_psc_clk, *clk;
>> +	struct clk_hw *parent;
>> +
>> +	cfgchip = syscon_regmap_lookup_by_compatible("ti,da830-cfgchip");
> 
> Am I right in understanding that this API is only called for non-DT
> boot? If yes, do we really need the lookup by compatible?

This code is used in DT boot until [PATCH v5 43/44] "ARM: da8xx-dt:
switch to device tree clocks". So, yes it is needed temporarily to
prevent breaking USB.
