Return-Path: <ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160616004419.GQ28218@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
 <1465381201-11537-2-git-send-email-ricardo.ribalda@gmail.com> <20160616004419.GQ28218@codeaurora.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 20 Jun 2016 15:31:57 +0200
Message-ID: <CAPybu_3=Zm8w16_3jtKZDhoFafUz-tYcnpFJmTHT8riwjpCSpA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: Add new function of_clk_is_provider()
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen

When the device tree is populated or when an overlay is added, all its
nodes have the flag OF_POPULATED set. The flag is enabled recursively
in
of_platform_bus_create->of_platform_device_create_pdata()
So we cannot use that flag to mark what is enabled and what is not.

The other issue that I see is of_clk_mutex. Whatever final
implementation that we decide to do, it should take into consideration
that mutex, otherwise it will not be thread-safe.
of_clk_is_provider() is already taking care of it.

Another advantage of of_clk_is_provider() is that it opens the door to
implement something like:  CLK_OF_DECLARE_EARLY_PLATFORM(probe,remove)
 That allows a driver to implement early clk and platform clk at the
same time and automatically, following a logic similar to what I have
done in fixed-clk.

I will send a v2 with the changes you proposed to fixed-clk

Thanks and best regards!

On Thu, Jun 16, 2016 at 2:44 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/08, Ricardo Ribalda Delgado wrote:
>> of_clk_is_provider() checks if a device_node has already been added to
>> the clk provider list. This can be used to avoid adding the same clock
>> provider twice.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
> While I don't disagree with the concept, I'd like to do this
> outside of the clk framework checking for nodes, because the
> problem doesn't seem clk specific. From digging in the OF
> platform layer I see of_node_test_and_set_flag(OF_POPULATED) may
> be what we should be using. It looks like this can be used to
> make sure that any clk provider nodes aren't populated as
> platform devices when we've initialized them early.
>
> The only problem now is that we have drivers using a hybrid
> approach with of_clk_init(). Sometimes drivers need to get clks
> up early for timers, so they have CLK_OF_DECLARE() in their
> driver, but then they also use a platform driver to handle the
> non-timer related clks. If we mark all nodes as populated in
> of_clk_init() we'll preclude these drivers from working. The
> solution there is to make those drivers specifically clear the
> populated flag in the clk init callback. Or we can automatically
> do that with some new CLK_OF_DECLARE_EARLY() macro that hides
> this clearing from them. Either way, the drivers will need to
> indicate they're using this hybrid style so that we still
> populate platform devices.
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project



-- 
Ricardo Ribalda
