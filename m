Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAOMZO5CuLshhk9R3dJh9RjEG2FphV5Z+sALpb2FitmRkKrFPZA@mail.gmail.com>
Cc: "Stefan Agner" <stefan@agner.ch>, "Dong Aisheng" <aisheng.dong@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <kernel@pengutronix.de>,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "Igor Grinberg" <grinberg@compulab.co.il>,
 "Gary Bisson" <gary.bisson@boundarydevices.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
 "linux-kernel" <linux-kernel@vger.kernel.org>
References: <20160703174813.13970-1-stefan@agner.ch>
 <146785281774.73491.10999943518898018619@resonance>
 <CAOMZO5CuLshhk9R3dJh9RjEG2FphV5Z+sALpb2FitmRkKrFPZA@mail.gmail.com>
Message-ID: <146836168743.73491.12016987181408783347@resonance>
Subject: Re: [PATCH v2] clk: imx7d: do not set parent of ethernet time/ref clocks
Date: Tue, 12 Jul 2016 15:14:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Fabio Estevam (2016-07-11 19:15:54)
> Hi Mike,
> =

> On Wed, Jul 6, 2016 at 9:53 PM, Michael Turquette
> <mturquette@baylibre.com> wrote:
> > Quoting Stefan Agner (2016-07-03 10:48:13)
> >> All device trees currently in mainline specify the time clock parent
> >> using the assigned-clocks/assigned-clock-parents method, there is no
> >> need to statically assign the parent in the core clock driver.
> >> Also all current boards provide an Ethernet reference clock for the
> >> PHY externally, hence configuring the internal PHY reference clock.
> >>
> >> Furthermore, and the actual driver of this patch, specify ethernet
> >> related parents at that early point in boot leads to a warning:
> >> bad: scheduling from the idle thread!
> >>
> >> The reason for the warning is that setting the parent enables the ENET
> >> PLL since we are using CLK_OPS_PARENT_ENABLE. Enabling the ENET PLL can
> >> cause clk_pllv3_wait_lock to sleep. See also:
> >> commit fc8726a2c021 ("clk: core: support clocks which requires parents
> >> enable (part 2)").
> >>
> >> Note that setting the ENET AXI root clock parent also requires ENET
> >> PLL to be enabled. However, U-Boot typically leaves the ENET PLL on,
> >> hence when the framework sets the parent of the first clock, it does
> >> not need to wait for the PLL to come up. But because there is currently
> >> no user of that clock, the PLL gets disabled after setting the parent.
> >> Therefore, subsequent reparenting calls of any clock which somehow rely
> >> on the ENET PLL, need to reenable the ENET PLL which leads to a sleep.
> >> Removing those subsequent reparenting calls works around this issue.
> >>
> >> Also remove comments. The code is really verbose enough.
> >>
> >> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >
> > Applied.
> =

> I still don't see this patch applied in clk-next.

It should show up now on the mirror.

Regards,
Mike
