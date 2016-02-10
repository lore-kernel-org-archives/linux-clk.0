Return-Path: <kevin.smith@elecsyscorp.com>
From: Kevin Smith <kevin.smith@elecsyscorp.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Gregory
 CLEMENT" <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] clk: mvebu: Require corediv clock for Armada 38x
Date: Wed, 10 Feb 2016 23:38:54 +0000
Message-ID: <56BBCA11.7080804@elecsyscorp.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
 <20160210222821.51cfd91f@free-electrons.com>
In-Reply-To: <20160210222821.51cfd91f@free-electrons.com>
Content-Type: text/plain; charset="Windows-1252"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear Thomas,

On 02/10/2016 03:28 PM, Thomas Petazzoni wrote:
> Dear Kevin Smith,
>
> On Wed, 10 Feb 2016 20:41:13 +0000, Kevin Smith wrote:
>> The corediv clock driver is required for the pxa3xx_nand driver,
>> but is not included in the ARMADA_38X_CLK config.  Add
>> MVEBU_CLK_COREDIV as a dependency of ARMADA_38X_CLK.
>>
>> Without the corediv driver, nand initialization fails with the
>> message:
>>
>> pxa3xx-nand f10d0000.flash: failed to get nand clock
>> pxa3xx-nand f10d0000.flash: alloc nand resource failed
>>
>> With corediv enabled, flash is successfully detected.
>>
>> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>   drivers/clk/mvebu/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
>> index 2769625..1107056 100644
>> --- a/drivers/clk/mvebu/Kconfig
>> +++ b/drivers/clk/mvebu/Kconfig
>> @@ -20,6 +20,7 @@ config ARMADA_375_CLK
>>   config ARMADA_38X_CLK
>>   	bool
>>   	select MVEBU_CLK_COMMON
>> +	select MVEBU_CLK_COREDIV
> Thanks for the patch!
Glad to contribute!

> I believe there are some more issues in this Kconfig file:
>
>   - The ARMADA_XP_CLK option selects MVEBU_CLK_COREDIV but there is no
>     corediv clock on Armada XP.
>
>   - The ARMADA_375_CLK should also select MVEBU_CLK_COREDIV.
I thought this was probably missing from other platforms as well, but=20
only have a board and documentation for a38x, so I couldn't check.

> However, technically speaking, building ARMADA_38X_CLK or
> ARMADA_375_CLK does not require building clk-corediv.c, it only needs
> common.c. So maybe instead we should change arch/arm/mach-mvebu/Kconfig
> to have MACH_ARMADA_xxx select MVEBU_CLK_COREDIV when needed.
I think this is a good idea.  It looks to me like the corediv is only=20
needed for NAND right now.  I will submit a v2 soon with an mvebu=20
compile dependent on NAND.  Let me know what you think of it.

> But maybe I'm being overly pedantic here, and your solution is good
> enough. I don't have a strong opinion on this.
No, I agree this is not ideal.  I think your solution is much cleaner.

Thank you,
Kevin=
