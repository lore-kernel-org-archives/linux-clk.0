Return-Path: <paul@crapouillou.net>
Date: Thu, 11 Jan 2018 17:16:41 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 8/9] clocksource: Add a new timer-ingenic driver
To: Rob Herring <robh+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier
	<marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones
	<lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Message-Id: <1515687401.2170.0@smtp.crapouillou.net>
In-Reply-To: 
 <CAL_Jsq+StZS1+qTd9CG1X2_3ay5onMgEmYG9MRUVWs-4K4-EZA@mail.gmail.com>
References: <20180101143344.2099-1-paul@crapouillou.net>
	<20180110224838.16711-1-paul@crapouillou.net>
	<20180110224838.16711-8-paul@crapouillou.net>
	<CAL_Jsq+StZS1+qTd9CG1X2_3ay5onMgEmYG9MRUVWs-4K4-EZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Rob,

Le jeu. 11 janv. 2018 =E0 15:53, Rob Herring <robh+dt@kernel.org> a=20
=E9crit :
> On Wed, Jan 10, 2018 at 4:48 PM, Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>  This driver will use the TCU (Timer Counter Unit) present on the=20
>> Ingenic
>>  JZ47xx SoCs to provide the kernel with a clocksource and timers.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/clocksource/Kconfig         |   8 ++
>>   drivers/clocksource/Makefile        |   1 +
>>   drivers/clocksource/timer-ingenic.c | 258=20
>> ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 267 insertions(+)
>>   create mode 100644 drivers/clocksource/timer-ingenic.c
>>=20
>>   v2: Use SPDX identifier for the license
>>   v3: - Move documentation to its own patch
>>       - Search the devicetree for PWM clients, and use all the TCU
>>             channels that won't be used for PWM
>=20
> [...]
>=20
>>  +static int __init ingenic_tcu_init(struct device_node *np)
>>  +{
>>  +       unsigned long available_channels =3D GENMASK(NUM_CHANNELS -=20
>> 1, 0);
>>  +       struct device_node *node;
>>  +       struct ingenic_tcu *tcu;
>>  +       unsigned int i, channel;
>>  +       int err;
>>  +       u32 val;
>>  +
>>  +       for_each_node_with_property(node, "pwms") {
>>  +               err =3D of_property_read_u32_index(node, "pwms", 1,=20
>> &val);
>=20
> This is the right idea, but a bit fragile. Perhaps its good enough for
> your platform, but it would fail if you have another PWM provider like
> the gpio-pwm binding or the cell size is not 1 (BTW, I thought the PWM
> binding defined 3 cells typically).

Index 1 is always the channel number of the PWM, it works fine with=20
3-cells
PWM bindings, that's what I tested it with.

Ok, would it be enough to check that "the PWM clients we detect are=20
connected
to the PWM driver whose parent is also our parent" (since both drivers=20
are in
the same syscon/simple-mfd node)?

Thanks,
-Paul
=
