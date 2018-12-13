Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC3CC67872
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 02:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D462F20879
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 02:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QziJEC7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D462F20879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbeLMCJX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 21:09:23 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34500 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbeLMCJX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Dec 2018 21:09:23 -0500
Received: by mail-wr1-f68.google.com with SMTP id j2so386043wrw.1;
        Wed, 12 Dec 2018 18:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nd/6ZssKxnK4ULLDFhvZLpjacOOEKQ7bG+k4ZTFRL4k=;
        b=QziJEC7WTdyvlBL1xlCqcRqKOEc3IfKOoWy4R+OY0Tm7eiP0opmOQeNT0ZFAgqs7Vj
         E19S1IPEyaXPYGU0HUe9S1I9AJ/M5pUyQ0Tryi1CRzxGfbl5uuopSkAQ64bxz0OxA9fe
         tFddMxagMMv6xermd4kR1i2lxKjpt6w9wiJRDPeO3V1BZdrVf6MYjfxf49qe/w8jm+ZU
         m2N7uSFeoQkB9S12Ds0OOYoFXVlGo6Fat0L6+89M9Atb41E8UjtWInynOgRey0zL/4r4
         xuQvxJO7s3A7OsOqSj1OQrFoKYG67EO1Nxx/XrvZtR2HqPgswvWDm/OnD+zDDdkts8O5
         uBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nd/6ZssKxnK4ULLDFhvZLpjacOOEKQ7bG+k4ZTFRL4k=;
        b=rureI6Jsg33p/ZqvxtQZiXUstrDg6U7X/wGt5/ogGMTfWKM6SLWhxiG0rLvFtxoCCw
         iPpY0q+Kp6FQ4+1Ls2+UPubdXPYtKibobaPgqKPUKXnfdKutnt7xprpOWCLGYwDX48lv
         agi5S9LeslP/YV/4CIQOdC+cgr2BgEMi9k1Y5r3X4W4H24zu7xBFxKlVWZuP1eLggBAJ
         I7GZ0Rp57iY0Rn2Ql262gmrE4Kn93wAzKdTALOFFdy42A56K5Iu0teFhLqhXlug6Ib5k
         cIW1KZ/SZ0iRtC47Eyxy7PF6PdecELJeL2GakyN6RG6hjvlY1Dg5DuUUvhJZ0jyzRy+O
         S4kA==
X-Gm-Message-State: AA+aEWZvxv3rKOARK2GT+QJk5yCWvqjWtghyHlz47a1ne0H8lSO+hbWA
        pxCP7JIjaYNJAEX46GL4KIE=
X-Google-Smtp-Source: AFSGD/WZ+Br31dKSazRVRn9Zo6SPb/j8gjB9GdeaHrDwfW8V4z/jR0m8elQHyfml+0D7mYQ9/epcYw==
X-Received: by 2002:adf:a50c:: with SMTP id i12mr18377113wrb.220.1544666960943;
        Wed, 12 Dec 2018 18:09:20 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id s1sm352581wro.9.2018.12.12.18.09.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Dec 2018 18:09:20 -0800 (PST)
Subject: Re: [PATCH V2] clk: vc5: Add suspend/resume support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <20181212014130.18634-1-marek.vasut+renesas@gmail.com>
 <1632836.JPXSTA8kTp@avalon>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <904df663-92e1-7891-b897-9cd0de1b1521@gmail.com>
Date:   Thu, 13 Dec 2018 03:09:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1632836.JPXSTA8kTp@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/12/2018 09:43 AM, Laurent Pinchart wrote:
> Hi Marex,

Hi,

> Thank you for the patch.
> 
> On Wednesday, 12 December 2018 03:41:30 EET Marek Vasut wrote:
>> Add simple suspend/resume handlers to the driver to restore the chip
>> configuration after resume. It is possible that the chip was configured
>> with non-default values before suspend-resume cycle and that the chip
>> is powered down during this cycle, so the configuration could get lost.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Alexey Firago <alexey_firago@mentor.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Replace ifdef with __maybe_unused
>>     Simplify return value handling in resume
>> ---
>>  drivers/clk/clk-versaclock5.c | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
>> index decffb3826ec..b66586a3abb7 100644
>> --- a/drivers/clk/clk-versaclock5.c
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -906,6 +906,34 @@ static int vc5_remove(struct i2c_client *client)
>>  	return 0;
>>  }
>>
>> +static int __maybe_unused vc5_suspend(struct device *dev)
>> +{
>> +	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = regcache_sync(vc5->regmap);
> 
> Didn't you say the sync here was unneeded and would be dropped ?
> 
>> +	if (ret != 0) {
>> +		dev_err(dev, "Failed to save register map: %d\n", ret);
>> +		return ret;
>> +	}

If you have a setup with working DU and VGA on something close to next
(it's broken in next), can you try dropping this hunk (basically do
ret = 0;//regcache_sync(vc5->regmap); ) and see if the regcache stays
consistent ? It should. If so, I'll drop this in V3.

>> +	regcache_cache_only(vc5->regmap, true);
>> +	regcache_mark_dirty(vc5->regmap);
[...]


-- 
Best regards,
Marek Vasut
