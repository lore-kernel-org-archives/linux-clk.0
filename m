Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC71C04EBF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 12:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 256372084C
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 12:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgfzuMzk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256372084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbeLEM31 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 07:29:27 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37277 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbeLEM30 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Dec 2018 07:29:26 -0500
Received: by mail-wr1-f68.google.com with SMTP id j10so19477000wru.4;
        Wed, 05 Dec 2018 04:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/TMYSTZPBuuo4ETByqm5EjFaP0rXQFOUovmYAAZo4YM=;
        b=XgfzuMzkJcVLYA6lDE7HnTrtdYvqNJ5XHJtYootbYSI1ntn6GlyHFrBLTEOE+zy60b
         raBgAO1HYxZYCJQLRmql3MSlG9/m4gp7sgemTYKxsUp0Xgjgw71JEfuhP/YOk8RIys/w
         3pBKzsitikkb1r4+uAYNgJHQc+gjkdWtvTSlcYCKbPywYOGmpSCxzVhF7C2LR62BuH0O
         wuw9jG8rTVrpp+aV2Gin1OKRa2wYfMFcehFFyuxGYrvlrmUI5eZWFuSx/nTDS5S8h6Vx
         dV6U+xTK67NPe8l/Yi5SyDkhNcne4YB2WYga8LxV/3XBq33s4KzpheuTWu3XqKsOTHVF
         qP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/TMYSTZPBuuo4ETByqm5EjFaP0rXQFOUovmYAAZo4YM=;
        b=pHwYxdtzJCZ72vz30S1BZtG7FCHeAFZPyDT3e9C1Z9REhVEEOhgWktB064bfOe4X+w
         erAGULQ2zK7pK2I3mFQxZ+vdiEIu7Wkjrk5j7tbZhQRKjzVDZD6OlLRTdYRnwpX760U4
         HqP5W4OvTcjzuNekk0sXF8e2x4H6c7yo2immKVvhj0UD+ecDI3gNYasniY1s1thO9akg
         VVdBy8SLF3Ng3rACHwSqmyxTtctgjJzjG9jvjf0YAOZC6XeNbZV+h7aPwmsAiuAKQ/ZZ
         E7cYz3v/p8vjgIHLRE5c2w94C9FAz8q11D8A5dqplkMUgdUTDaHYOLS+NWXInygtqZn1
         Lyhw==
X-Gm-Message-State: AA+aEWZZSpHY4kfj/MfEPCOBQ/GtIt+q9apZmCkDRsK9ESWFMRxOpLMj
        S9XW6f9206lX6eihxOaw299QaHzI
X-Google-Smtp-Source: AFSGD/X/5hR7yMXpsBM1yhHnlbJeZlfcq0KW6SkqWkezmm961X+Nb4a5I0gfO4lgaGKUTv+klr8JdA==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr23693225wrt.227.1544012964450;
        Wed, 05 Dec 2018 04:29:24 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm28570077wrd.46.2018.12.05.04.29.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Dec 2018 04:29:23 -0800 (PST)
Subject: Re: [PATCH] clk: vc5: Add suspend/resume support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
References: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
 <154395675529.88331.12886650536645714742@swboyd.mtv.corp.google.com>
 <4f85447d-07b8-9f4c-ecb2-25d6834e6c5d@gmail.com> <2439179.Yi0TbQOvfy@avalon>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5bd189ca-2bac-58ce-a635-58f515962f82@gmail.com>
Date:   Wed, 5 Dec 2018 13:29:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <2439179.Yi0TbQOvfy@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/05/2018 06:21 AM, Laurent Pinchart wrote:
> Hi Marek,
> 
> On Wednesday, 5 December 2018 01:48:01 EET Marek Vasut wrote:
>> On 12/04/2018 09:52 PM, Stephen Boyd wrote:
>>> Quoting Marek Vasut (2018-12-04 10:27:21)
>>>
>>>> diff --git a/drivers/clk/clk-versaclock5.c
>>>> b/drivers/clk/clk-versaclock5.c
>>>> index decffb3826ec..ac90fb36af1a 100644
>>>> --- a/drivers/clk/clk-versaclock5.c
>>>> +++ b/drivers/clk/clk-versaclock5.c
>>>> @@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
>>>>
>>>>         return 0;
>>>>  
>>>>  }
>>>>
>>>> +#ifdef CONFIG_PM_SLEEP
>>>> +static int vc5_suspend(struct device *dev)
>>>
>>> Please mark as __maybe_unused and drop the #ifdef CONFIG_PM_SLEEP
>>>
>>>> +{
>>>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>>>> +       int ret;
>>>> +
>>>> +       ret = regcache_sync(vc5->regmap);
>>>> +       if (ret != 0) {
>>>> +               dev_err(dev, "Failed to save register map: %d\n", ret);
>>>> +               return ret;
>>>
>>> Do we need to block suspend if we can't save the register map away? Or
>>> can we just throw up our hands and not restore on resume?
>>
>> Some hardware will fail on resume, so I'd say -- yes ?
> 
> But why do you need to sync on suspend in the first place ? What could cause 
> the map to be dirty at this stage, and require syncing before suspend, that 
> couldn't work with the sync be delayed to resume time ?

Possibly a configuration coming from eg. bootloader time , or some other
configuration not done by Linux.

-- 
Best regards,
Marek Vasut
