Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20238C04EBF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 14:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D66F42064A
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 14:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwjKOBiM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D66F42064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbeLEOYt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 09:24:49 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34922 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbeLEOYs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Dec 2018 09:24:48 -0500
Received: by mail-wm1-f67.google.com with SMTP id c126so13059685wmh.0;
        Wed, 05 Dec 2018 06:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+m6gVRlk/V481BTuAmdjFuPp3sXy2slQvq2QFNDe9XM=;
        b=kwjKOBiMKHz9cpTR0+Ffa92R3vYMlKIWptzu6zN7DyVu/tv/095nA47TnIgeqedBnu
         6sUX8tSJdQzZnP61L4NGZJWy3vZiKh5rFddnzQdenYT5VMlzamKCyTfcUBUptKQQWnM6
         JiVfQgVIxOTLqaLjjvaPE2gvRSpUAjyAq2HyWNexSpYPHkxZsH8QGPFKe461fK6zqJBM
         6qvmzu2Uo2qlrGrwFnu4PmLyI4By8N2oIzHbnb4Uc0mNq1/fUwyO9U2BnUaGRdABGzmh
         yea5QvSR92q8FFz7QxUg4ArzKjs7ea/1uWdDp054wdxxoHfaQKKcA7+aUbc2hjsuWmLG
         Hv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+m6gVRlk/V481BTuAmdjFuPp3sXy2slQvq2QFNDe9XM=;
        b=mSOfoCs0JaZemnsFxGGlrPpgc4hkyiVSn7qWr1LRjfXmMpPYYLrt0cRIsvSIrDgd9Q
         BmKrxLuh4EI1f2t4iMT3Tc19kY0zMOScsQ/UA0MICLC3aCImowgJT+4bI5l7Wt2nD9SW
         PdEhuDHJBKLkDtK2b1Xsmn9F+n7ChFo2PX0ifSkHvEJE67CjBxPkJ288LLQTXYBZcn9q
         sUhw0F9ObNFYPbYfQzuahiOu2vvkQew4rqM1D5aiiEkP31YJDFY49fXzlW6GjoPVaFVP
         9CwVg/p8+DJ9BdoRga46ynCk9UWLrcw1NeI/QNihXv1KoAK6EgzcKjuT6sOT58T+angz
         ttcQ==
X-Gm-Message-State: AA+aEWYh3ru3fcBHT2K7sv4ACAOg9ca6pHZWR9Z4IK2rufc/qNbDgN2C
        avR7Vmxd2zgam0SyRIptbskex8hm
X-Google-Smtp-Source: AFSGD/VVzVt7G00wejMYOp4DTS0oGjz+BMfXedUrgqGn30D1kTtTJQ3yiPDmwsf/IIRb/XYvtpiXLA==
X-Received: by 2002:a7b:c852:: with SMTP id c18mr2662253wml.49.1544019885898;
        Wed, 05 Dec 2018 06:24:45 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id s202sm14128168wme.40.2018.12.05.06.24.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Dec 2018 06:24:45 -0800 (PST)
Subject: Re: [PATCH] clk: vc5: Add suspend/resume support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
References: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
 <2439179.Yi0TbQOvfy@avalon> <5bd189ca-2bac-58ce-a635-58f515962f82@gmail.com>
 <5897969.XemNuYOREI@avalon>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <291644a8-bfe2-1eed-126d-04d34814aa24@gmail.com>
Date:   Wed, 5 Dec 2018 15:21:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <5897969.XemNuYOREI@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/05/2018 02:54 PM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> On Wednesday, 5 December 2018 14:29:22 EET Marek Vasut wrote:
>> On 12/05/2018 06:21 AM, Laurent Pinchart wrote:
>>> On Wednesday, 5 December 2018 01:48:01 EET Marek Vasut wrote:
>>>> On 12/04/2018 09:52 PM, Stephen Boyd wrote:
>>>>> Quoting Marek Vasut (2018-12-04 10:27:21)
>>>>>
>>>>>> diff --git a/drivers/clk/clk-versaclock5.c
>>>>>> b/drivers/clk/clk-versaclock5.c
>>>>>> index decffb3826ec..ac90fb36af1a 100644
>>>>>> --- a/drivers/clk/clk-versaclock5.c
>>>>>> +++ b/drivers/clk/clk-versaclock5.c
>>>>>> @@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
>>>>>>         return 0;
>>>>>>  }
>>>>>>
>>>>>> +#ifdef CONFIG_PM_SLEEP
>>>>>> +static int vc5_suspend(struct device *dev)
>>>>>
>>>>> Please mark as __maybe_unused and drop the #ifdef CONFIG_PM_SLEEP
>>>>>
>>>>>> +{
>>>>>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       ret = regcache_sync(vc5->regmap);
>>>>>> +       if (ret != 0) {
>>>>>> +               dev_err(dev, "Failed to save register map: %d\n", ret);
>>>>>> +               return ret;
>>>>>
>>>>> Do we need to block suspend if we can't save the register map away? Or
>>>>> can we just throw up our hands and not restore on resume?
>>>>
>>>> Some hardware will fail on resume, so I'd say -- yes ?
>>>
>>> But why do you need to sync on suspend in the first place ? What could
>>> cause the map to be dirty at this stage, and require syncing before
>>> suspend, that couldn't work with the sync be delayed to resume time ?
>>
>> Possibly a configuration coming from eg. bootloader time , or some other
>> configuration not done by Linux.
> 
> I still don't get it. As far as I know, regcache_sync() will write the content 
> of the regmap to the hardware, not the other way around. You call it at resume 
> time, so the hardware should be programmed properly, regardless of what the 
> boot loader or the firmware does when resuming.
> 
> Could you please explain why this is needed at suspend time ?

It is not, can be dropped.

-- 
Best regards,
Marek Vasut
