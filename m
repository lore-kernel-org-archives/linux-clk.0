Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH v8 0/6] provide power off support for iMX6 with external
 PMIC
To: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 yibin.gong@nxp.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, "A.s. Dong"
 <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20180726092220.17250-1-o.rempel@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <650c8289-f3a1-8bb1-2e4b-876100f9ae21@i2se.com>
Date: Thu, 26 Jul 2018 11:48:47 +0200
MIME-Version: 1.0
In-Reply-To: <20180726092220.17250-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Oleksij,

Am 26.07.2018 um 11:22 schrieb Oleksij Rempel:
> 2018.07.26:
> v8 is a rebase against kernel v4.18-rc6. No other changes are made.
> Added: linux-imx@nxp.com and yibin.gong@nxp.com to the CC.

your patches won't apply to regulator-next or linux-next because 
"regulator: pfuze100: add pfuze3001 support" has been merged before.

Since the pfuze3001 doesn't support standby, it would be nice to make 
the driver take care of this.

Best regards
Stefan
