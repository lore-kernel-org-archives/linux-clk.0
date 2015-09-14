Return-Path: <mark.rutland@arm.com>
Date: Mon, 14 Sep 2015 16:19:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: rockchip: add critical clock for rk3368
Message-ID: <20150914151942.GJ7002@leverpostej>
References: <5267432.TORlj1Iv40@diego>
 <20150914141920.GF7002@leverpostej>
 <6675833.8DAAvDYooL@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <6675833.8DAAvDYooL@diego>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 14, 2015 at 04:06:05PM +0100, Heiko Stübner wrote:
> Am Montag, 14. September 2015, 15:19:21 schrieb Mark Rutland:
> > On Sun, Sep 13, 2015 at 12:20:36PM +0100, Heiko Stübner wrote:
> > > Again a result of the gpio-clock-liberation the rk3368 needs the
> > > pclk_pd_pmu marked as critical, to boot successfully.
> > > 
> > > Reported-by: Mark Rutland <mark.rutland@arm.com>
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > 
> > FWIW: Tested-by: Mark Rutland <mark.rutland@arm.com>
> > 
> > I'm surprised that we don't describe these as critical in the DT, given
> > that this isn't really an internal property of the clock controller, but
> > rather what happens to be attached to it. That ship appears to have
> > sailed, however.
> 
> I wouldn't necessarily think so ... what is called critical only means "don't 
> turn off when walking the clock-tree upwards".
> 
> The pclk_pd_pmu for example simply supplies some more clocks we don't handle 
> at all currently (pclk_pmu_noc, ...). That we currently choose to ignore those 
> [because we don't have any code nor dt-bindings to handle the components 
> supplied] sounds very much like an implementation-specific detail, not 
> something about the hardware.

Sure, but the specific case that lead to this report was the fact that
this clock (directly?) feeds the pinctrl programming interface, and that
fact is neither described in the DT nor handled by the driver. Surely
that should be described and handled?

Thanks,
Mark.
