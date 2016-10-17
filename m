Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Oct 2016 15:30:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: Fix the clock provider
 registration
Message-ID: <20161017223058.GJ8871@codeaurora.org>
References: <20160929142855.30408-1-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160929142855.30408-1-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/29, Gregory CLEMENT wrote:
> While trying using a peripheral clock on a driver, I saw that the clock
> pointer returned by the provider was NULL.
> 
> The problem was a missing indirection. It was the pointer stored in the
> hws array which needed to be updated not the value it contains.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
