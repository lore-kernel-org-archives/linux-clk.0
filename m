Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85AFC4646B
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 04:03:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98AA82082F
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 04:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfFZEDX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 00:03:23 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:56580 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfFZEDX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 00:03:23 -0400
Received: (qmail 4984 invoked by uid 5089); 26 Jun 2019 04:03:21 -0000
Received: by simscan 1.2.0 ppid: 4911, pid: 4914, t: 0.0564s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 26 Jun 2019 04:03:20 -0000
Subject: Re: [PATCH 1/1] clk: clk-cdce925: Add regulator support
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
References: <1560484363-77239-1-git-send-email-preid@electromag.com.au>
 <20190625225453.1BDD020665@mail.kernel.org>
 <1bf34693-a4e9-bbdd-9066-ff5dc5c6ce32@electromag.com.au>
 <20190626034638.369CA20659@mail.kernel.org>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <7bc0046c-d66e-a614-5eee-59a1e72de050@electromag.com.au>
Date:   Wed, 26 Jun 2019 12:03:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190626034638.369CA20659@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/06/2019 11:46, Stephen Boyd wrote:
> Quoting Phil Reid (2019-06-25 18:06:29)
>> On 26/06/2019 06:54, Stephen Boyd wrote:
>>> Quoting Phil Reid (2019-06-13 20:52:43)
>>>> +               return PTR_ERR(regulator);
>>>> +
>>>> +       err = regulator_enable(regulator);
>>>
>> G'day Stephen,
>>
>> Thanks for looking at this.
>>> The regulator is never turned off though. Are these regulators really
>>> just always on regulators that don't need to be managed by this driver?
>>>
>> For our system the regulator needs to be enabled before we try talking to the chip.
>> Funny that.
>> Unloading the driver will disable the regulator thru the devm call to
>> cdce925_regulator_disable
> 
> Ok. Is it a regulator that is expected to just always be on though? Or
> does the datasheet for this device indicate that these supplies can be
> turned on and off when the device isn't in use?

Sorry I'm not understanding what your asking.
Should we be using some other method to ensure there is power to this device
before probingHow do I then ensure the dependency to that power supply?

I can't see why that part of the system can't be shut down, provided that inputs
are also isolated correctly when the regulator is disabled etc.
The data sheet says that input can execeed VDD / VDDOUT provide
clamp current ratings are observed.

It is also seems permissible to disable Vddout independently of Vdd (for some variants).

> 
>>
>>> +     return devm_add_action_or_reset(dev, cdce925_regulator_disable,
>>> +                                     regulator);
>>> +}
>>
>> In the future suspend/resume support could be added to power the device down.
>> The system I have doesn't support suspending thou.
>>
>>> Also, is there an update to the DT binding somewhere?
>>>
>> No I didn't update that.
>> It seems a bit adhoc if supply reference are including in the DT docs.
>> I can add something if your happy with the pathc in general.
>>
> 
> Yes, the binding needs an update to list out the supplies. If they're
> not always going to be enabled because they're controlled supplies in
> the design then it makes sense to me to add them to the binding and use
> them from this driver so that things operate properly.
> 
> 
> 


-- 
Regards
Phil Reid
