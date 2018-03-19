Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180228140751.10819-1-gregory.clement@bootlin.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>,
 Omri Itach <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 Igal Liberman <igall@marvell.com>, Marcin Wojtas <mw@semihalf.com>
References: <20180228140751.10819-1-gregory.clement@bootlin.com>
Message-ID: <152149032034.242365.10971731653439256704@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: mvebu: cp110: Fix clock tree representation
Date: Mon, 19 Mar 2018 13:12:00 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Gregory CLEMENT (2018-02-28 06:07:51)
> Thanks to new documentation, we have a better view of the clock tree.
> There were few mistakes in the first version of this driver, the main one
> being the parental link between the clocks. Actually the tree is more
> flat that we though. Most of the IP blocks require two clocks: one for
> the IP itself and one for accessing the registers, and unlike what we
> wrote there is no link between these two clocks.
> =

> The other mistakes were about the name of the clocks: the root clock is
> not the Audio PLL but the PLL0, and what we called the EIP clock is named
> the x2 Core clock and is used by other IP block than the EIP ones.
> =

> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Applied to clk-next
