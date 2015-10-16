Return-Path: <sebastian.hesselbarth@gmail.com>
Return-Path: <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 4/5] clk: berlin: bg2q: remove CLK_IGNORE_UNUSED flag for
 sdio clk
To: Michael Turquette <mturquette@baylibre.com>,
 Jisheng Zhang <jszhang@marvell.com>, ulf.hansson@linaro.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sboyd@codeaurora.org
References: <1444628796-5484-1-git-send-email-jszhang@marvell.com>
 <1444628796-5484-5-git-send-email-jszhang@marvell.com>
 <20151016124705.20687.51712@quantum>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Message-ID: <5620FB32.8030705@gmail.com>
Date: Fri, 16 Oct 2015 15:27:14 +0200
In-Reply-To: <20151016124705.20687.51712@quantum>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 16.10.2015 14:47, Michael Turquette wrote:
> Quoting Jisheng Zhang (2015-10-11 22:46:35)
>> Since we have added the necessary axi clk properties in dts, we can
>> remove the "sdio" clk's CLK_IGNORE_UNUSED flag now.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
>
> Applied to clk-next.

Mike,

these two patches will break Berlin SoCs if not applied
after the sdhci and DT changes went in. Please hold them
back until the discussion has been settled.

Thanks,
   Sebastian

>
>> ---
>>   drivers/clk/berlin/bg2q.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
>> index 221f40c..243f421 100644
>> --- a/drivers/clk/berlin/bg2q.c
>> +++ b/drivers/clk/berlin/bg2q.c
>> @@ -283,7 +283,7 @@ static const struct berlin2_gate_data bg2q_gates[] __initconst = {
>>          { "usb2",       "perif",        13 },
>>          { "usb3",       "perif",        14 },
>>          { "pbridge",    "perif",        15, CLK_IGNORE_UNUSED },
>> -       { "sdio",       "perif",        16, CLK_IGNORE_UNUSED },
>> +       { "sdio",       "perif",        16 },
>>          { "nfc",        "perif",        18 },
>>          { "pcie",       "perif",        22 },
>>   };
>> --
>> 2.6.1
>>
