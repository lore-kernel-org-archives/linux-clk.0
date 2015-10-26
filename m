Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH] clk: versatile: Make depend on OF when COMPILE_TEST
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1445812888-8170-1-git-send-email-javier@osg.samsung.com>
 <CAMuHMdVGjDdJFWQTYgTpYfOTpNf_JhgXWUXLrLoVhhd=5qVEzQ@mail.gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Scott Branden <sbranden@broadcom.com>,
 linux-clk <linux-clk@vger.kernel.org>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <562E3C43.4010507@osg.samsung.com>
Date: Mon, 26 Oct 2015 23:44:19 +0900
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVGjDdJFWQTYgTpYfOTpNf_JhgXWUXLrLoVhhd=5qVEzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hello Geert,

Thanks a lot for your feedback.

On 10/26/2015 06:02 PM, Geert Uytterhoeven wrote:
> On Sun, Oct 25, 2015 at 11:41 PM, Javier Martinez Canillas
> <javier@osg.samsung.com> wrote:
>> Commit 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is
>> enabled") allowed clk drives to be compile tested on other archs but
>> the COMMON_CLK_VERSATILE was only enabled on platforms that already
>> selected OF support so the drivers assume it will always be enabled.
>>
>> So, restrict compile test for these drivers only if OF is enabled.
>>
>> Fixes: 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is enabled")
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>>  drivers/clk/versatile/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
>> index fc50b6264bed..e85863cf145f 100644
>> --- a/drivers/clk/versatile/Kconfig
>> +++ b/drivers/clk/versatile/Kconfig
>> @@ -1,6 +1,6 @@
>>  config COMMON_CLK_VERSATILE
>>         bool "Clock driver for ARM Reference designs"
>> -       depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || COMPILE_TEST
>> +       depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || (COMPILE_TEST && OF)
> 
> I would separate the infrastructure and platform dependencies, like
> 
>         depends on OF
>         depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS
> || ARM64 || COMPILE_TEST
>

You are right, having an explicit dependency is way better than
it implicitly and relying on the arch Kconfig to select it.
 
> But it's of course up to the maintainer to decide.
>

I'll wait to see Stephen and Mike opinion before sending a  v2
but I agree with your suggestion.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
