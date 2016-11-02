Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:37:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marcin Wojtas <mw@semihalf.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, mturquette@baylibre.com,
	sebastian.hesselbarth@gmail.com, andrew@lunn.ch,
	jason@lakedaemon.net, thomas.petazzoni@free-electrons.com,
	gregory.clement@free-electrons.com, nadavh@marvell.com,
	alior@marvell.com, tn@semihalf.com, jaz@semihalf.com
Subject: Re: [PATCH v4 1/1] clk: mvebu: migrate CP110 system controller to
 clk_hw API and registration
Message-ID: <20161102003750.GL16026@codeaurora.org>
References: <1474789673-3837-1-git-send-email-mw@semihalf.com>
 <1474789673-3837-2-git-send-email-mw@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474789673-3837-2-git-send-email-mw@semihalf.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/25, Marcin Wojtas wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in Armada
> CP110 system controller driver. This commit introduces new
> API and registration for all clocks in CP110 HW blocks.
> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
