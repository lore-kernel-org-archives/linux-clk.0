Return-Path: <tglx@linutronix.de>
Date: Wed, 24 Jun 2015 09:53:30 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Paul Osmialowski <pawelo@king.net.pl>
cc: Andrew Morton <akpm@linux-foundation.org>,
    Anson Huang <b20788@freescale.com>,
    Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
    Bhupesh Sharma <bhupesh.sharma@freescale.com>,
    Daniel Lezcano <daniel.lezcano@linaro.org>,
    Frank Li <Frank.Li@freescale.com>,
    Geert Uytterhoeven <geert+renesas@glider.be>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Guenter Roeck <linux@roeck-us.net>,
    Haojian Zhuang <haojian.zhuang@gmail.com>,
    Ian Campbell <ijc+devicetree@hellion.org.uk>,
    Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>,
    Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>,
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
    Linus Walleij <linus.walleij@linaro.org>,
    Magnus Damm <damm+renesas@opensource.se>,
    Michael Turquette <mturquette@baylibre.com>,
    Nathan Lynch <nathan_lynch@mentor.com>, Nicolas Pitre <nico@linaro.org>,
    Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>,
    Olof Johansson <olof@lixom.net>, Paul Bolle <pebolle@tiscali.nl>,
    Rob Herring <r.herring@freescale.com>, Rob Herring <robh+dt@kernel.org>,
    Russell King <linux@arm.linux.org.uk>,
    Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
    Shawn Guo <shawn.guo@linaro.org>,
    Simon Horman <horms+renesas@verge.net.au>, Stefan Agner <stefan@agner.ch>,
    Stephen Boyd <sboyd@codeaurora.org>,
    Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
    Catalin Marinas <catalin.marinas@arm.com>,
    Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>,
    Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org,
    linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
    linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
    devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
    Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>,
    Dmitry Cherkassov <d_cherkasov@emcraft.com>,
    Alexander Potashev <aspotashev@emcraft.com>
Subject: Re: [PATCH 6/9] arm: twr-k70f120m: clock source drivers for Kinetis
 SoC
In-Reply-To: <1435094387-20146-7-git-send-email-pawelo@king.net.pl>
Message-ID: <alpine.DEB.2.11.1506240947330.4037@nanos>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl> <1435094387-20146-7-git-send-email-pawelo@king.net.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Tue, 23 Jun 2015, Paul Osmialowski wrote:
> +/*
> + * Clock event device set mode function
> + */
> +static void kinetis_clockevent_tmr_set_mode(
> +	enum clock_event_mode mode, struct clock_event_device *clk)
> +{
> +	struct kinetis_clock_event_ddata *pit =
> +		container_of(clk, struct kinetis_clock_event_ddata, evtdev);
> +
> +	switch (mode) {
> +	case CLOCK_EVT_MODE_PERIODIC:
> +		kinetis_pit_enable(pit->base, 1);
> +		break;
> +	case CLOCK_EVT_MODE_ONESHOT:
> +	case CLOCK_EVT_MODE_UNUSED:
> +	case CLOCK_EVT_MODE_SHUTDOWN:
> +	default:
> +		kinetis_pit_enable(pit->base, 0);
> +	}
> +}

Please move to the new set_state_* interfaces. set_mode() is deprecated.

> +static int kinetis_clockevent_tmr_set_next_event(
> +	unsigned long delta, struct clock_event_device *c)
> +{
> +	struct kinetis_clock_event_ddata *pit =
> +		container_of(c, struct kinetis_clock_event_ddata, evtdev);
> +	unsigned long flags;
> +
> +	raw_local_irq_save(flags);

Pointless exercise. This is called with interrupts disabled.

> +	kinetis_pit_init(pit->base, delta);
> +	kinetis_pit_enable(pit->base, 1);
> +	raw_local_irq_restore(flags);


> +static struct irqaction kinetis_clockevent_irqaction[KINETIS_PIT_CHANNELS] = {
> +	{
> +		.name = "Kinetis Kernel Time Tick (pit0)",

Please use oneword descriptive names not half sentences.

> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[0],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	}, {
> +		.name = "Kinetis Kernel Time Tick (pit1)",
> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[1],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	}, {
> +		.name = "Kinetis Kernel Time Tick (pit2)",
> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[2],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	}, {
> +		.name = "Kinetis Kernel Time Tick (pit3)",
> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[3],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	},

Aside of that. Please use standard request_irq() there is no reason to
use setup_irq here.

> +
> +	setup_irq(irq, &(kinetis_clockevent_irqaction[chan]));

  request_irq(irq, handler, flags, "name", &kinetis_clockevent_tmrs[chan]);

....

Thanks,

	tglx
