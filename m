Return-Path: <afaerber@suse.de>
Subject: Re: [PATCH 2/3] clk: owl: add clock driver for Actions S900 SoC
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 rdunlap@infradead.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org,
 liuwei@actions-semi.com
References: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
 <1509479663-8985-3-git-send-email-manivannan.sadhasivam@linaro.org>
 <7c87aee4-dde4-ab3d-06b0-75f3686ab5dd@suse.de>
 <20171104091949.GB14705@linaro.org>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Message-ID: <25a2e233-f565-8baa-17e2-9c867bbbe9d0@suse.de>
Date: Sat, 4 Nov 2017 17:30:36 +0800
MIME-Version: 1.0
In-Reply-To: <20171104091949.GB14705@linaro.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

Am 04.11.2017 um 17:19 schrieb Manivannan Sadhasivam:
>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>> index c99f363..821c1e1 100644
>>> --- a/drivers/clk/Makefile
>>> +++ b/drivers/clk/Makefile
>>> @@ -75,6 +75,7 @@ endif
>>>  obj-y					+= mvebu/
>>>  obj-$(CONFIG_ARCH_MXS)			+= mxs/
>>>  obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
>>> +obj-$(CONFIG_ARCH_ACTIONS)		+= owl/
>>>  obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
>>>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>>>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>>> diff --git a/drivers/clk/owl/Makefile b/drivers/clk/owl/Makefile
>>> new file mode 100644
>>> index 0000000..dbba0af
>>> --- /dev/null
>>> +++ b/drivers/clk/owl/Makefile
>>> @@ -0,0 +1,2 @@
>>> +obj-y				+= clk.o clk-pll.o clk-factor.o
>>> +obj-$(CONFIG_ARCH_ACTIONS)	+= clk-s900.o
>>
>> $(CONFIG_ARCH_ACTIONS) is superfluous here.
>>
> Okay. Since, we haven't added ARCH_ACTIONS to defconfig yet I intentionally
> made this conditional compilation.
> 
> Would like a suggestion from you on this!

My point was that the ../Makefile already uses $(CONFIG_ARCH_ACTIONS),
so $(CONFIG_ARCH_ACTIONS) can never be n here.

Instead you should probably either use $(CONFIG_ARM64) or better some
new Kconfig option (CONFIG_CLK_OWL_S900?), so that we don't
unnecessarily compile S900 on 32-bit arm and S500 on arm64.

Another point: What about S700? Does it need to duplicate clk-s900.c or
can we share any code between the two?

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
