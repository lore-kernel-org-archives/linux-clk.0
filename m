Return-Path: <sudeep.holla@arm.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8173: add timer node
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
References: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
 <1442369095-1094-2-git-send-email-yingjoe.chen@mediatek.com>
 <55FAC570.8040307@arm.com> <1442501816.4784.3.camel@mtksdaap41>
 <55FAE69C.2000906@arm.com> <1443710016.22188.10.camel@mtksdaap41>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 James Liao <jamesjj.liao@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>,
 "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Daniel Kurtz <djkurtz@chromium.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <560D5227.8050600@arm.com>
Date: Thu, 1 Oct 2015 16:32:55 +0100
MIME-Version: 1.0
In-Reply-To: <1443710016.22188.10.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 01/10/15 15:33, Yingjoe Chen wrote:
> On Thu, 2015-09-17 at 17:13 +0100, Sudeep Holla wrote:
>>

[...]

>>
>> I think your are confusing the system counter with arch timers. System
>> counter is always-on, but the arch timers(logic implementing timers
>> comparators) might not be off when the processor is powered down.
>>
>> I think you need this timer and are using it for low power idle states
>> in which case you will use this as a clock event and not clock source.
>> It will be used as a hardware broadcast event source.
>>
>> There's no call to sched_clock_register in mtk_timer.c, so it can't be
>> the sched clock, so you need to fix the commit log.
>
> Hi Sudeep,
>
> Sorry for late reply.
>
> For sched_clock_register, please see
> http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001547.html
> which was accepted in
> https://git.linaro.org/people/daniel.lezcano/linux.git/shortlog/refs/heads/clockevents/4.4
>

The commit message makes no sense to me. The counters should continue to
work as long as they are in always-on domain. Only timers are lost
when you enter deeper idle states. So I agree with using MTK timer as
broadcast timer/eventsource. You still didn't answer what's the need
to use MTK timer as sched clocksource ?

Regards,
Sudeep
