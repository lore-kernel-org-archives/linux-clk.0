Return-Path: <paul@crapouillou.net>
Date: Sat, 06 Jan 2018 00:48:25 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 5/6] clocksource: Add a new timer-ingenic driver
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier
	<marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones
	<lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Message-Id: <1515196105.2058.1@smtp.crapouillou.net>
In-Reply-To: 
 <CAL_Jsq+DQnfX29AOJWMtH9ZB7=neOVwiyZggEuwOmazzVQ6MVg@mail.gmail.com>
References: <20171229125942.27305-2-paul@crapouillou.net>
	<20180101143344.2099-1-paul@crapouillou.net>
	<20180101143344.2099-5-paul@crapouillou.net>
	<20180103210840.hsh4kghuxz7btu5f@rob-hp-laptop>
	<1515016576.1642.2@smtp.crapouillou.net>
	<CAL_Jsq+DQnfX29AOJWMtH9ZB7=neOVwiyZggEuwOmazzVQ6MVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Rob,

Le sam. 6 janv. 2018 =E0 0:27, Rob Herring <robh@kernel.org> a =E9crit :
> On Wed, Jan 3, 2018 at 3:56 PM, Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>  Hi,
>>=20
>>  Le mer. 3 janv. 2018 =E0 22:08, Rob Herring <robh@kernel.org> a=20
>> =E9crit :
>>>=20
>>>  On Mon, Jan 01, 2018 at 03:33:43PM +0100, Paul Cercueil wrote:
>>>>=20
>>>>   This driver will use the TCU (Timer Counter Unit) present on the=20
>>>> Ingenic
>>>>   JZ47xx SoCs to provide the kernel with a clocksource and timers.
>>>>=20
>>>>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>   ---
>>>>    .../devicetree/bindings/timer/ingenic,tcu.txt      |  35 +++
>>>=20
>>>=20
>>>  Separate patch please.
>>=20
>>=20
>>  OK.
>>=20
>>=20
>>>>    drivers/clocksource/Kconfig                        |   8 +
>>>>    drivers/clocksource/Makefile                       |   1 +
>>>>    drivers/clocksource/timer-ingenic.c                | 256
>>>>  +++++++++++++++++++++
>>>>    4 files changed, 300 insertions(+)
>>>>    create mode 100644
>>>>  Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>    create mode 100644 drivers/clocksource/timer-ingenic.c
>>>>=20
>>>>    v2: Use SPDX identifier for the license
>>>>=20
>>>>   diff --git=20
>>>> a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>  b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>   new file mode 100644
>>>>   index 000000000000..e4944972ea53
>>>>   --- /dev/null
>>>>   +++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>   @@ -0,0 +1,35 @@
>>>>   +Ingenic JZ47xx SoCs Timer/Counter Unit driver
>>>>   +---------------------------------------------
>>>>   +
>>>>   +Required properties:
>>>>   +
>>>>   +- compatible : should be "ingenic,<socname>-tcu". Valid strings=20
>>>> are:
>>>>   +  * ingenic,jz4740-tcu
>>>>   +  * ingenic,jz4770-tcu
>>>>   +  * ingenic,jz4780-tcu
>>>>   +- interrupt-parent : phandle of the TCU interrupt controller.
>>>>   +- interrupts : Specifies the interrupts the controller is=20
>>>> connected to.
>>>>   +- clocks : List of phandle & clock specifiers for the TCU=20
>>>> clocks.
>>>>   +- clock-names : List of name strings for the TCU clocks.
>>>>   +- ingenic,channels: a list of TCU channels to be used as timers.
>>>=20
>>>=20
>>>  Why is this needed? This looks like you are trying to assign=20
>>> certain
>>>  timers to clocksource and clockevent. A common problem, but one=20
>>> that
>>>  should be decided by describing h/w features. There must be some
>>>  property present or missing to make you decide to use a given=20
>>> channel or
>>>  not.
>>=20
>>=20
>>  Well, it's not easy; some TCU channels will be used as PWM, and=20
>> there's no
>>  way
>>  to know that when the clocksource driver probes. And which ones are=20
>> PWM /
>>  which
>>  ones are not, is board-specific. If you have a better solution=20
>> though, I
>>  take it.
>=20
> Aren't the PWMs connected to something? Describe those in DT and then
> you can find the free ones.
>=20
> Rob

The ingenic PWM driver just creates a PWM chip with 8 channels. Then=20
it's up to
the various clients (backlight, rumble...) to request a channel using=20
the PWM API,
from their own driver node or pdata. Besides you can also request PWM=20
channels
from sysfs... I can't detect all of that...

Paul
=
