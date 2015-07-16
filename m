Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55A7908A.2080306@linaro.org>
Date: Thu, 16 Jul 2015 13:07:54 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 4/7] clocksource: cadence_ttc: Remove clk-provider.h include
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org> <1436569409-27964-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-5-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/11/2015 01:03 AM, Stephen Boyd wrote:
> This file doesn't use the clk provider APIs. Remove the include.
>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>
> Please ack if you want this to go through clk-tree, otherwise
> it's ok to take it through the clocksource side.

This patchset touches different parts, so I guess it makes sense I take 
this one through my tree. But if Mike is willing to take it I am ok with 
that.

>   drivers/clocksource/cadence_ttc_timer.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocksource/cadence_ttc_timer.c
> index 510c8a1d37b3..5ea91e3818d0 100644
> --- a/drivers/clocksource/cadence_ttc_timer.c
> +++ b/drivers/clocksource/cadence_ttc_timer.c
> @@ -16,7 +16,6 @@
>    */
>
>   #include <linux/clk.h>
> -#include <linux/clk-provider.h>
>   #include <linux/interrupt.h>
>   #include <linux/clockchips.h>
>   #include <linux/of_address.h>



-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

