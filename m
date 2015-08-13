Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <55CB3CCB.6020607@linaro.org>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
 <CAGS+omAeYhXDpBueG-F_gYBccqeaejN9k5bRKC78aDLfvHfnBA@mail.gmail.com> <55CB3CCB.6020607@linaro.org>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Thu, 13 Aug 2015 12:49:46 +0800
Message-ID: <CAGS+omA7+O+hKqcSjYabLL08T1Va-Ryw=dNB_ZA34++-04dHHg@mail.gmail.com>
Subject: Re: [PATCH 0/5] add GPT timer support for mt8173
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, James Liao <jamesjj.liao@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>,
	Russell King <linux@arm.linux.org.uk>,
	"open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>, srv_heupstream <srv_heupstream@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 12, 2015 at 8:32 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 08/11/2015 05:54 PM, Daniel Kurtz wrote:
>>
>> On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen@mediatek.com>
>> wrote:
>>>
>>> This series add GPT timer support for mt8173. This is based on v4.2-rc1
>>> and Matthias' next branch (for dts parts).
>>>
>>> The first 2 patches comes from 'Add SMP bringup support for mt65xx socs'
>>> series [1]. I decide to move these 2 patches to this series, since it
>>> is more relevent here. They are changed based on Matthias' and Daniel's
>>> comments.
>>>
>>> [1]
>>> http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000714.html
>>>
>>> Daniel Kurtz (1):
>>>    arm64: dts: mt8173: add timer node
>>>
>>> Yingjoe Chen (4):
>>>    clocksource: mediatek: do not enable GPT_CLK_EVT when setup
>>>    clocksource: mediatek: Use GPT as sched clock source
>>>    arm64: mediatek: enable MTK_TIMER
>>>    clk: mediatek: add 13mhz clock for MT8173
>>
>>
>> Was this mediatek clocksource patch set get forgotten again?
>
>
> Yep. Sounds like it felt at the wrong moment.
>
>> All 5 patches have have been reviewed, and I think the ones that need
>> it have been Ack'ed by Matthias and/or Stephen.
>> What is the plan for merging them?
>
>
> So if I am not wrong we have two patches I can take in my tree as a couple
> of fixes (1 and 2), right ?

Yes.
Patches 3 & 5 are for Matthias, and patch 4 is Ack'ed by Stephen Boyd,
so I assume Matthias can pick that one up too.

Matthias, is that correct?
Or does Patch 4 need to go in via a clock maintainer's tree?

-Dan
