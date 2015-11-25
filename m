Return-Path: <sboyd@codeaurora.org>
Date: Wed, 25 Nov 2015 11:21:14 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Mike Turquette <mturquette@linaro.org>,
	Chao Xie <chao.xie@marvell.com>
Subject: Re: [PATCH 1/7] clk: mmp: stop using platform headers
Message-ID: <20151125192114.GB11298@codeaurora.org>
References: <1448465875-435039-1-git-send-email-arnd@arndb.de>
 <1448465875-435039-2-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448465875-435039-2-git-send-email-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 11/25, Arnd Bergmann wrote:
> diff --git a/drivers/clk/mmp/clk-mmp2.c b/drivers/clk/mmp/clk-mmp2.c
> index 09d2832fbd78..38931dbd1eff 100644
> --- a/drivers/clk/mmp/clk-mmp2.c
> +++ b/drivers/clk/mmp/clk-mmp2.c
> @@ -9,6 +9,7 @@
>   * warranty of any kind, whether express or implied.
>   */
>  
> +#include <linux/clk.h>

Why are we adding this include? I don't see any clk consumer API
usage being added.

>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/clk/mmp/clk-pxa168.c b/drivers/clk/mmp/clk-pxa168.c
> index 93e967c0f972..0dd83fb950c9 100644
> --- a/drivers/clk/mmp/clk-pxa168.c
> +++ b/drivers/clk/mmp/clk-pxa168.c
> @@ -9,6 +9,7 @@
>   * warranty of any kind, whether express or implied.
>   */
>  
> +#include <linux/clk.h>

Ditto.

> diff --git a/drivers/clk/mmp/clk-pxa910.c b/drivers/clk/mmp/clk-pxa910.c
> index 993abcdb32cc..e1d2ce22cdf1 100644
> --- a/drivers/clk/mmp/clk-pxa910.c
> +++ b/drivers/clk/mmp/clk-pxa910.c
> @@ -9,6 +9,7 @@
>   * warranty of any kind, whether express or implied.
>   */
>  
> +#include <linux/clk.h>

Ditto.

>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/spinlock.h>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
