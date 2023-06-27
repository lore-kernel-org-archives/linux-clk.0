Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFF2EB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jun 2023 05:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjF0FnL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jun 2023 01:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjF0FnJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jun 2023 01:43:09 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C455610FE;
        Mon, 26 Jun 2023 22:43:08 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4008b90d2f9so36485371cf.2;
        Mon, 26 Jun 2023 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687844588; x=1690436588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKo4W7yeVNu1/C75Wi6h0MFNDHB4xFJdmLBXdnRsVKo=;
        b=RyRXq14W4/8lRHOCke/kDWvwcUpR/VkJS8e5oOB4Gl5EswXMKT93tcDlED1l+RLIGc
         ZI+ogkEOu33E2WrqVUrBYGo3s1HHjWNEkrhG4aprg1gPhHgSK/uggsYFZCiqWn0vdvIC
         bbCOuGS4VVDwLDexyZO2Jddxwh3u5eB04ixQqkSiOlUyS3FE/ws0OQX9QMH9hMznYcSD
         n+muYefqFKOTgGuTZmVpfVgC6/1XIiaAtUh4bcRy3VXYD00LSAQDXwlheSDYN6CADP2F
         eYnjpom+0IbA9ruXfgfMgcTtrVKSOfciyEJqy2apGSjPYkfxh5YeEDIuzRdxdmhhb0L/
         frig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687844588; x=1690436588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKo4W7yeVNu1/C75Wi6h0MFNDHB4xFJdmLBXdnRsVKo=;
        b=HFUQqlawlODkKQnUSHx0VrkNV8IsvfC0EK1HboSvOLGLv6sNI74tiy9eqn8vGys8uo
         WKoE3jFwCGWlBE86eUaN/0wKrAWhFwut93NQa4m5hXvWAEv9G00JkJX19SlzqhfyiRiu
         6t/CZY3SDkQ0yY0QUvn2eSoDjfvWfpyyvyAfOxlQIcHIWAkMGZQJe2w8i+TMfYx//AIe
         857bS16cdReWhYdEiuAbsKVuhe8TbRhwZDQvSrj8HNmAVvAAke7CZhhqQBMdg5deuDiF
         hma6avYLIRrGm5veXBUrDkyLxIcHAKKWq4ZygDniCWqa0ZQv4Y0LBRqBWJjU1NVopUQk
         dcfg==
X-Gm-Message-State: AC+VfDyXyMUSKQtsCaF50zqZRKe08ME8kztFh4jDvICy/SMM3LQqZdJP
        YbcuYhjuxvTUg6dzE6Ds8MM=
X-Google-Smtp-Source: ACHHUZ5avhtwTCxoBLwAvnHkv2/ud6DupY9bk0Y8ddk25e+Brsx8E//Abj/lVUnxyL/g2ex0hIiGcg==
X-Received: by 2002:a05:622a:4cc:b0:3fd:e9cc:79d1 with SMTP id q12-20020a05622a04cc00b003fde9cc79d1mr29922201qtx.56.1687844587776;
        Mon, 26 Jun 2023 22:43:07 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id j3-20020a635943000000b00553b546a638sm4932709pgm.67.2023.06.26.22.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 22:43:07 -0700 (PDT)
Message-ID: <32ae28ae-ef53-092e-6fb4-5f95fc306dde@gmail.com>
Date:   Tue, 27 Jun 2023 13:43:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/3] clk: nuvoton: Use clk_parent_data instead of
 string for parent clock
To:     Stephen Boyd <sboyd@kernel.org>, arnd@arndb.de,
        gregkh@linuxfoundation.org, mturquette@baylibre.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, soc@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, schung@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>
References: <20230622141343.13595-1-ychuang570808@gmail.com>
 <20230622141343.13595-4-ychuang570808@gmail.com>
 <be147a766979642ac518710e6ff99a11.sboyd@kernel.org>
Content-Language: en-US
From:   Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <be147a766979642ac518710e6ff99a11.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2023/6/27 上午 12:09, Stephen Boyd wrote:
> Quoting Jacky Huang (2023-06-22 07:13:43)
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> For the declaration of parent clocks, use struct clk_parent_data instead
>> of a string. Due to the change in the passed arguments, replace the usage
>> of devm_clk_hw_register_mux() with clk_hw_register_mux_parent_data() for
>> all cases.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
>>   drivers/clk/nuvoton/clk-ma35d1.c | 306 ++++++++++++++++++++++---------
>>   1 file changed, 219 insertions(+), 87 deletions(-)
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
>> index 733750dda0f4..f1fe7edd21b5 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
>> @@ -63,167 +63,298 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>>   #define PLL_MODE_SS             2
>>   
>>   static const struct clk_parent_data ca35clk_sel_clks[] = {
>> -       { .index = 0 },  /* HXT */
>> -       { .index = 1 },  /* CAPLL */
>> -       { .index = 2 }   /* DDRPLL */
>> +       { .fw_name = "hxt", },
>> +       { .fw_name = "capll", },
>> +       { .fw_name = "ddrpll", },
> Is there any reason why this changed from numbers to strings? It is
> faster to directly index vs. access the clock-names property. The
> preference is to use the index field and only use fw_name if we're
> migrating legacy clk drivers to use DT based lookups.

This is simply because I think strings are more readable than numbers.
Since using an index is the preferred method, I will change all occurrences
of ".fw_name" to ".index" and add comments to describe it.
As this patch was applied, I will create another patch relative to this one.


Best Regards,
Jacky Huang


