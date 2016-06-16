Return-Path: <sboyd@codeaurora.org>
Date: Wed, 15 Jun 2016 17:44:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: Add new function of_clk_is_provider()
Message-ID: <20160616004419.GQ28218@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
 <1465381201-11537-2-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465381201-11537-2-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/08, Ricardo Ribalda Delgado wrote:
> of_clk_is_provider() checks if a device_node has already been added to
> the clk provider list. This can be used to avoid adding the same clock
> provider twice.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

While I don't disagree with the concept, I'd like to do this
outside of the clk framework checking for nodes, because the
problem doesn't seem clk specific. From digging in the OF
platform layer I see of_node_test_and_set_flag(OF_POPULATED) may
be what we should be using. It looks like this can be used to
make sure that any clk provider nodes aren't populated as
platform devices when we've initialized them early.

The only problem now is that we have drivers using a hybrid
approach with of_clk_init(). Sometimes drivers need to get clks
up early for timers, so they have CLK_OF_DECLARE() in their
driver, but then they also use a platform driver to handle the
non-timer related clks. If we mark all nodes as populated in
of_clk_init() we'll preclude these drivers from working. The
solution there is to make those drivers specifically clear the
populated flag in the clk init callback. Or we can automatically
do that with some new CLK_OF_DECLARE_EARLY() macro that hides
this clearing from them. Either way, the drivers will need to
indicate they're using this hybrid style so that we still
populate platform devices.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
