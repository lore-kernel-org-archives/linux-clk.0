Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 18:30:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] clk: Add new function of_clk_is_provider()
Message-ID: <20160621013022.GR1521@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
 <1465381201-11537-2-git-send-email-ricardo.ribalda@gmail.com>
 <20160616004419.GQ28218@codeaurora.org>
 <CAPybu_3=Zm8w16_3jtKZDhoFafUz-tYcnpFJmTHT8riwjpCSpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAPybu_3=Zm8w16_3jtKZDhoFafUz-tYcnpFJmTHT8riwjpCSpA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

(Please don't top post)

On 06/20, Ricardo Ribalda Delgado wrote:
> Hi Stephen
> 
> When the device tree is populated or when an overlay is added, all its
> nodes have the flag OF_POPULATED set. The flag is enabled recursively
> in
> of_platform_bus_create->of_platform_device_create_pdata()
> So we cannot use that flag to mark what is enabled and what is not.

Sorry I don't follow the reasoning here. I'm not asking to test
that flag in an of_clk_is_provider() API. The goal is to not have
an of_clk_is_provider() API.

I was thinking that of_clk_init() would mark any nodes that
matched and provided clk providers as OF_POPULATED. That way,
when of_platform_populate() ran, it would *not* add platform
devices for clk providers that we registered during the
of_clk_init() phase. Then we could have platform drivers and
CLK_OF_DECLARE drivers for the same compatible strings, but we
wouldn't probe random platform drivers for the nodes that we
handled early on and we wouldn't need to litter
of_clk_is_provider() in driver probe routines.

> 
> The other issue that I see is of_clk_mutex. Whatever final
> implementation that we decide to do, it should take into consideration
> that mutex, otherwise it will not be thread-safe.
> of_clk_is_provider() is already taking care of it.
> 
> Another advantage of of_clk_is_provider() is that it opens the door to
> implement something like:  CLK_OF_DECLARE_EARLY_PLATFORM(probe,remove)
>  That allows a driver to implement early clk and platform clk at the
> same time and automatically, following a logic similar to what I have
> done in fixed-clk.

Something like CLK_OF_DECLARE_EARLY_PLATFORM() sounds like it may
be good (I haven't looked at the patch). We'll need something to
say that there's CLK_OF_DECLARE and a platform driver for the
same node.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
