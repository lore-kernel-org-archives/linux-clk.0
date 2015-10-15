Return-Path: <k.kozlowski.k@gmail.com>
MIME-Version: 1.0
Sender: k.kozlowski.k@gmail.com
In-Reply-To: <561EA831.2070001@osg.samsung.com>
References: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
	<20151014183831.GH26883@codeaurora.org>
	<561EA831.2070001@osg.samsung.com>
Date: Thu, 15 Oct 2015 11:04:46 +0900
Message-ID: <CAJKOXPeNGiuokN-NeS068bZqpSaJNz9QvaxoSs33855GY3_N_g@mail.gmail.com>
Subject: Re: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>, Luis de Bethencourt <luisbg@osg.samsung.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, Scott Branden <sbranden@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2015-10-15 4:08 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
> Hello Stephen,
>
> On 10/14/2015 08:38 PM, Stephen Boyd wrote:
>> On 10/13, Javier Martinez Canillas wrote:
>>> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
>>> index 1530c9352a76..fc50b6264bed 100644
>>> --- a/drivers/clk/versatile/Kconfig
>>> +++ b/drivers/clk/versatile/Kconfig
>>> @@ -1,6 +1,6 @@
>>>  config COMMON_CLK_VERSATILE
>>>      bool "Clock driver for ARM Reference designs"
>>> -    depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64
>>> +    depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || COMPILE_TEST
>>
>> Have you compiled these drivers on an architecture that doesn't
>> have IOMEM? Perhaps tile or um? I'm all for more build coverage,
>> but it's not always as simple as just sprinkling some
>> COMPILE_TEST around the Kconfigs.
>>
>
> No, I only build tested on arm32 and x86. The 0-day bot haven't reported a
> build error yet and I didn't see any platform dependent code in the drivers.

I see you guys with Luis are adding a lot of COMPILE_TEST. But
building only on these two architectures *is not enough*. Run at least
armv8, PPC and the x86_64. MIPS would be nice as well (I use the
CodeSourcery's MIPS). All of these (ARM64, X86_64, PPC, MIPS) can be
easily installed on typical debian-like Linux distro. Really easily.

By adding this non-tested build coverage you can actually fail some
other architecture's allyesconfig/allmodconfig builds.

Best regards,
Krzysztof
