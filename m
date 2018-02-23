Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750962AbeBWHtk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Feb 2018 02:49:40 -0500
MIME-Version: 1.0
In-Reply-To: <907df45c-5244-34d4-93f4-e19b046ee077@samsung.com>
References: <CGME20180221101533eucas1p27bcfd237d2c851402b3e99248fec5a6c@eucas1p2.samsung.com>
 <20180221101527.25554-1-m.szyprowski@samsung.com> <20180221101527.25554-3-m.szyprowski@samsung.com>
 <CAJKOXPfeJFY7+YES-cOyhGrvyU+q3h2NHu+LwirApLtjKTyfEA@mail.gmail.com> <907df45c-5244-34d4-93f4-e19b046ee077@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 23 Feb 2018 08:49:37 +0100
Message-ID: <CAJKOXPfCYdmwrYSOa1cuU-N3RnXsAHGYOL++sCbUo2gzJLChXw@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: samsung: Add Exynos5x sub-CMU clock driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 22, 2018 at 1:22 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Krzysztof,
>
> On 2018-02-21 17:19, Krzysztof Kozlowski wrote:
>>
>> On Wed, Feb 21, 2018 at 11:15 AM, Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>>
>>> Exynos5250/5420/5800 have only one clock constroller, but some of their
>>> clock depends on respective power domains. Handling integration of clock
>>> controller and power domain can be done using runtime PM feature of CCF
>>> framework. This however needs a separate struct device for each power
>>> domain. This patch adds such separate driver for group such clocks,
>>
>> "driver to group"?
>>
>>> which can be instantiated more than once, each time for a different
>>> power domain.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/clk/samsung/clk-exynos5x-subcmu.c | 180
>>> ++++++++++++++++++++++++++++++
>>
>> In some other places we call entire family "exynos5" so maybe let's
>> follow the convention instead of "5x"? In the name of file and all the
>> variables/names later?
>
>
> Okay.
>
>
>>>   drivers/clk/samsung/clk-exynos5x-subcmu.h |  30 +++++
>>>   2 files changed, 210 insertions(+)
>>>   create mode 100644 drivers/clk/samsung/clk-exynos5x-subcmu.c
>>>   create mode 100644 drivers/clk/samsung/clk-exynos5x-subcmu.h
>>>
>>> diff --git a/drivers/clk/samsung/clk-exynos5x-subcmu.c
>>> b/drivers/clk/samsung/clk-exynos5x-subcmu.c
>>> new file mode 100644
>>> index 000000000000..9ff6d5d17f57
>>> --- /dev/null
>>> +++ b/drivers/clk/samsung/clk-exynos5x-subcmu.c
>>> @@ -0,0 +1,180 @@
>>> +/*
>>> + * Copyright (c) 2018 Samsung Electronics Co., Ltd.
>>> + * Author: Marek Szyprowski <m.szyprowski@samsung.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>
>> Use SPDX identifier instead of license text.
>>
>>> + *
>>> + * Common Clock Framework support for Exynos5x power-domain dependent
>>> + * sub-CMUs
>>> + */
>>> +
>>> +#include <linux/of_platform.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_domain.h>
>>> +#include <linux/pm_runtime.h>
>>> +
>>> +#include "clk.h"
>>> +#include "clk-exynos5x-subcmu.h"
>>> +
>>> +static struct samsung_clk_provider *ctx;
>>> +static const struct samsung_5x_subcmu_info *cmu;
>>> +static int nr_cmus;
>>
>> core_initcall here will register this and subcmu drivers. The probe of
>> this driver will populate devices for subcmus. From next patch - the
>> initcall of clock driver - will initialize the subcmus, also touching
>> these statics.
>>
>> Is my understanding correct?
>>
>> Quite complicated init system... plus static variables. Are you sure
>> there are no concurrency issues?
>
>
> Everything is okay. exynos5420 clock driver is initialized very early
> via OF_CLK_DECLARE() method. It calls
>
> samsung_clk_subcmus_init() at the end, which passes the needed clk
> context to this driver. Then there is core_init call, which registers
> both platform drivers and then a bit later at arch_initcalls all
> platform devices are populated from device tree. This triggers a probe
> of exynos5x-clock platform driver, which in its probe creates child
> platform devices for each supported power domain. Then those child
> devices are probed by exynos5x-clock-subcmu platform driver, which
> finally registers clocks and enables runtime pm for them.
>
> I know this is a bit complex, but frankly I didn't find any other way
> of handling clocks by both OF_CLK_DECLARE and platform device based
> driver(s). Maybe I will put the above explanation in the comment
> somewhere in this driver.
>
> In theory exynos5x-clock platform driver is not really needed, as child
> devices might have been created directly from OF_CLK_DECLARE()-based
> code, but sadly it is called so early that it is not yet possible to
> call any code related to platform bus (it is not yet initialized). The
> good thing that all this is hidden inside this driver and there are no
> external hacks needed elsewhere (like in DT) to get it working.

Thanks for explanation - indeed it would be nice to see it somewhere
in the code. Also as you pointed, it is nice that everything is
driver-contained.

Best regards,
Krzysztof
