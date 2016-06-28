Return-Path: <icenowy@aosc.xyz>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "rui.zhang@intel.com" <rui.zhang@intel.com>,
	"edubezval@gmail.com" <edubezval@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"wens@csie.org" <wens@csie.org>,
	"emilio@elopez.com.ar" <emilio@elopez.com.ar>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
In-Reply-To: <20160628114640.GE5550@lukather>
References: <20160628101325.2522-1-icenowy@aosc.xyz>
	 <20160628101325.2522-3-icenowy@aosc.xyz> <20160628114640.GE5550@lukather>
Subject: Re: [RFC PATCH 3/5] thermal: Add support for the thermal sensor on A23/33
MIME-Version: 1.0
Message-Id: <203181467122590@web5g.yandex.ru>
Date: Tue, 28 Jun 2016 22:03:10 +0800
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



28.06.2016, 19:46, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> Hi,
>
> Thanks for working on this.
>
> On Tue, Jun 28, 2016 at 06:13:23PM +0800, Icenowy Zheng wrote:
>>  This patch adds support for the sun8iw3 thermal sensor on
>>  Allwinner A23/33 SoCs.
>>
>>  Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>
> The IP is awfully similar to the A31's, which already has a driver
> (drivers/input/touchscreen/sun4i-ts.c).
>
> There's no reason to add a new one here.
>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Or... should I split the PLL2 driver into another patch set?
