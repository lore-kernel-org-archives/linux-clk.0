Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Fri, 12 Feb 2016 08:06:20 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
	geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
	rklein@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v42 0/6] critical clocks and handoff clocks
Message-ID: <20160212080620.GM20693@x1>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, 11 Feb 2016, Michael Turquette wrote:

> This series combines Lee's critical clock patches[0] plus some small
> fixes and changes with a repost of my handoff clock patches[1]. Both
> features are enabled by setting new flags on static clock data within
> clock provider drivers.
> 
> In addition, there is a new function for setting the CLK_IS_CRITICAL
> flag based on the presence of the clock-critical Device Tree property.
> This DT property is not a part of the common-clock binding and must be
> enabled on a per-binding basis (including adding that property to the
> machine-specific binding description). Likewise the new function,
> of_clk_detect_critical() must be called by either the clock provider
> driver's probe or OF_CLK_DECLARE setup function.
> 
> [0] https://lkml.org/lkml/2016/1/18/272
> [1] http://www.gossamer-threads.com/lists/linux/kernel/2234337
> 
> Lee Jones (3):
>   clk: Allow clocks to be marked as CRITICAL
>   clk: WARN_ON about to disable a critical clock
>   clk: Provide OF helper to mark clocks as CRITICAL

One small issue which I've commented on already, but appart from that:

Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>

W00t, finally!  I'm so happy I could kiss you (but I can't due to that
legal injunction you have out on me that says I can't come within 100m
of you). ;)

Let's get this sucker in. :)

> Michael Turquette (3):
>   clk: per-user clk prepare & enable ref counts
>   clk: clk_put WARNs if user has not disabled clk
>   clk: introduce CLK_ENABLE_HAND_OFF flag
> 
>  drivers/clk/clk.c            | 127 +++++++++++++++++++++++++++++++++++++++++--
>  include/linux/clk-provider.h |  12 +++-
>  2 files changed, 134 insertions(+), 5 deletions(-)


-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
