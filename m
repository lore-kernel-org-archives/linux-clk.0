Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AC0C48BD5
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 01:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56D8D2085A
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 01:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfFZBGd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 21:06:33 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:52087 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfFZBGc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 21:06:32 -0400
Received: (qmail 6858 invoked by uid 5089); 26 Jun 2019 01:06:30 -0000
Received: by simscan 1.2.0 ppid: 6792, pid: 6794, t: 0.0620s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 26 Jun 2019 01:06:30 -0000
Subject: Re: [PATCH 1/1] clk: clk-cdce925: Add regulator support
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
References: <1560484363-77239-1-git-send-email-preid@electromag.com.au>
 <20190625225453.1BDD020665@mail.kernel.org>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <1bf34693-a4e9-bbdd-9066-ff5dc5c6ce32@electromag.com.au>
Date:   Wed, 26 Jun 2019 09:06:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625225453.1BDD020665@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/06/2019 06:54, Stephen Boyd wrote:
> Quoting Phil Reid (2019-06-13 20:52:43)
>> The cdce925 power supplies could be controllable on some platforms.
>> Enable them before communicating with the cdce925.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>> ---
>>
>> Notes:
>>      We see a kernel panic later in the boot if the regulator is not
>>      enabled. Unsure what in the driver is causing that. Something
>>      to do with regmap perhaps?
>>
>>   drivers/clk/clk-cdce925.c | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
>> index a98b3f19..2678ee6 100644
>> --- a/drivers/clk/clk-cdce925.c
>> +++ b/drivers/clk/clk-cdce925.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/module.h>
>>   #include <linux/i2c.h>
>>   #include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <linux/slab.h>
>>   #include <linux/gcd.h>
>>   
>> @@ -602,6 +603,30 @@ static int cdce925_regmap_i2c_read(void *context,
>>          return &data->clk[idx].hw;
>>   }
>>   
>> +static void cdce925_regulator_disable(void *regulator)
>> +{
>> +       regulator_disable(regulator);
>> +}
>> +
>> +static int cdce925_regulator_enable(struct device *dev, const char *name)
>> +{
>> +       struct regulator *regulator;
>> +       int err;
>> +
>> +       regulator = devm_regulator_get(dev, name);
>> +       if (IS_ERR(regulator))
>> +               return PTR_ERR(regulator);
>> +
>> +       err = regulator_enable(regulator);
> 
G'day Stephen,

Thanks for looking at this.
> The regulator is never turned off though. Are these regulators really
> just always on regulators that don't need to be managed by this driver?
> 
For our system the regulator needs to be enabled before we try talking to the chip.
Funny that.
Unloading the driver will disable the regulator thru the devm call to
cdce925_regulator_disable

> +	return devm_add_action_or_reset(dev, cdce925_regulator_disable,
> +					regulator);
> +}

In the future suspend/resume support could be added to power the device down.
The system I have doesn't support suspending thou.

> Also, is there an update to the DT binding somewhere?
> 
No I didn't update that.
It seems a bit adhoc if supply reference are including in the DT docs.
I can add something if your happy with the pathc in general.


-- 
Regards
Phil Reid

