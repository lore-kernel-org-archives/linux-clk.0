Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
 <20151014183831.GH26883@codeaurora.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Luis de Bethencourt
 <luisbg@osg.samsung.com>, Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-clk@vger.kernel.org
Message-ID: <561EA831.2070001@osg.samsung.com>
Date: Wed, 14 Oct 2015 21:08:33 +0200
MIME-Version: 1.0
In-Reply-To: <20151014183831.GH26883@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

On 10/14/2015 08:38 PM, Stephen Boyd wrote:
> On 10/13, Javier Martinez Canillas wrote:
>> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
>> index 1530c9352a76..fc50b6264bed 100644
>> --- a/drivers/clk/versatile/Kconfig
>> +++ b/drivers/clk/versatile/Kconfig
>> @@ -1,6 +1,6 @@
>>  config COMMON_CLK_VERSATILE
>>  	bool "Clock driver for ARM Reference designs"
>> -	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64
>> +	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || COMPILE_TEST
> 
> Have you compiled these drivers on an architecture that doesn't
> have IOMEM? Perhaps tile or um? I'm all for more build coverage,
> but it's not always as simple as just sprinkling some
> COMPILE_TEST around the Kconfigs.
>

No, I only build tested on arm32 and x86. The 0-day bot haven't reported a
build error yet and I didn't see any platform dependent code in the drivers.

But you are right that COMPILE_TEST is a little tricky, so maybe is safest
to drop this patch.

Is just that it would be nice to build as much as possible to make sure that
subystemms or kernel wide changes don't introduce regressions since that is
also tricky even when using tools like coccinelle.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
