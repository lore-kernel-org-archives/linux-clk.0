Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 23 May 2017 10:23:39 -0500
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Nadav Haklai <nadavh@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>,
	Shadi Ammouri <shadi@marvell.com>
Subject: Re: [PATCH 5/7] clk: mvebu: cp110: add sdio clock to cp-110 system
 controller
Message-ID: <20170523152339.ngjr6djukrrqcvxm@rob-hp-laptop>
References: <cover.737145f06ff0191d1a9210bcd141e679bf45fe5f.1495208533.git-series.gregory.clement@free-electrons.com>
 <1833f47fdfa5fd05e9135d98e03501d9634a865b.1495208533.git-series.gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1833f47fdfa5fd05e9135d98e03501d9634a865b.1495208533.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 19, 2017 at 05:55:23PM +0200, Gregory CLEMENT wrote:
> From: Konstantin Porotchkin <kostap@marvell.com>
> 
> This commit updates the CP110 system controller driver to add the
> definition for a missing clock.
> 
> The SDIO clock is dedicated driving the SDHCI interface and its frequency
> is 400MHz (2/5 of PLL source clock).
> 
> The SDIO interface should be bound to this clock and not the core clock
> as in the older code.
> Using the wrong clock lead to a maximum SDHCI frequency of 250 Mhz, while
> the HW really supports up to 400 Mhz.
> 
> This patch also fixes the NAND clock relationship documentation.
> 
> Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> [gregory.clement@free-electrons.com:
> - use sdio instead of emmc to name the clock
> - update binding documentation]
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt |  1 +
>  drivers/clk/mvebu/cp110-system-controller.c                                | 28 +++++++++++++++++++++++-----
>  2 files changed, 24 insertions(+), 5 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
