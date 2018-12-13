Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F91C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 16:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F23D920851
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 16:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU+Mot8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23D920851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbeLMQqH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 11:46:07 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42775 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729021AbeLMQqG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 11:46:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id q18so2706147wrx.9;
        Thu, 13 Dec 2018 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IDuOQAKWc2hSXR3ae1rDE3cg8G3Tm4Isy24SAo7xkRc=;
        b=eU+Mot8JXmLbmXTfCFGrb3vlqD3Akeh4DqN5o9XmByLhgodlIVUAUbw2suVxpJqdGV
         T4mcmq8wuw41u8kxiv2tYi6QglYB7jhqAdwQnpCSnU/mrmRq5bBAYfmI4Ad3TuPDkoqr
         jwmgiBwT6tawrXo03mWuyK2Ok2sEdnTaqH2qud5M2+3gAfg0fsSAQgew+NXecmYhj95B
         jaZ+rkEEjbtSbBl6044k0sRonMj+5+UMqKKfnhnwMochGGZMU/NWdQf1ybbZkoleeohx
         vkubRRWjdwspnwxBwwhGDvfd3aBBIZs+f5v8zM0LtfcfAZJuzGwworp4Z5pInE6BnR5R
         CepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IDuOQAKWc2hSXR3ae1rDE3cg8G3Tm4Isy24SAo7xkRc=;
        b=JM6m1N9dNRJ0B8sC6jtWnsGuz1gUcfWkLZdUv9+2951dVyoWK/434OOBq9us5XwYMA
         o+fOoPCQ1PFstTtS1+BqAKLdDn21Kvzlelw+9X7yGHSTF5IQkDLJjSmL+y9dI7qIeI/b
         4hhaEAkbdbJyuJbyrhuaXXxYey/aNlRwBfWCPjdv68knWnjJy38gKfOM4SK42TVNxMLY
         nTEEoFgKObq0OIve2rpClqr+jeEeFC0rcFvFihQ9Lw2IecQGQVRqJ7eKYXXiL5jr5Qy7
         tB0TN1VnnPLcdB+ZmbswlYX/ww3zN5WOTHH5lWprQ9DMqbPyiX8sQ/nGl6ffsKMHApia
         0adA==
X-Gm-Message-State: AA+aEWbgdZvMOWNwB9PZO0yZArghM1bJYRr3gBIID70AgenFxa/VOWPQ
        Aj6hCXVWEpswFkEmMt5H6zk=
X-Google-Smtp-Source: AFSGD/XhRTJsK9cgb5F5mhVJ6KrV6O14In3TBDhG4HOFuZht6xkEGkezxe6qRXGUDq0u0dnQKKrGtA==
X-Received: by 2002:adf:a4d9:: with SMTP id h25mr20606707wrb.167.1544719564497;
        Thu, 13 Dec 2018 08:46:04 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y12sm1937830wmi.7.2018.12.13.08.46.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Dec 2018 08:46:03 -0800 (PST)
Subject: Re: [PATCH V2] clk: vc5: Add suspend/resume support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <20181212014130.18634-1-marek.vasut+renesas@gmail.com>
 <1632836.JPXSTA8kTp@avalon> <904df663-92e1-7891-b897-9cd0de1b1521@gmail.com>
 <3136523.fA2jzEL6tu@avalon>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7c418bb0-5ac8-fcfa-4fda-1e33c55b4c46@gmail.com>
Date:   Thu, 13 Dec 2018 17:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3136523.fA2jzEL6tu@avalon>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/13/2018 05:52 AM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> On Thursday, 13 December 2018 04:09:19 EET Marek Vasut wrote:
>> On 12/12/2018 09:43 AM, Laurent Pinchart wrote:
>>> On Wednesday, 12 December 2018 03:41:30 EET Marek Vasut wrote:
>>>> Add simple suspend/resume handlers to the driver to restore the chip
>>>> configuration after resume. It is possible that the chip was configured
>>>> with non-default values before suspend-resume cycle and that the chip
>>>> is powered down during this cycle, so the configuration could get lost.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: Alexey Firago <alexey_firago@mentor.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> V2: Replace ifdef with __maybe_unused
>>>>
>>>>     Simplify return value handling in resume
>>>>
>>>> ---
>>>>
>>>>  drivers/clk/clk-versaclock5.c | 31 +++++++++++++++++++++++++++++++
>>>>  1 file changed, 31 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/clk-versaclock5.c
>>>> b/drivers/clk/clk-versaclock5.c
>>>> index decffb3826ec..b66586a3abb7 100644
>>>> --- a/drivers/clk/clk-versaclock5.c
>>>> +++ b/drivers/clk/clk-versaclock5.c
>>>> @@ -906,6 +906,34 @@ static int vc5_remove(struct i2c_client *client)
>>>>  	return 0;
>>>>  }
>>>>
>>>> +static int __maybe_unused vc5_suspend(struct device *dev)
>>>> +{
>>>> +	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	ret = regcache_sync(vc5->regmap);
>>>
>>> Didn't you say the sync here was unneeded and would be dropped ?
>>>
>>>> +	if (ret != 0) {
>>>> +		dev_err(dev, "Failed to save register map: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>
>> If you have a setup with working DU and VGA on something close to next
>> (it's broken in next), can you try dropping this hunk (basically do
>> ret = 0;//regcache_sync(vc5->regmap); ) and see if the regcache stays
>> consistent ? It should. If so, I'll drop this in V3.
>>
>>>> +	regcache_cache_only(vc5->regmap, true);
>>>> +	regcache_mark_dirty(vc5->regmap);
>>
>> [...]
> 
> Here's my test procedure:
> 
> - Boot the board
> - Dump the VC5 state (into vc5-next+*-1-boot.log)
> - Enable the VGA output with kmstest -c VGA-1

I didn't know this was needed, all right.

> - Dump the VC5 state (into vc5-next+*-2-display-on.log)
> - Suspend and resume
> - Dump the VC5 state (into vc5-next+*-3-post-suspend.log)
> - Stop kmstest
> - Dump the VC5 state (into vc5-next+*-4-display-off.log)
> 
> To dump the VC5 state, I use
> 
> -----------------------------------------------------------------------------
> #!/bin/sh
> 
> echo "-------- i2cdump --------"
> i2cdump -f -y 4 0x6a
> 
> for f in /sys/kernel/debug/regmap/4-006a/* ; do
>         echo "-------- $f --------"
>         cat $f
> done
> -----------------------------------------------------------------------------
> 
> The base kernel version is v4.20-rc6 + the fixes branch from linux media. I've 
> tested the following three configurations, in order:
> 
> next+0 - Base
> next+1 - Base + this patch
> next+2 - Base + this patch + removal of regcache_sync() from vc5_suspend()
> 
> With base, the VGA output would remain off after resume, and running kmstest 
> again wouldn't help. With the other two configurations the problem is fixed 
> and the VGA output is functional.
> 
> Furthermore, there are no differences in the VC5 dumps between next+1 and 
> next+2, neither are there between the boot and display-on dumps between any of 
> the three configurations.
> 
> I've attached the logs to this e-mail.

Thanks for the test, I sent out a V3 without the regcache_sync() .

-- 
Best regards,
Marek Vasut
