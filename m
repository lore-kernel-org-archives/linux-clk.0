Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
 <20151014183831.GH26883@codeaurora.org> <561EA831.2070001@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Luis de Bethencourt
 <luisbg@osg.samsung.com>, Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-clk@vger.kernel.org
Message-ID: <561EAF6F.6080901@osg.samsung.com>
Date: Wed, 14 Oct 2015 21:39:27 +0200
MIME-Version: 1.0
In-Reply-To: <561EA831.2070001@osg.samsung.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 10/14/2015 09:08 PM, Javier Martinez Canillas wrote:
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
>>>  	bool "Clock driver for ARM Reference designs"
>>> -	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64
>>> +	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || COMPILE_TEST
>>
>> Have you compiled these drivers on an architecture that doesn't
>> have IOMEM? Perhaps tile or um? I'm all for more build coverage,
>> but it's not always as simple as just sprinkling some
>> COMPILE_TEST around the Kconfigs.
>>
> 
> No, I only build tested on arm32 and x86. The 0-day bot haven't reported a
> build error yet and I didn't see any platform dependent code in the drivers.
> 

BTW, all clk drivers depends on COMMON_CLK so these won't even be built in
tile or um since that symbol isn't selected there. Or did I misunderstand?

Having said that, I see that enabling COMPILE_TEST will attempt to build
in many archs [0] that I don't have a toolchain to test. So I'm OK if you
drop this patch and sorry for the inconvenience.

[0]:
$ git grep "select COMMON_CLK" arch/ | cut -d '/' -f2 | uniq 
arc
arm
arm64
h8300
microblaze
mips
powerpc
x86
xtensa

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
