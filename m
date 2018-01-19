Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v5 21/44] clk: davinci: New driver for TI DA8XX USB PHY
 clocks
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
 <1515377863-20358-22-git-send-email-david@lechnology.com>
 <493e4809-6b77-7772-70c7-ad0fa04e9033@ti.com>
 <8821ac95-ee3f-b53b-9a8a-598b69d1b35e@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <486d664f-1d55-0abd-27e2-cc9d7de112fa@ti.com>
Date: Fri, 19 Jan 2018 10:34:38 +0530
MIME-Version: 1.0
In-Reply-To: <8821ac95-ee3f-b53b-9a8a-598b69d1b35e@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Friday 19 January 2018 12:19 AM, David Lechner wrote:
>>
> 
> or to avoid defining a new macro?
> 
> 
>>     regmap_write_bits(clk->regmap, CFGCHIP(2),
>>               CFGCHIP2_USB1PHYCLKMUX,
>>               index ? CFGCHIP2_USB1PHYCLKMUX : 0); 

Looks good as well!

Regards,
Sekhar
