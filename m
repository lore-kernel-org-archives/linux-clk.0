Return-Path: <sboyd@codeaurora.org>
Message-ID: <556F7FFE.4050102@codeaurora.org>
Date: Wed, 03 Jun 2015 15:30:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Michael Turquette <mturquette@linaro.org>
CC: Mike Looijmans <mike.looijmans@topic.nl>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] Add TI CDCE925 I2C controlled clock synthesizer driver
References: <1433153623-29205-1-git-send-email-mike.looijmans@topic.nl> <1433309119-5186-1-git-send-email-mike.looijmans@topic.nl> <20150603222504.6017.28097@quantum>
In-Reply-To: <20150603222504.6017.28097@quantum>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/03/2015 03:25 PM, Michael Turquette wrote:
> Quoting Mike Looijmans (2015-06-02 22:25:19)
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 9897f35..1c31704 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -78,6 +78,23 @@ config COMMON_CLK_SI570
>>            This driver supports Silicon Labs 570/571/598/599 programmable
>>            clock generators.
>>   
>> +config COMMON_CLK_CDCE925
>> +       tristate "Clock driver for TI CDCE925 devices"
>> +       depends on I2C
>> +       depends on OF
>> +       select REGMAP_I2C
>> +       help
>> +       ---help---

Why two helps?


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
