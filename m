Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01253C77B7A
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 09:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjEQJel (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 05:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjEQJek (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 05:34:40 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2D9273C
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 02:34:37 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f42ba32e24so3565855e9.3
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684316076; x=1686908076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUDDylEUMPQFAPrSz8VZ1I2suyRsN1Zbbv13ypc2rzA=;
        b=XJSg314JjT5M+98dJS+VCddMEi8iYMXpPyn9zkjIGFyADWNkyxp7ryBtkVfS4Cd847
         Lf48mYtXHWxAdR37oqQ0G6DJ2ismYf50up5N7NAFWfNKEyfAdokSiVpsnQLhPGW83h47
         21D6C4OqYuNMollfIfXcv38/Z/u1EvEFleuDbYG2qLucJtxks4ngMKvuJtN8TPhlMxE4
         mhskNVHTzvyf9d7zTcKLksGRRkEsGZC86Qn8Xv+7pDe78i5HKplZFQ62HbZTOry7HJ8i
         nYDa3O6hEeyDtrwmAJO0FQzrGBnlICC2D7pwBW8C0Tb65VoXjz/1/H/502o/UslnVCAv
         p6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316076; x=1686908076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUDDylEUMPQFAPrSz8VZ1I2suyRsN1Zbbv13ypc2rzA=;
        b=FvwMOaIh27j+2kAs/Kf5S8Kg1QpL6QbrTb1kCKSAjnW+rfATPurrgA0gvODg0iElkO
         JSaJlx7slwm0h2hYpQUYfwRhykdBqxfLeGuc1UHK8onMnoGJ+MOn+CAnfTMtnYC3VpSh
         yUq9UZwmxUwgtOZlubXFLZ3YhsCSDDDmJfgCtls4cKTlIThfLAI1kA1QLem2kKc7Wnat
         SoSoihQew6ISK5B4RihU6tP5uuA2S3qoWq3dxQTe9aNbGD/9QZ4g8Q/s3QS7SNZok3OO
         BsOJpHq06CjSS/8UIYCtxcWKHdoS4PeYLq5GTHNZ7IOaoWXN1/HLYzypZR4H58B6uCb8
         +pzg==
X-Gm-Message-State: AC+VfDycsPU1XPaN9WxbBfvWvyQN1Jsf4HZwoC7/l2/pXpCJXc0f4Uns
        cR0H3rJwtFj26n0Dl4pRbU/VNw==
X-Google-Smtp-Source: ACHHUZ4jNgQpFPdP+tvVxA3NtSIP3jJELzRJPLwuGEnKMoW8YHWa+nsihhXkJ5xOCHJj8CLdfns4gg==
X-Received: by 2002:a05:600c:c6:b0:3f4:28db:f5ff with SMTP id u6-20020a05600c00c600b003f428dbf5ffmr21701922wmm.35.1684316076025;
        Wed, 17 May 2023 02:34:36 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c294700b003f4266965fbsm1655325wmd.5.2023.05.17.02.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 02:34:35 -0700 (PDT)
Message-ID: <62c51f2c-a620-a879-5659-faf3c4b77268@baylibre.com>
Date:   Wed, 17 May 2023 11:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: mediatek: mt8365: fix the clock indexes
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com>
 <20230517-fix-clk-index-v1-1-142077a1732b@baylibre.com>
 <9c7ff0f1-3d2c-b83a-a47d-544c76f29663@linaro.org>
Content-Language: en-US
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9c7ff0f1-3d2c-b83a-a47d-544c76f29663@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/05/2023 10:40, Krzysztof Kozlowski wrote:
> On 17/05/2023 10:28, Alexandre Mergnat wrote:
>> Before the patch [1], the clock probe was done directly in the
>> clk-mt8365 driver. In this probe function, the array which stores the
>> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
>> the clock lists [2]. Currently, with the patch [1], the specific
>> clk-mt8365 probe function is replaced by the mtk generic one [3], which
>> size the clock data array by adding all the clock descriptor array size
>> provided by the clk-mt8365 driver.
>>
>> Actually, all clock indexes come from the header file [2], that mean, if
>> there are more clock (then more index) in the header file [2] than the
>> number of clock declared in the clock descriptor arrays (which is the
>> case currently), the clock data array will be undersized and then the
>> generic probe function will overflow when it will try to write in
>> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
>> function returns an error in the log which looks like:
>> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
>> enabled.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.

I will.

> 
> This is huge ABI break and I don't understand why it is needed. Entire
> description above did not explain me that.

Briefly, clocks with the higher index than the data clock array can't be 
used. I've this issue:
[    0.427054] of_clk_hw_onecell_get: invalid index 135
[    0.429525] of_clk_hw_onecell_get: invalid index 69
[    0.442998] of_clk_hw_onecell_get: invalid index 70

That means CLK_TOP_SSUSB_PHY_CK_EN, CLK_IFR_SSUSB_REF and 
CLK_IFR_SSUSB_XHCI aren't working when I need them. So my USB doesn't work.

> 
>>
>> The simplest way to fix the regression is to remove from the header file
>> [2] the unused clocks.
> 
> ??? The simples is to revert the patch, so you won't break the ABI.
> 
>>
>> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>>       mtk_clk_simple_{probe,remove}()")
>> [2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
>> [3]: drivers/clk/mediatek/clk-mtk.c
>>
>> Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()")
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   include/dt-bindings/clock/mediatek,mt8365-clk.h | 361 ++++++++++++------------
>>   1 file changed, 177 insertions(+), 184 deletions(-)
>>
>> diff --git a/include/dt-bindings/clock/mediatek,mt8365-clk.h b/include/dt-bindings/clock/mediatek,mt8365-clk.h
>> index f9aff1775810..fd59c8bdeb24 100644
>> --- a/include/dt-bindings/clock/mediatek,mt8365-clk.h
>> +++ b/include/dt-bindings/clock/mediatek,mt8365-clk.h
>> @@ -7,147 +7,142 @@
>>   #define _DT_BINDINGS_CLK_MT8365_H
>>   
>>   /* TOPCKGEN */
>> -#define CLK_TOP_CLK_NULL		0> -#define CLK_TOP_I2S0_BCK		1
> 
> ...
> 
>> +#define CLK_TOP_I2S0_BCK		0
> 
> Why? This is really broken. You can remove the defines, but re-shuffling
> everything?!?

I've under-estimated the impact of modifying the defines, I will try to 
find another way to fix the regression in the drivers directly.

Thanks for your review.

> 
> Best regards,
> Krzysztof
> 
> 

-- 
Regards,
Alexandre

