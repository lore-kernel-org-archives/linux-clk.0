Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:23:48 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: bcm2835: Register the DSI0/DSI1 pixel clocks.
Message-ID: <20170121002348.GN20800@codeaurora.org>
References: <20170117203157.23822-1-eric@anholt.net>
 <20170117203157.23822-2-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170117203157.23822-2-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On 01/18, Eric Anholt wrote:
> The DSI pixel clocks are muxed from clocks generated in the analog phy
> by the DSI driver.  In order to set them as parents, we need to do the
> same name lookup dance on them as we do for our root oscillator.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
