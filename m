Return-Path: <kevin.smith@elecsyscorp.com>
From: Kevin Smith <kevin.smith@elecsyscorp.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Gregory
 CLEMENT" <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 2/2] clk: mvebu: Move corediv config to mvebu config
Date: Thu, 11 Feb 2016 16:01:03 +0000
Message-ID: <56BCB043.5040909@elecsyscorp.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455147596-16078-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455147596-16078-2-git-send-email-kevin.smith@elecsyscorp.com>
 <20160211091651.765cd91c@free-electrons.com>
In-Reply-To: <20160211091651.765cd91c@free-electrons.com>
Content-Type: text/plain; charset="Windows-1252"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hello Thomas,

On 02/11/2016 02:16 AM, Thomas Petazzoni wrote:
> Kevin,
>
> On Wed, 10 Feb 2016 23:40:26 +0000, Kevin Smith wrote:
>> The corediv clock is not required for all builds, only those that
>> enable peripherals that need it.  Move the corediv config option
>> from the clock driver Kconfig to the mvebu Kconfig and make it
>> conditional.
>>
>> This also enables corediv on Armada 375 and 38X as needed.
>>
>> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>   arch/arm/mach-mvebu/Kconfig | 3 +++
>>   drivers/clk/mvebu/Kconfig   | 1 -
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
>> index 64e3d2c..794e7c5 100644
>> --- a/arch/arm/mach-mvebu/Kconfig
>> +++ b/arch/arm/mach-mvebu/Kconfig
>> @@ -32,6 +32,7 @@ config MACH_ARMADA_370
>>   	select CPU_PJ4B
>>   	select MACH_MVEBU_V7
>>   	select PINCTRL_ARMADA_370
>> +	select MVEBU_CLK_COREDIV if MTD_NAND_PXA3xx
> Thanks for the new iteration. I know the corediv clock is only used for
> the NAND, but I'm wondering if it's really worth doing this "if
> MTD_NAND_PXA3xx.
>
> Thomas
Maybe I misunderstood.  In your previous e-mail you said "building=20
ARMADA_38X_CLK or ARMADA_375_CLK does not require building=20
clk-corediv.c, it only needs common.c.  So maybe instead we should=20
change arch/arm/mach-mvebu/Kconfig to have MACH_ARMADA_xxx select=20
MVEBU_CLK_COREDIV when needed."  I thought you meant only when a=20
peripheral depended on the coreclk.

Should I remove the conditional and just have MACH_ARMADA_XXX always=20
enable MVEBU_CLK_COREDIV for platforms that have it?

Thank you,
Kevin=
