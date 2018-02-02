Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 18/41] clk: davinci: New driver for TI DA8XX CFGCHIP
 clocks
From: Sekhar Nori <nsekhar@ti.com>
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski
	<bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Adam Ford
	<aford173@gmail.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-19-git-send-email-david@lechnology.com>
 <c2138795-edcd-bb7d-094d-47dc049c33df@ti.com>
Message-ID: <9f3640de-461e-de42-30ab-c1089f9dbc43@ti.com>
Date: Fri, 2 Feb 2018 19:23:20 +0530
MIME-Version: 1.0
In-Reply-To: <c2138795-edcd-bb7d-094d-47dc049c33df@ti.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Friday 02 February 2018 06:49 PM, Sekhar Nori wrote:
> On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
>> +static const struct clk_ops da8xx_cfgchip_div4p5_clk_ops = {
>> +	.enable		= da8xx_cfgchip_gate_clk_enable,
>> +	.disable	= da8xx_cfgchip_gate_clk_disable,
>> +	.is_enabled	= da8xx_cfgchip_gate_clk_is_enabled,
> 
> I assume the reason for not using clk-gate.c is lack of regmap support
> there?

This is rather question for da8xx_cfgchip_gate_clk_ops. Sorry about the
bad context.

Thanks,
Sekhar
