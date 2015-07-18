Return-Path: <paul.gortmaker@gmail.com>
MIME-Version: 1.0
Sender: paul.gortmaker@gmail.com
In-Reply-To: <55A42299.3040809@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
 <1436571223-10959-23-git-send-email-sboyd@codeaurora.org> <55A0C0A6.8060600@samsung.com>
 <55A42299.3040809@codeaurora.org>
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sat, 18 Jul 2015 14:06:39 -0400
Message-ID: <CAP=VYLoaHmFLj32uKq3FZSwwnsP7=W-zip4yLwuvqmvVa3P3ew@mail.gmail.com>
Subject: Re: [PATCH 22/45] clk: samsung: Properly include clk.h and clkdev.h
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 13, 2015 at 4:42 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>

[...]

> I hope to eventually remove the forward declaration of struct clk in
> clk-provider.h too. That will take some more time though. I can leave this
> part out of the patch if you like and add it back when that work is done, it
> doesn't matter to me.

The current version of this patch seems to break at least one of the
linux-next builds:

Bisecting: 0 revisions left to test after this (roughly 0 steps)
[41608067f4b3912d03eeb2ad4f9db8cbe4d969ca] clk: samsung: Properly
include clk.h and clkdev.h
running ./x
#
# configuration written to .config
#
drivers/clk/samsung/clk-s3c2410-dclk.c: In function 's3c24xx_register_clkout':
drivers/clk/samsung/clk-s3c2410-dclk.c:99:2: error: implicit
declaration of function 'kzalloc'
[-Werror=implicit-function-declaration]
drivers/clk/samsung/clk-s3c2410-dclk.c:99:9: warning: assignment makes
pointer from integer without a cast [enabled by default]
drivers/clk/samsung/clk-s3c2410-dclk.c: In function 's3c24xx_dclk_probe':
drivers/clk/samsung/clk-s3c2410-dclk.c:312:2: error: implicit
declaration of function 'clk_register_clkdev'
[-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[2]: *** [drivers/clk/samsung/clk-s3c2410-dclk.o] Error 1
make[1]: *** [drivers/clk/samsung] Error 2
make: *** [drivers/clk/] Error 2
41608067f4b3912d03eeb2ad4f9db8cbe4d969ca is the first bad commit
commit 41608067f4b3912d03eeb2ad4f9db8cbe4d969ca
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Fri Jun 19 15:00:46 2015 -0700

    clk: samsung: Properly include clk.h and clkdev.h

http://kisskb.ellerman.id.au/kisskb/buildresult/12465308/

Paul.
--

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
