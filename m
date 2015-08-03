Return-Path: <daniel.lezcano@linaro.org>
Return-Path: <daniel.lezcano@linaro.org>
Message-ID: <55BF8F16.2040201@linaro.org>
Date: Mon, 03 Aug 2015 17:56:06 +0200
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
List-ID: <linux-clk.vger.kernel.org>

On 07/11/2015 01:03 AM, Stephen Boyd wrote:
> This file doesn't use the clk provider APIs. Remove the include.
>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>



-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
