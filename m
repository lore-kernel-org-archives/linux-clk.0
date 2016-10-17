Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Oct 2016 15:35:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: Fix the clock gate flag
Message-ID: <20161017223530.GL8871@codeaurora.org>
References: <20160930083359.14943-1-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160930083359.14943-1-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/30, Gregory CLEMENT wrote:
> For the gate part of the peripheral clock setting the bit disables the
> clock and clearing it enables the clock. This is not the default behavior
> of clk_gate component, so we need to use the CLK_GATE_SET_TO_DISABLE flag.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
