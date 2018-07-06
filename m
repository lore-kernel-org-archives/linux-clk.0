Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <87tvpl4pql.fsf@bootlin.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 Hua Jing <jinghua@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>,
 stable@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Ken Ma <make@marvell.com>,
 Victor Gu <xigu@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
References: <20180619123446.694-1-gregory.clement@bootlin.com>
 <20180619123446.694-2-gregory.clement@bootlin.com>
 <87tvpl4pql.fsf@bootlin.com>
Message-ID: <153092068418.143105.5823916627333449732@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: mvebu: armada-37xx-periph: Fix switching CPU rate from
 300Mhz to 1.2GHz
Date: Fri, 06 Jul 2018 16:44:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Gregory CLEMENT (2018-06-29 07:44:02)
> Hi,
>  =

>  On mar., juin 19 2018, Gregory CLEMENT <gregory.clement@bootlin.com> wro=
te:
> =

> > Switching the CPU from the L2 or L3 frequencies (300 and 200 Mhz
> > respectively) to L0 frequency (1.2 Ghz) requires a significant amount
> > of time to let VDD stabilize to the appropriate voltage. This amount of
> > time is large enough that it cannot be covered by the hardware
> > countdown register. Due to this, the CPU might start operating at L0
> > before the voltage is stabilized, leading to CPU stalls.
> >
> > To work around this problem, we prevent switching directly from the
> > L2/L3 frequencies to the L0 frequency, and instead switch to the L1
> > frequency in-between. The sequence therefore becomes:
> >
> > 1. First switch from L2/L3(200/300MHz) to L1(600MHZ)
> > 2. Sleep 20ms for stabling VDD voltage
> > 3. Then switch from L1(600MHZ) to L0(1200Mhz).
> =

> Do you have any comment on this fix?
> =


Looks good. Is it crashing right now? I can throw it into clk-fixes if
it's fixing pain.
