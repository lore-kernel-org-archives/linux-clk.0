Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
Subject: Re: [PATCH 3/3] clk: zx: register ZX296718 clocks using common clock
 framework
To: Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org,
 linux-clk@vger.kernel.org
References: <1468834877-22534-1-git-send-email-jun.nie@linaro.org>
 <1468834877-22534-3-git-send-email-jun.nie@linaro.org>
 <146888730254.8780.1667996409080895941@resonance>
From: Jun Nie <jun.nie@linaro.org>
Message-ID: <57908230.6060104@linaro.org>
Date: Thu, 21 Jul 2016 16:05:04 +0800
MIME-Version: 1.0
In-Reply-To: <146888730254.8780.1667996409080895941@resonance>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 2016年07月19日 08:15, Michael Turquette wrote:
> Hi Jun Nie,
>
> Quoting Jun Nie (2016-07-18 02:41:17)
>> +Required properties:
>> +- compatible : shall be one of the following:
>> +       "zte,zx296718-topcrm":
>> +               zx296718 top clock selection, divider and gating
>> +
>> +       "zte,zx296718-lsp0crm" and
>> +       "zte,zx296718-lsp1crm":
>> +               zx296718 device level clock selection and gating
>> +
>> +- reg: Address and length of the register set
>
> clock-cells?

Right, there are several clock controllers with sparse register regions. 
So separate initialization is needed.

>
>> +#include <linux/clk.h>
>
> Is clk.h needed? I don't see any clock consumer api's used in this
> driver.

I can remove that.

>
>> +struct zx_fixed_factor_clock top_ffactor_clk[] = {
>> +       FFACTOR(0, "clk4m",             "osc24m", 1, 6,  0),
>> +       FFACTOR(0, "clk2m",             "osc24m", 1, 12, 0),
>> +       /* pll cpu */
>> +       FFACTOR(0, "clk1600m",          "pll_cpu", 1, 1, CLK_SET_RATE_PARENT),
>> +       FFACTOR(0, "clk800m",           "pll_cpu", 1, 2, CLK_SET_RATE_PARENT),
>
> You have a lot of static data here, which is good. It can be expanded to
> fill out struct clk_init_data (as showed in my reply to patch #2) and
> then you can get rid of all of the registration functions.

Yes, your reply to patch #2 does save registration functions. I will try 
to follow that way. Thank you!

>
>> diff --git a/include/dt-bindings/clock/zx296718-clock.h b/include/dt-bindings/clock/zx296718-clock.h
>> new file mode 100644
>> index 0000000..97d45e2
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/zx296718-clock.h
>> @@ -0,0 +1,140 @@
>> +/*
>> + * Copyright (C) 2015 - 2016 ZTE Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +#ifndef __DT_BINDINGS_CLOCK_ZX296718_H
>> +#define __DT_BINDINGS_CLOCK_ZX296718_H
>> +
>> +/* PLL */
>> +#define ZX296718_OSC           0
>> +#define ZX296718_PLL_CPU       1
>> +#define ZX296718_PLL_MAC       2
>> +#define ZX296718_PLL_MM0       3
>> +#define ZX296718_PLL_MM1       4
>> +#define ZX296718_PLL_VGA       5
>> +#define ZX296718_PLL_DDR       6
>> +#define ZX296718_PLL_AUDIO     7
>> +#define ZX296718_PLL_HSIC      8
>
> For some clock controllers I suggest to split this list of numbers into
> a private header that is only used by the Linux driver, and another
> shared DT header that exposes only the clocks that will be consumed by
> downstream drivers (usually just leaf gate clocks).
>
> This also means that you can hide the ugly NR_CLKS stuff in the C-only
> implementation and not add that Linux-specific data into the generic
> binding description. It's up to you though.

NR_CLKS provides redundant info to drivers and generic binding 
description. Maybe that's why you think it is ugly. But move clocks from 
private header to DT binding header later will result redundant change 
history and effort. If that's all situation, I prefer to expose all 
information in DT binding header.

>
> Regards,
> Mike
>
