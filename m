Return-Path: <jsarha@ti.com>
Subject: Re: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
To: Tero Kristo <t-kristo@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <tony@atomide.com>, <linux-omap@vger.kernel.org>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
From: Jyri Sarha <jsarha@ti.com>
Message-ID: <0fad1dcd-1eed-0ee9-47d7-d101a3a1fdbb@ti.com>
Date: Wed, 28 Feb 2018 12:23:15 +0200
MIME-Version: 1.0
In-Reply-To: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On 26/02/18 17:10, Tero Kristo wrote:
> Hi,
> 
> This patch adds clock rate propagation support for clkctrl clocks. This
> is needed on am33xx beaglebone black device at least, otherwise the
> display does not work. Similar problem appears to be present on am43xx
> but haven't heard of any reports of such so far, maybe Jyri can confirm
> this?
> 
> -Tero
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

Tested-by: Jyri Sarha <jsarha@ti.com>

Displays on am335x-evm, Beaglebone-black, and Beaglebone with tfp410
dvi-cape work with these patches.

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
