Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1523873350.5918.6.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/7] dt-bindings: clock: reset: Add AXG AO Clock and
 Reset Bindings
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>, Carlo
 Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Qiufang Dai <qiufang.dai@amlogic.com>,  linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org
Date: Mon, 16 Apr 2018 12:09:10 +0200
In-Reply-To: <1523872752.2601.26.camel@baylibre.com>
References: <20180409143749.71197-1-yixun.lan@amlogic.com>
	 <20180409143749.71197-5-yixun.lan@amlogic.com>
	 <1523872752.2601.26.camel@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

On Mon, 2018-04-16 at 11:59 +0200, Jerome Brunet wrote:
> On Mon, 2018-04-09 at 22:37 +0800, Yixun Lan wrote:
> > Add dt-bindings headers for the Meson-AXG's AO clock and
> > reset controller.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> > ---
> >  include/dt-bindings/clock/axg-aoclkc.h | 26 ++++++++++++++++++++++++++
> >  include/dt-bindings/reset/axg-aoclkc.h | 20 ++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
> >  create mode 100644 include/dt-bindings/reset/axg-aoclkc.h
> 
> Hi Philipp,
> 
> Is OK if we take this through clock tree ?
> The related reset controller is actually part of a clock controller driver.

Absolutely, this should go in together with the driver.
I see no risk of merge conflicts here.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
