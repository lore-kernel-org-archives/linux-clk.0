Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA7CC04EBF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 02:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C278120834
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 02:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3tLTJIi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C278120834
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbeLECEj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 21:04:39 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33201 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbeLECEg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 21:04:36 -0500
Received: by mail-wr1-f66.google.com with SMTP id c14so17981638wrr.0;
        Tue, 04 Dec 2018 18:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jR8DTP4hHZJ6nKU38V2I1SbpuOirm5+Asgx9wOCzU2I=;
        b=H3tLTJIiIrkEfRrwdu+kJ2NRIOjIFztl+QZTZs9C6bh4NytrhCSZoZ23hy4V/OJvmw
         +B+WMNlNyqn4UmhjRkFpBe++opb1oozdWfezfNZ7cPSoSAM2WsVz5lRAgHhlXorBDSRd
         5RXyIpKsn8YicjmKVJ3nxj0tcyc/SoBAddC7uZf0j2eIk87o+biV1MW+MFCmxFKmuQqy
         tJcJpere2+MgCWX3hplEYs4F74IYH9VPfmrILavIofuY8+kNISLpEO5J/cIq9Lwd7TF8
         KDeoezg6pAERttZy24k+SGZPG5yCyZzycCsnVMVZZiImnld05Y8mxiWP68fOoM1s1rHg
         nwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jR8DTP4hHZJ6nKU38V2I1SbpuOirm5+Asgx9wOCzU2I=;
        b=kiPMcqE7CEUAEcTNwAd4udozKWBl5IYTEzcJIthIEKbNBYZq33T9jPwd5afeRNIwSQ
         oHHfmyyfid1PVpPCHMRuCFhPRqkSoXCC4vV8iGAmDuhN/+LnEaUFmYLMsphiPCZ5FujP
         XhWrWXm5TLaic08gqoVaNGuMiCbuyI3picvq2KDZO7FpEl1SWj2HldhDWIoQQWAh3UrX
         b9yWWZxUykT5SXok0AmhhbPlQVNbmbxW18W0I7/J6lmARQXfKnPvip3MO244v+0mQ0rr
         oap0Aug7qvxo8l6GutB7smLhN+5ja+fe3uEoqPB3tK8YpKmaZPNNGW/WVKRrSQobjzWQ
         Eb7Q==
X-Gm-Message-State: AA+aEWYPlp1erCUyqc4nhvMVY3liK7Mp3RgZU1UlO50PaiHRCPzo0gYt
        gEO3sv0ICxz4IJQiEZdN9U16aD90
X-Google-Smtp-Source: AFSGD/WTyivT+vggp8XjTonpdDzehs+QslpJeXRYYhWjZv74eK8TL6HQF3dCpuhX45n/JiIhHAGkOw==
X-Received: by 2002:a5d:524b:: with SMTP id p11mr19324721wrv.147.1543975474194;
        Tue, 04 Dec 2018 18:04:34 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id p14sm12844854wrt.37.2018.12.04.18.04.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 18:04:32 -0800 (PST)
Subject: Re: [PATCH] clk: vc5: Add suspend/resume support
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
References: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
 <154395675529.88331.12886650536645714742@swboyd.mtv.corp.google.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4f85447d-07b8-9f4c-ecb2-25d6834e6c5d@gmail.com>
Date:   Wed, 5 Dec 2018 00:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <154395675529.88331.12886650536645714742@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/04/2018 09:52 PM, Stephen Boyd wrote:
> Quoting Marek Vasut (2018-12-04 10:27:21)
>> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
>> index decffb3826ec..ac90fb36af1a 100644
>> --- a/drivers/clk/clk-versaclock5.c
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
>>         return 0;
>>  }
>>  
>> +#ifdef CONFIG_PM_SLEEP
>> +static int vc5_suspend(struct device *dev)
> 
> Please mark as __maybe_unused and drop the #ifdef CONFIG_PM_SLEEP
> 
>> +{
>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = regcache_sync(vc5->regmap);
>> +       if (ret != 0) {
>> +               dev_err(dev, "Failed to save register map: %d\n", ret);
>> +               return ret;
> 
> Do we need to block suspend if we can't save the register map away? Or
> can we just throw up our hands and not restore on resume?

Some hardware will fail on resume, so I'd say -- yes ?

The rest is fixed.

>> +       }
>> +       regcache_cache_only(vc5->regmap, true);
>> +       regcache_mark_dirty(vc5->regmap);
>> +
>> +       return 0;
>> +}
>> +
>> +static int vc5_resume(struct device *dev)
>> +{
>> +       struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       regcache_cache_only(vc5->regmap, false);
>> +       ret = regcache_sync(vc5->regmap);
>> +       if (ret != 0) {
>> +               dev_err(dev, "Failed to restore register map: %d\n", ret);
>> +               return ret;
>> +       }
> 
> Simplify to
> 
> 	if (ret)
> 		dev_err()
> 	retun ret;
> 
>> +
>> +       return 0;
>> +}
>> +#endif
>> +
>>  static const struct vc5_chip_info idt_5p49v5923_info = {
>>         .model = IDT_VC5_5P49V5923,
>>         .clk_fod_cnt = 2,


-- 
Best regards,
Marek Vasut
