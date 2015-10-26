Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH] clk: versatile: Make depend on OF when COMPILE_TEST
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1445812888-8170-1-git-send-email-javier@osg.samsung.com>
 <20151026185142.GF19782@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, Michael Turquette
 <mturquette@baylibre.com>, Scott Branden <sbranden@broadcom.com>,
 linux-clk@vger.kernel.org
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <562EA365.5080704@osg.samsung.com>
Date: Tue, 27 Oct 2015 07:04:21 +0900
MIME-Version: 1.0
In-Reply-To: <20151026185142.GF19782@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

On 10/27/2015 03:51 AM, Stephen Boyd wrote:
> On 10/26, Javier Martinez Canillas wrote:
>> Commit 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is
>> enabled") allowed clk drives to be compile tested on other archs but
> 
> s/drives/drivers/
> 
>> the COMMON_CLK_VERSATILE was only enabled on platforms that already
>> selected OF support so the drivers assume it will always be enabled.
>>
>> So, restrict compile test for these drivers only if OF is enabled.
> 
> No compiler error message?
> 
>>
>> Fixes: 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is enabled")
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
> 
> No Reported-by?
>

Yes, sorry for forgetting the Reported-by and the build error...
 
> I'd prefer we add stubs instead, so I've applied the patch below.
>

Great, thanks!

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
