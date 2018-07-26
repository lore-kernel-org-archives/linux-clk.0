Return-Path: <gustavo@embeddedor.com>
Subject: Re: [PATCH] reset: hisilicon: fix potential NULL pointer dereference
To: Stephen Boyd <sboyd@kernel.org>,
 Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180719015845.GA10768@embeddedor.com>
 <153256235859.48062.6895683993866147909@swboyd.mtv.corp.google.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <0d7972a9-a874-f94f-aafc-7067d561fafb@embeddedor.com>
Date: Wed, 25 Jul 2018 19:25:07 -0500
MIME-Version: 1.0
In-Reply-To: <153256235859.48062.6895683993866147909@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 07/25/2018 06:45 PM, Stephen Boyd wrote:
> Quoting Gustavo A. R. Silva (2018-07-18 18:58:45)
>> There is a potential execution path in which function
>> platform_get_resource() returns NULL. If this happens,
>> we will end up having a NULL pointer dereference.
>>
>> Fix this by adding asanity check in order to avoid a
>> NULL pointer dereference.
>>
>> This code was detected with the help of Coccinelle.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 97b7129cd2af ("reset: hisilicon: change the definition of hisi_reset_init")
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>  drivers/clk/hisilicon/reset.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
>> index 2a5015c..5dfb48b 100644
>> --- a/drivers/clk/hisilicon/reset.c
>> +++ b/drivers/clk/hisilicon/reset.c
>> @@ -109,6 +109,9 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
>>                 return NULL;
>>  
>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (!res)
>> +               return NULL;
>> +
>>         rstc->membase = devm_ioremap(&pdev->dev,
>>                                 res->start, resource_size(res));
> 
> Why can't we use devm_ioremap_resource() here instead?
> 

You're right. I think we can perfectly use devm_ioremap_resource here and remove the null check.

I'll send patch for this shortly.

Thanks
--
Gustavo
