Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <153270970080.48062.18399022907046343950@swboyd.mtv.corp.google.com>
Cc: Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, yixun.lan@amlogic.com,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
References: <20180712211244.11428-1-yixun.lan@amlogic.com>
 <20180712211244.11428-3-yixun.lan@amlogic.com>
 <153261840298.48062.2497103873681297587@swboyd.mtv.corp.google.com>
 <f52d2511-bab7-2c39-cea7-8702e27d2ef8@amlogic.com>
 <153270970080.48062.18399022907046343950@swboyd.mtv.corp.google.com>
Message-ID: <153270995155.48062.4302847978258086624@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 2/2] clk: meson: add sub MMC clock controller driver
Date: Fri, 27 Jul 2018 09:45:51 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2018-07-27 09:41:40)
> Quoting Yixun Lan (2018-07-27 07:52:23)
> > HI Stephen:
> > =

> > On 07/26/2018 11:20 PM, Stephen Boyd wrote:
> > > Quoting Yixun Lan (2018-07-12 14:12:44)
> > >> diff --git a/drivers/clk/meson/mmc-clkc.c b/drivers/clk/meson/mmc-cl=
kc.c
> > >> new file mode 100644
> > >> index 000000000000..36c4c7cd69a6
> > >> --- /dev/null
> > >> +++ b/drivers/clk/meson/mmc-clkc.c
> > >> @@ -0,0 +1,367 @@
> > >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > >> +/*
> > >> + * Amlogic Meson MMC Sub Clock Controller Driver
> > >> + *
> > >> + * Copyright (c) 2017 Baylibre SAS.
> > >> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> > >> + *
> > >> + * Copyright (c) 2018 Amlogic, inc.
> > >> + * Author: Yixun Lan <yixun.lan@amlogic.com>
> > >> + */
> > >> +
> > >> +#include <linux/clk.h>
> > > =

> > > Is this include used?
> > > =

> > this is needed by clk_get_rate()
> > see drivers/clk/meson/mmc-clkc.c:204
> =

> Hmm ok. That's unfortunate.

You should be able to read the hardware to figure out the clk frequency?
This may be a sign that the phase clk_ops are bad and should be passing
in the frequency of the parent clk to the op so that phase can be
calculated. Jerome?
