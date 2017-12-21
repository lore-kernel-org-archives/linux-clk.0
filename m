Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 15:12:42 -0800
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
Subject: Re: [PATCH 2/3] clk: mvebu: armada-37xx-periph: prepare cpu clk to
 be used with DVFS
Message-ID: <20171221231242.GA7997@codeaurora.org>
References: <20171130134029.20751-1-gregory.clement@free-electrons.com>
 <20171130134029.20751-3-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171130134029.20751-3-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/30, Gregory CLEMENT wrote:
> When DVFS will be enabled then the cpu clk will use a different set of
> register at run time. That means that we won't be able to use the common
> callback and need to use our own ones.
> 
> This patch prepares this change by switching on our own set of callbacks
> without modifying the behavior of the clocks.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
