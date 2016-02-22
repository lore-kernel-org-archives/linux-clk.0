Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 09:15:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar
 Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew
 Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Lior Amsalem <alior@marvell.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] clk: mvebu: add AP806 ring clock driver
Message-ID: <20160222091523.59570303@free-electrons.com>
In-Reply-To: <20160222025401.GF15973@rob-hp-laptop>
References: <1455521698-7905-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1455521698-7905-4-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160222025401.GF15973@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Dear Rob Herring,

On Sun, 21 Feb 2016 20:54:01 -0600, Rob Herring wrote:
> On Mon, Feb 15, 2016 at 08:34:58AM +0100, Thomas Petazzoni wrote:
> > This commit adds a new driver to handle the ring clocks found in the
> > AP806 HW block, which is the core block of all Armada 7K and 8K
> > Marvell 64-bits processors. Those ring clocks are derived from the
> > core ring clock handled by the AP806 core clock driver. The ring
> > clocks are used by various peripherals inside the AP806.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  .../clock/mvebu-armada-ap806-ring-clock.txt        | 32 +++++++++++
> 
> Combine this with the other patch. Similar comments as the other one.

What do you mean by "combine"? It certainly doesn't make sense to merge
the two patches: there is one patch per driver, so the DT binding
documentation comes together with the driver it corresponds to.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
