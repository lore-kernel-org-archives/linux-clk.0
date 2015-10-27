Return-Path: <sboyd@codeaurora.org>
Date: Tue, 27 Oct 2015 16:01:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: common: Add API to register board clocks
 backwards compatibly
Message-ID: <20151027230155.GQ19782@codeaurora.org>
References: <1445908827-31015-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445908827-31015-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/26, Stephen Boyd wrote:
> We want to put the XO board clocks into the dt files. Add an API
> to do this generically. This also makes a place for us to handle
> the case where the RPM driver is enabled or disabled.
> 
> Cc: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> 
> I'm also thinking that maybe we should register the board clock if it
> isn't there in DT and then we'll either register the pass through or
> we'll skip it depending on if the RPM driver is enabled. That
> way the RPM driver doesn't need to know anything, just register the
> clock with parent as the board clock.

That seems like a better idea. v2 coming with that change and a
sleep_clk specific API, plus all the armv7 platforms converted.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
