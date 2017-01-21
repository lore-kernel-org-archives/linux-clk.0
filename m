Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:23:50 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: bcm2835: Add leaf clock measurement support,
 disabled by default
Message-ID: <20170121002350.GO20800@codeaurora.org>
References: <20170117203157.23822-1-eric@anholt.net>
 <20170117203157.23822-3-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170117203157.23822-3-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On 01/18, Eric Anholt wrote:
> This proved incredibly useful during debugging of the DSI driver, to
> see if our clocks were running at rate we requested.  Let's leave it
> here for the next person interacting with clocks on the platform (and
> so that hopefully we can just hook it up to debugfs some day).
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
