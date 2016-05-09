Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 May 2016 16:03:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/7] clk: rockchip: abstract pll get-params and
 set-params operations
Message-ID: <20160509230328.GA3492@codeaurora.org>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
 <1461849075-8310-5-git-send-email-heiko@sntech.de>
 <20160506225543.GF3492@codeaurora.org>
 <3451726.6PKcY6Rd6y@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3451726.6PKcY6Rd6y@phil>
List-ID: <linux-clk.vger.kernel.org>

On 05/08, Heiko Stuebner wrote:
> 
> I think the "flat design" is what we have right now. The problem is that the 
> core code is pretty similar and only the hardware-specific accesses are 
> special, thus the later indirection.

Right, which is where having some functions that manipulate
register values in a generic way lets us consolidate the common
code into one place while leaving the hardware specific accesses
in the clk ops before or after calling the common functions.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
