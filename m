Return-Path: <zhoubb@lemote.com>
MIME-Version: 1.0
In-Reply-To: <20170619233434.GQ20170@codeaurora.org>
References: <1497581573-17258-1-git-send-email-zhoubb@lemote.com>
 <1497581573-17258-8-git-send-email-zhoubb@lemote.com> <20170619233434.GQ20170@codeaurora.org>
From: zhoubb <zhoubb@lemote.com>
Date: Tue, 20 Jun 2017 12:51:14 +0800
Message-ID: <CAMpQs4L1_VvWxk_mkbRgvVb3o23m+RdVosgzxFLMRX7fjKa+6w@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] clk: Loongson: Add Loongson-1A clock support
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>,
	John Crispin <john@phrozen.org>, "Steven J . Hill" <Steven.Hill@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Fuxin Zhang <zhangfx@lemote.com>,
	Zhangjin Wu <wuzhangjin@gmail.com>, Kelvin Cheung <keguang.zhang@gmail.com>,
	Yang Ling <gnaygnil@gmail.com>, =?UTF-8?B?6LCi6Ie06YKm?= <Yeking@red54.com>,
	Michael Turquette <mturquette@baylibre.com>, linux-mips@linux-mips.org,
	linux-clk@vger.kernel.org, HuaCai Chen <chenhc@lemote.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 20, 2017 at 7:34 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/16, Binbin Zhou wrote:
>> diff --git a/drivers/clk/loongson1/clk-loongson1a.c b/drivers/clk/loongs=
on1/clk-loongson1a.c
>> new file mode 100644
>> index 0000000..263a82c
>> --- /dev/null
>> +++ b/drivers/clk/loongson1/clk-loongson1a.c
>> @@ -0,0 +1,75 @@
>> +/*
>> + * Copyright (c) 2012-2016 Binbin Zhou <zhoubb@lemote.com>
>> + *
>> + * This program is free software; you can redistribute  it and/or modif=
y it
>> + * under  the terms of  the GNU General  Public License as published by=
 the
>> + * Free Software Foundation;  either version 2 of the  License, or (at =
your
>> + * option) any later version.
>> + */
>> +
>> +#include <linux/clkdev.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/io.h>
>> +#include <linux/err.h>
>> +
>> +#include <loongson1.h>
>> +#include "clk.h"
>> +
>> +#define OSC          (33 * 1000000)
>> +#define DIV_APB              2
>> +
>> +static DEFINE_SPINLOCK(_lock);
>
> I know the other loongson1*.c files also call it "_lock", but
> that's not a very good name for something that may show up in
> lockdep debugging error messages. How about something a bit more
> descriptive, loongson1x_clk_lock?
>
It's a good idea=EF=BC=81
Actually, the variable is not be used in this file.
If I rename it in another new patch will be better.
Do you think so ?

Best wishes!

Binbin Zhou

> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
