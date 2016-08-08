Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
Subject: Re: [PATCH] clk: Hi6220: enable stub clock driver for ARCH_HISI
To: Amit Kucheria <amit.kucheria@verdurent.com>
References: <1470627463-20570-1-git-send-email-leo.yan@linaro.org>
 <CAHLCerN1dwvjT_r7UD2ZFD0Aar8uPg_RkCh_FDSFxNvLKZPqDQ@mail.gmail.com>
 <20160808064241.GA30622@leoy-linaro>
 <CAHLCerObKvK2KZRQFWk2BpjEiRSskwUNs4csMMNRQGmjHF8nhg@mail.gmail.com>
 <5d98a054-c057-81eb-9ee7-789353a093e5@linaro.org>
 <CAHLCerPxpCVZONujNhjgQ-QKkiibKW1xYoFWOO9dGkLSO--hPQ@mail.gmail.com>
Cc: Leo Yan <leo.yan@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Guodong Xu <guodong.xu@linaro.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <a735ec58-7a6c-dccd-e072-a73a76622c9d@linaro.org>
Date: Mon, 8 Aug 2016 21:36:32 +0100
MIME-Version: 1.0
In-Reply-To: <CAHLCerPxpCVZONujNhjgQ-QKkiibKW1xYoFWOO9dGkLSO--hPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 08/08/16 19:02, Amit Kucheria wrote:
>>>>>> This patch is to enable stub clock driver in config for ARCH_HISI.
>>>>>>
>>>>>> Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
>>>>>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>>>>>> ---
>>>>>>  drivers/clk/hisilicon/Kconfig | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/clk/hisilicon/Kconfig
>>>>>> b/drivers/clk/hisilicon/Kconfig
>>>>>> index 3f537a0..9e0a95e 100644
>>>>>> --- a/drivers/clk/hisilicon/Kconfig
>>>>>> +++ b/drivers/clk/hisilicon/Kconfig
>>>>>> @@ -23,5 +23,6 @@ config RESET_HISI
>>>>>>  config STUB_CLK_HI6220
>>>>>>         bool "Hi6220 Stub Clock Driver"
>>>>>>         depends on COMMON_CLK_HI6220 && MAILBOX
>>>>>> +       default ARCH_HISI
>>>
>>>
>>> Instead of forcing this up on the entire arch, why not restrict it to
>>> just the cpufreq driver?  ARM_HISI_ACPU_CPUFREQ?
>>
>>
>> I'm struggling to understand the concern here. default doesn't force this
>> option on anything, it just sets the default.
>>
>> Personally I might prefer 'default y' because it is simpler and involves
>> less thinking. However the other drivers in this directory use 'default
>> ARCH_HISI' (i.e. they do not default on for a COMPILE_TEST) so copying their
>> approach is quite reasonable.
>
> No concern actually - on the contrary, this dependency needs to be
> fixed urgently. Just trying to figure out if there is a way to manage
> the dependency chain in one place and including the root config option
> into defconfig.
>
> (Thermal driver) ---- dep ---> (cpufreq driver)  ----- dep --->
> (hi2660 clock stub driver) ---- dep -----> (common hi6220 clock
> driver)

This strikes me as solving a different problem.

The thermal driver is not the only client of cpufreq. We'd *like* a 
system where CPUFREQ_DT will work regardless of whether the thermal 
driver is enabled. That can only be achieved by setting a default in 
drivers/clk/hisilicon/Kconfig .

In other words I don't think your and Leo's patches are in conflict.


> My earlier patch focused on enabling the stub driver in the case the
> thermal driver was enabled (and subsequently turning on HISI_THERMAL
> in defconfig). The EAS profiling usecase to prevent thermal-throttling
> from kicking in is a bad default to have in the kernel, IMO - it can
> be easily achieved by just changing the thermal thresholds.
>
> Something like the following, with HISI_THERMAL added to defconfig
> would give a "stable" kernel on Hikey.
>
> diff --git i/drivers/thermal/Kconfig w/drivers/thermal/Kconfig
> index 2d702ca..77597a5 100644
> --- i/drivers/thermal/Kconfig
> +++ w/drivers/thermal/Kconfig
> @@ -177,8 +177,11 @@ config THERMAL_EMULATION
>
>  config HISI_THERMAL
>   tristate "Hisilicon thermal driver"
> -   depends on (ARCH_HISI && CPU_THERMAL && OF) || COMPILE_TEST
> + depends on (ARCH_HISI && OF) || COMPILE_TEST
>   depends on HAS_IOMEM
> + select CPU_THERMAL
> + select CPUFREQ_DT
> + select STUB_CLK_HI6220

I'm actually a little uncomfortable having a thermal sensor dictate what 
cooling devices are used to react to its temperature reading. The link 
between sensors and cooling devices comes from DT.

However I admit there are other platforms (IMX and DB8500) that accept 
the same build time diktat from their thermal sensors.


Daniel.
