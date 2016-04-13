Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 16:32:49 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason
 Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] clk: mvebu: new driver for Armada AP806 system
 controller
Message-ID: <20160413163249.157e3a77@free-electrons.com>
In-Reply-To: <20160402012731.GE18567@codeaurora.org>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1459070777-18049-4-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160402012731.GE18567@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Fri, 1 Apr 2016 18:27:31 -0700, Stephen Boyd wrote:

> > +#include <linux/kernel.h>
> > +#include <linux/clk.h>
> 
> Is this used?

No, fixed!

> > +#include <linux/clk-provider.h>
> > +#include <linux/io.h>
> 
> Is this used?

Ditto!

> > +static void __init ap806_syscon_clk_init(struct device_node *np)
> 
> Can this be a platform driver instead?

I've moved to a platform driver, and it seems to work fine. Will be in
v5. Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
