Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Paul Osmialowski <pawelo@king.net.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jiri Slaby <jslaby@suse.cz>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Sergei Poselenov <sposelenov@emcraft.com>, Paul Bolle <pebolle@tiscali.nl>, Jingchang Lu <jingchang.lu@freescale.com>, Yuri Tikhonov <yur@emcraft.com>, Rob Herring <r.herring@freescale.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Alexander Potashev <aspotashev@emcraft.com>, Frank Li <Frank.Li@freescale.com>, Thomas Gleixner <tglx@linutronix.de>, Anson Huang <b20788@freescale.com>
Subject: Re: [PATCH v2 4/9] arm: twr-k70f120m: timer driver for Kinetis SoC
Date: Tue, 30 Jun 2015 22:43:52 +0200
Message-ID: <2939807.q7WvOoYzDX@wuerfel>
In-Reply-To: <1435667250-28299-5-git-send-email-pawelo@king.net.pl>
References: <1435667250-28299-1-git-send-email-pawelo@king.net.pl> <1435667250-28299-5-git-send-email-pawelo@king.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Tuesday 30 June 2015 14:27:25 Paul Osmialowski wrote:

> +Example:
> +
> +aliases {
> +	pit0 = &pit0;
> +	pit1 = &pit1;
> +	pit2 = &pit2;
> +	pit3 = &pit3;
> +};
> +
> +pit@40037000 {
> +	compatible = "fsl,kinetis-pit-timer";
> +	reg = <0x40037000 0x100>;
> +	clocks = <&mcg_pclk_gate 5 23>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges;

All the subnodes seem to fall inside of the device's own register
area, so I think it would be nicer to use a specific 'ranges'
property that only translates the registers in question.

>  / {
> +	aliases {
> +		pit0 = &pit0;
> +		pit1 = &pit1;
> +		pit2 = &pit2;
> +		pit3 = &pit3;
> +	};
> +
>  	soc {
> +		pit@40037000 {
> +			compatible = "fsl,kinetis-pit-timer";
> +			reg = <0x40037000 0x100>;
> +			clocks = <&mcg_pclk_gate 5 23>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			pit0: timer@40037100 {
> +				reg = <0x40037100 0x10>;
> +				interrupts = <68>;
> +				status = "disabled";
> +			};

I don't think it's necessary to have both an alias
and a label here. What do you use the alias for?

> +
> +#define KINETIS_PITMCR_PTR(base, reg) \
> +	(&(((struct kinetis_pit_mcr_regs *)(base))->reg))
> +#define KINETIS_PITMCR_RD(be, base, reg) \
> +		((be) ? ioread32be(KINETIS_PITMCR_PTR(base, reg)) \
> +		      : ioread32(KINETIS_PITMCR_PTR(base, reg)))
> +#define KINETIS_PITMCR_WR(be, base, reg, val) do { \
> +		if (be) \
> +			iowrite32be((val), KINETIS_PITMCR_PTR(base, reg)); \
> +		else \
> +			iowrite32((val), KINETIS_PITMCR_PTR(base, reg)); \
> +	} while (0)

These should really be written as inline functions. Can you
explain why you need to deal with a big-endian version of this
hardware? Can you configure the endianess of this register block
and just set it to one of the two at boot time?

> +#define KINETIS_PIT_PTR(base, reg) \
> +	(&(((struct kinetis_pit_channel_regs *)(base))->reg))
> +#define KINETIS_PIT_RD(be, base, reg) \
> +		((be) ? ioread32be(KINETIS_PIT_PTR(base, reg)) \
> +		      : ioread32(KINETIS_PIT_PTR(base, reg)))
> +#define KINETIS_PIT_WR(be, base, reg, val) do { \
> +		if (be) \
> +			iowrite32be((val), KINETIS_PIT_PTR(base, reg)); \
> +		else \
> +			iowrite32((val), KINETIS_PIT_PTR(base, reg)); \
> +	} while (0)
> +#define KINETIS_PIT_SET(be, base, reg, mask) \
> +		KINETIS_PIT_WR(be, base, reg, \
> +			KINETIS_PIT_RD(be, base, reg) | (mask))
> +#define KINETIS_PIT_RESET(be, base, reg, mask) \
> +		KINETIS_PIT_WR(be, base, reg, \
> +			KINETIS_PIT_RD(be, base, reg) & (~(mask)))


Functions again. Also, just pass a pointer to your own data structure
into the function, instead of the 'be' and 'base' values.

The 'set' and 'reset' functions look like they need a spinlock
to avoid races.

	Arnd
