Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 Jan 2017 16:26:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mvebu: adjust AP806 CPU clock frequencies to
 production chip
Message-ID: <20170110002643.GJ17126@codeaurora.org>
References: <1482408494-7429-1-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482408494-7429-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/22, Thomas Petazzoni wrote:
> This commit adjusts the list of possible "Sample At Reset" values that
> define the CPU clock frequency of the AP806 (part of Marvell Armada
> 7K/8K) to the values that have been validated with the production
> chip. Earlier values were preliminary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
