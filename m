Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:23:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: bcm2835: Don't rate change PLLs on behalf of
 DSI PLL dividers.
Message-ID: <20170121002344.GM20800@codeaurora.org>
References: <20170117203157.23822-1-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170117203157.23822-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On 01/18, Eric Anholt wrote:
> Our core PLLs are intended to be configured once and left alone.  With
> the SET_RATE_PARENT, asking to set the PLLD_DSI1 clock rate would
> change PLLD just to get closer to the requested DSI clock, thus
> changing PLLD_PER, the UART and ethernet PHY clock rates downstream of
> it, and breaking ethernet.
> 
> We *do* want PLLH to change so that PLLH_AUX can be exactly the value
> we want, though.  Thus, we need to have a per-divider policy of
> whether to pass rate changes up.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
