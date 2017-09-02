Return-Path: <sergej@taudac.com>
Subject: Re: [PATCH 0/3] clk: si5351: PLL reset fixes
To: Stephen Boyd <sboyd@codeaurora.org>, sebastian.hesselbarth@gmail.com,
 linux@armlinux.org.uk, jacob@teenage.engineering
Cc: mturquette@baylibre.com, rabeeh@solid-run.com, linux-clk@vger.kernel.org
References: <1502547783-24685-1-git-send-email-sergej@taudac.com>
 <20170901225954.GJ21656@codeaurora.org>
From: Sergej Sawazki <sergej@taudac.com>
Message-ID: <0517b50e-e6f2-5f74-aaf8-ecb5f9954e6a@taudac.com>
Date: Sat, 2 Sep 2017 12:21:54 +0200
MIME-Version: 1.0
In-Reply-To: <20170901225954.GJ21656@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Sebastian, Russell,

I have resent the patches. Could you please share your opinion on these?

Commit 6dc669a22c77ad "clk: si5351: Add PLL soft reset" fixed the phase 
offset in case the clock rate is changed. But, if the clocks are 
disabled and re-enabled again, the phase offset is still unpredictable. 
These patches fix this issue.

Many thanks for you time and effort.
Best regards
Sergej

Am 02.09.2017 um 00:59 schrieb Stephen Boyd:
> On 08/12, Sergej Sawazki wrote:
>> The Si5351 clock generator has up to 8 output clocks and 2 PLLs. In order
>> to get a deterministic phase offset relationship between the output clocks,
>> it is necessary to reset the PLLs is certain scenarios.
>>
>> This patch-set:
>>   * fixes a regression and adds resetting the PLL before enabling the outputs
>>   * adds a dt-property for enabling/disabling the PLL reset
>>   * adds a debug message for PLL reset (it is helpful during debugging,
>>     probably no longer required?)
>>
>> Based on clk-next.
>>
>>
> 
> Please include Russell King on the patches. I'd like Sebastian or
> Russell to review these before merging. For now, I'm going to
> apply the other change from Russell.
> 
