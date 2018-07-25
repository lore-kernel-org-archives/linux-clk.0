Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180713102726.1950-1-gregory.clement@bootlin.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>,
 Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>,
 Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>,
 Ken Ma <make@marvell.com>
References: <20180713102726.1950-1-gregory.clement@bootlin.com>
Message-ID: <153253703023.48062.216865546147364380@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: Fix wrong return value in
 get_parent
Date: Wed, 25 Jul 2018 09:43:50 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Gregory CLEMENT (2018-07-13 03:27:26)
> The return value of the get_parent operation is a u8, whereas a -EINVAL
> was returned. This wrong value was return if the value was bigger that
> the number of parent but this case was already handled by the core.
> =

> So we can just remove this chunk of code to fix the issue.
> =

> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 9818a7a4fd10 ("clk: mvebu: armada-37xx-periph: prepare cpu clk to
> be used with DVFS")
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Applied to clk-next

This is actually a good point I've never considered. We should go fix
all the drivers that return a negative value to return a number that's
greater than the number of clks that are the parents and then we can
still get 'errors' from this clk_op.
