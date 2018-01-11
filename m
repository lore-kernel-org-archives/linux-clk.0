Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180110224838.16711-8-paul@crapouillou.net>
References: <20180101143344.2099-1-paul@crapouillou.net> <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-8-paul@crapouillou.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Jan 2018 08:53:22 -0600
Message-ID: <CAL_Jsq+StZS1+qTd9CG1X2_3ay5onMgEmYG9MRUVWs-4K4-EZA@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] clocksource: Add a new timer-ingenic driver
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 10, 2018 at 4:48 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> This driver will use the TCU (Timer Counter Unit) present on the Ingenic
> JZ47xx SoCs to provide the kernel with a clocksource and timers.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/clocksource/Kconfig         |   8 ++
>  drivers/clocksource/Makefile        |   1 +
>  drivers/clocksource/timer-ingenic.c | 258 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 drivers/clocksource/timer-ingenic.c
>
>  v2: Use SPDX identifier for the license
>  v3: - Move documentation to its own patch
>      - Search the devicetree for PWM clients, and use all the TCU
>            channels that won't be used for PWM

[...]

> +static int __init ingenic_tcu_init(struct device_node *np)
> +{
> +       unsigned long available_channels = GENMASK(NUM_CHANNELS - 1, 0);
> +       struct device_node *node;
> +       struct ingenic_tcu *tcu;
> +       unsigned int i, channel;
> +       int err;
> +       u32 val;
> +
> +       for_each_node_with_property(node, "pwms") {
> +               err = of_property_read_u32_index(node, "pwms", 1, &val);

This is the right idea, but a bit fragile. Perhaps its good enough for
your platform, but it would fail if you have another PWM provider like
the gpio-pwm binding or the cell size is not 1 (BTW, I thought the PWM
binding defined 3 cells typically).

Rob
