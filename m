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
In-Reply-To: <20160629134209.GE6095@lukather>
References: <20160628101325.2522-1-icenowy@aosc.xyz>
	 <20160628101325.2522-3-icenowy@aosc.xyz>
	 <20160628114640.GE5550@lukather>
	 <60021467122182@web19j.yandex.ru>
	 <20160629121021.GD6095@lukather>
	 <1112501467207099@web30g.yandex.ru> <20160629134209.GE6095@lukather>
Subject: Re: [RFC PATCH 3/5] thermal: Add support for the thermal sensor on A23/33
MIME-Version: 1.0
Message-Id: <1216731467208359@web29g.yandex.ru>
Date: Wed, 29 Jun 2016 21:52:39 +0800
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



29.06.2016, 21:42, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> On Wed, Jun 29, 2016 at 09:31:39PM +0800, Icenowy Zheng wrote:
>>  However, sun8iw3/5 ths is not even a GPADC... It's a specified IP,
>>  only used as an ADC suitable for temperature sensor.
>
> It doesn't matter. It's the same IP, labelled differently.
>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

OK, now I will send only PLL2 driver.
