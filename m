Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4027CECAAD5
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 18:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiH2Sum (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiH2Sul (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 14:50:41 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0709631DF1
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 11:50:41 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fy31so17122863ejc.6
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UsH6vMnY8y4Ttu+isOPB3+ny2RRrwbwy+Fk4xe0xGfI=;
        b=TmT0ew7t5e/hIFdUh7DJdVohu61lYVG2q2uj4GPamJ7TCX9iLmLjkz6rZKXEyNwKaM
         biVXEi7r7zrg+s1E9FlSfLyvH5sOJJW2cZmNCbbHOC7iT2M0gnDtCuSWb7pxJtBlX30H
         lKEOLBfQFTe6T8RQQBv+C+cduk0Vll+PKPT0dbtQZAl9qDBlIEIb/1HuTI09LlW+QEMf
         m7q5uYXpi6wJnye4k5R3+DNWBO7NYRnfvJn6xZQVnb4ZPygG7UMTHSvzy5GR+OOP1O86
         EeJ1ZnT5c4e18eoJGXOLtu+UKR8w1pDrss0Xpejx5yhe8J7da+vURHmrknDRCsirStWZ
         pwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UsH6vMnY8y4Ttu+isOPB3+ny2RRrwbwy+Fk4xe0xGfI=;
        b=pCsFLazesVGQVQOIBlHGDheF8YbsanFoCdGH0a7MP6b0FIJjUwbyX6uO7rm4sZRt3U
         SVC+HZqMORH4B5eVoOfi8EyLl7Mj4ASqVx+Ummaq6chpVNToJ8eXKl1krrdqy0T/PdyB
         qL8KmV20F/dFX4V0xWSz7zAwJJ/YUs8GoRO+KLKS3cm0Mm8rhbq8OnUivrjVSXsbDjsJ
         JQZKw/HvmzL7nbOGGKGSjwVeCrwMKLj/VSHHmJFptZ3QgY8xyvgtNCaVxTAoNoyv3dPf
         SFwSyYaXeUIcZjTGRJ1By148CqWpJ3F0qxjRziWc2MtGdoA5XaX5Wa9/Pk4QfkifXmXi
         DY7Q==
X-Gm-Message-State: ACgBeo2uDvlULsZKmumaTHwOT8/YWfiTxfBw+iCEnLa4KJCghzvMQsQa
        QjBjmCF38RN5wF4ypL6v8c4=
X-Google-Smtp-Source: AA6agR5uEzUgvUID6TSoYGZYd6H4sZh0hgxGrmuuPTUhHcGg971+6QsReFBvVZPGiq2Jq003fQalIw==
X-Received: by 2002:a17:907:7678:b0:730:e1ad:b128 with SMTP id kk24-20020a170907767800b00730e1adb128mr15019810ejc.67.1661799039523;
        Mon, 29 Aug 2022 11:50:39 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd96:2400:287c:a714:9c3c:aa54? (dynamic-2a01-0c23-bd96-2400-287c-a714-9c3c-aa54.c23.pool.telefonica.de. [2a01:c23:bd96:2400:287c:a714:9c3c:aa54])
        by smtp.googlemail.com with ESMTPSA id lb26-20020a170907785a00b0073bdf71995dsm4803419ejc.139.2022.08.29.11.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 11:50:38 -0700 (PDT)
Message-ID: <f670d8e7-30a9-387a-156a-9ebeee9f638d@gmail.com>
Date:   Mon, 29 Aug 2022 20:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <22f1d799-a3bb-3d71-a3fd-f6128b205231@gmail.com>
 <1jo7w3tlyo.fsf@starbuckisacylon.baylibre.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1jo7w3tlyo.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29.08.2022 11:52, Jerome Brunet wrote:
> 
> On Sun 14 Aug 2022 at 23:29, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> Currently we loop over meson_parm_read() up to 24mln times.
>> This results in a unpredictable timeout period. In my case
>> it's over 5s on a S905X4-based system. Make the timeout
>> period predictable and set it to 100ms.
>>
>> Whilst we're at it: All callers of this function return -EIO
>> in case of failure, therefore we can return this value directly
>> in the timeout case.
> 
> I'm okay with this change but I'd prefer if one change addressed a
> single topic. Please split this out.
> 
OK, I'll send a v2.

>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/clk/meson/clk-pll.c | 15 ++++++---------
>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index daa025b6d..d70bee331 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -277,17 +277,17 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>>  {
>>  	struct clk_regmap *clk = to_clk_regmap(hw);
>>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>> -	int delay = 24000000;
>> +	int delay = 5000;
>>  
>>  	do {
>> -		/* Is the clock locked now ? */
>> +		/* Is the clock locked now ? Time out after 100ms. */
>>  		if (meson_parm_read(clk->map, &pll->l))
>>  			return 0;
>>  
>> -		delay--;
>> -	} while (delay > 0);
>> +		udelay(20);
>> +	} while (--delay);
>>  
>> -	return -ETIMEDOUT;
>> +	return -EIO;
>>  }
>>  
>>  static int meson_clk_pll_init(struct clk_hw *hw)
>> @@ -350,10 +350,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>  	/* Take the pll out reset */
>>  	meson_parm_write(clk->map, &pll->rst, 0);
>>  
>> -	if (meson_clk_pll_wait_lock(hw))
>> -		return -EIO;
>> -
>> -	return 0;
>> +	return meson_clk_pll_wait_lock(hw);
>>  }
>>  
>>  static void meson_clk_pll_disable(struct clk_hw *hw)
> 

