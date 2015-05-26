Return-Path: <sudeep.holla@arm.com>
Message-ID: <556471AF.5090002@arm.com>
Date: Tue, 26 May 2015 14:14:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Sudeep Holla <sudeep.holla@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 "Jon Medhurst (Tixy)" <tixy@linaro.org>,
 Mike Turquette <mturquette@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/4] clk: add support for clocks provided by SCP(System
 Control Processor)
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com> <1430134846-24320-3-git-send-email-sudeep.holla@arm.com> <20150520234311.GA31753@codeaurora.org>
In-Reply-To: <20150520234311.GA31753@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 21/05/15 00:43, Stephen Boyd wrote:
> On 04/27, Sudeep Holla wrote:
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 9897f353bf1a..906bf7dd72a2 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -59,6 +59,16 @@ config COMMON_CLK_RK808
>>   	  clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
>>   	  by control register.
>>
>> +config COMMON_CLK_SCPI
>> +        tristate "Clock driver controlled via SCPI interface"
>> +        depends on ARM_SCPI_PROTOCOL
>
> || COMPILE_TEST ?
>

[...]

>
>> +		return -ENOMEM;
>> +	}
>> +
>> +	for (idx = 0; idx < count; idx++) {
>> +		struct scpi_clk *sclk;
> [...]
>> +static int scpi_clk_remove(struct platform_device *pdev)
>> +{
>> +	of_clk_del_provider(pdev->dev.of_node);
>> +	platform_set_drvdata(pdev, NULL);
>
> We don't need to set platform_drvdata to NULL here.
>

Thanks for the review. I have posted v2 of this series and some of the
comments are not applicable(already done or code removed). I have
fixed all the remaining comments locally for v3.

Regards,
Sudeep
