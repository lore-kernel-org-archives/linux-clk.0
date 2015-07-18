Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1436571223-10959-46-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org> <1436571223-10959-46-git-send-email-sboyd@codeaurora.org>
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sat, 18 Jul 2015 14:17:35 -0400
Message-ID: <CAP=VYLrPp1rCncnGkB9CX6+7Fecjwgc0Z2mBSh1FNV65GsUGXg@mail.gmail.com>
Subject: Re: [PATCH 45/45] clk: Remove clk.h from clk-provider.h
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 10, 2015 at 7:33 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> Remove clk.h from clk-provider.h so that we can clearly split clk
> providers from clk consumers. This will allow us to quickly
> detect when clock providers are using the consumer APIs by
> looking at the includes.

At least one build does not like this change:

 running ./x
#
# configuration written to .config
#
drivers/clk/spear/spear3xx_clock.c: In function 'spear320_clk_init':
drivers/clk/spear/spear3xx_clock.c:346:2: error: implicit declaration
of function 'clk_set_parent' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[2]: *** [drivers/clk/spear/spear3xx_clock.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [drivers/clk/spear] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers/clk/] Error 2
3a2c322b68f8137be2f1f5788b13bfb9e0b937c3 is the first bad commit
commit 3a2c322b68f8137be2f1f5788b13bfb9e0b937c3
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Mon Jun 22 17:13:49 2015 -0700

    clk: Remove clk.h from clk-provider.h

http://kisskb.ellerman.id.au/kisskb/buildresult/12465390/

Paul.
--


>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  include/linux/clk-provider.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 78842f46f152..36fa555ff431 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -11,7 +11,6 @@
>  #ifndef __LINUX_CLK_PROVIDER_H
>  #define __LINUX_CLK_PROVIDER_H
>
> -#include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>
> @@ -33,6 +32,7 @@
>  #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
>  #define CLK_RECALC_NEW_RATES   BIT(9) /* recalc rates after notifications */
>
> +struct clk;
>  struct clk_hw;
>  struct clk_core;
>  struct dentry;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
