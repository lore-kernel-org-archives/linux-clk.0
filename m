Return-Path: <tony@atomide.com>
Date: Fri, 19 May 2017 15:14:46 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv3 2/4] clk: ti: add support for clkctrl clocks
Message-ID: <20170519221445.GJ10472@atomide.com>
References: <1495036209-11298-1-git-send-email-t-kristo@ti.com>
 <1495036209-11298-3-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1495036209-11298-3-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [170517 08:54]:
> Previously, hwmod core has been used for controlling the hwmod level
> clocks directly. This has certain drawbacks, like being unable to share
> the clocks for multiple users, missing usecounting and generally being
> totally incompatible with the common clock framework.
> 
> This patch adds support for clkctrl clocks for addressing the above
> issues. These support the modulemode handling, which will replace the
> direct hwmod clkctrl linkage. Any optional clocks are also supported,
> gate, mux and divider.

Acked-by: Tony Lindgren <tony@atomide.com>
