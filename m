Return-Path: <soren.brinkmann@xilinx.com>
Return-Path: soren.brinkmann@xilinx.com
Date: Sun, 17 Jul 2016 09:11:10 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: <linux-clk@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>,
	<devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: zynq: avoid retrieving clock names from DT property
Message-ID: <20160717161110.GY3847@xsjsorenbubuntu>
References: <1468682123-1434-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <1468682123-1434-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On Sun, 2016-07-17 at 00:15:23 +0900, Masahiro Yamada wrote:
> The "clock-output-names" property is useful for generic clock
> providers such as fixed-clock, fixed-factor-clock, etc.
> 
> On the other hand, it should not be used for really SoC-specific
> clock providers like this one.  As you see in "enum zynq_clk" in
> this driver, it is written as if it already knows all the clock
> names.  Besides, this is instantiated only once, so no clock name
> conflict would happen even if the clock names are hard-coded in the
> driver.
> 
> The device tree (arch/arm/boot/dts/zynq-7000.dtsi) will be fixed
> later.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

IIRC, this was the only way to allow circular clock routing. E.g. there
are use-cases that route an FCLK back into the PS to use it as input for
the GEM. With the introduction of deferred probing this might all be
possible now but it would be good to verify that this kind of circular
clock routing still works with this change.

	Sören
