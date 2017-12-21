Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 15:12:54 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Antoine Tenart <antoine.tenart@free-electrons.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@free-electrons.com>,
	Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>,
	Hua Jing <jinghua@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>
Subject: Re: [PATCH 3/3] clk: mvebu: armada-37xx-periph: add DVFS support for
 cpu clocks
Message-ID: <20171221231254.GB7997@codeaurora.org>
References: <20171130134029.20751-1-gregory.clement@free-electrons.com>
 <20171130134029.20751-4-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171130134029.20751-4-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/30, Gregory CLEMENT wrote:
> When DVFS is enabled the CPU clock setting is done using an other set of
> registers.
> 
> These Power Management registers are exposed through a syscon as they
> will also be used by other drivers such as the cpufreq.
> 
> This patch add the possibility to modify the CPU frequency using the
> associate load level matching the target frequency. Then all the
> frequency switch is handle by the hardware.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Applied to clk-next + a small fix to regmap getting to make it
shorter.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
