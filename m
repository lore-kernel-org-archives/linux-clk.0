Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH 8/8] clk: vc5: Add support for IDT VersaClock 5P49V6901
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170629101851.23972-1-marek.vasut@gmail.com>
 <20170629101851.23972-8-marek.vasut@gmail.com>
 <CAMuHMdVRVURPWXb=pXDsxMgmiB6QvMsXHWTYM6UMW7sufUzf3w@mail.gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Alexey Firago <alexey_firago@mentor.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9e1af105-2738-833f-2714-7aac3b66cdf9@gmail.com>
Date: Thu, 29 Jun 2017 17:54:22 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVRVURPWXb=pXDsxMgmiB6QvMsXHWTYM6UMW7sufUzf3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 06/29/2017 01:41 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Thu, Jun 29, 2017 at 12:18 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Update IDT VersaClock 6 driver to support 5P49V6901. This chip has
> 
> Update the IDT VersaClock5 driver to support the VersaClock6 5P49V6901?
> 
>> two clock inputs (external XTAL or external CLKIN), four fractional
>> dividers (FODs) and five clock outputs (four universal clock outputs
>> and one reference clock output at OUT0_SELB_I2C).
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Alexey Firago <alexey_firago@mentor.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>  drivers/clk/clk-versaclock5.c | 11 +++++++++++
> 
> and
> 
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -210,14 +210,14 @@ config COMMON_CLK_OXNAS
>           Support for the OXNAS SoC Family clocks.
> 
>  config COMMON_CLK_VC5
> -       tristate "Clock driver for IDT VersaClock5 devices"
> +       tristate "Clock driver for IDT VersaClock5/6 devices"
>         depends on I2C
>         depends on OF
>         select REGMAP_I2C
>         help
>         ---help---
> -         This driver supports the IDT VersaClock5 programmable clock
> -         generator.
> +         This driver supports the IDT VersaClock5 and VersaClock6
> +         programmable clock generator.

Tweaked a bit more, but yes, good point.

-- 
Best regards,
Marek Vasut
