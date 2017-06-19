Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 16:34:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Binbin Zhou <zhoubb@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
	James Hogan <james.hogan@imgtec.com>,
	John Crispin <john@phrozen.org>,
	"Steven J . Hill" <Steven.Hill@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fuxin Zhang <zhangfx@lemote.com>,
	Zhangjin Wu <wuzhangjin@gmail.com>,
	Kelvin Cheung <keguang.zhang@gmail.com>,
	Yang Ling <gnaygnil@gmail.com>,
	=?utf-8?B?6LCi6Ie06YKm?= <Yeking@Red54.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	HuaCai Chen <chenhc@lemote.com>
Subject: Re: [PATCH v7 7/8] clk: Loongson: Add Loongson-1A clock support
Message-ID: <20170619233434.GQ20170@codeaurora.org>
References: <1497581573-17258-1-git-send-email-zhoubb@lemote.com>
 <1497581573-17258-8-git-send-email-zhoubb@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1497581573-17258-8-git-send-email-zhoubb@lemote.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/16, Binbin Zhou wrote:
> diff --git a/drivers/clk/loongson1/clk-loongson1a.c b/drivers/clk/loongson1/clk-loongson1a.c
> new file mode 100644
> index 0000000..263a82c
> --- /dev/null
> +++ b/drivers/clk/loongson1/clk-loongson1a.c
> @@ -0,0 +1,75 @@
> +/*
> + * Copyright (c) 2012-2016 Binbin Zhou <zhoubb@lemote.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/err.h>
> +
> +#include <loongson1.h>
> +#include "clk.h"
> +
> +#define OSC		(33 * 1000000)
> +#define DIV_APB		2
> +
> +static DEFINE_SPINLOCK(_lock);

I know the other loongson1*.c files also call it "_lock", but
that's not a very good name for something that may show up in
lockdep debugging error messages. How about something a bit more
descriptive, loongson1x_clk_lock?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
