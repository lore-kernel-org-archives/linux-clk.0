Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6BFECAAD3
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 10:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbiIAKai (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 06:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbiIAKag (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 06:30:36 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D177ED3EE3
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 03:30:34 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q16so17394063ljp.8
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Hq/wXphQ4CQCWqFQUckeg7mpeUY2opCgFidU5GlYS/M=;
        b=wMrHD5kd1sjRAGwDOMxCLd5TmCSprc0l8Nf3sWx1dXuMRw6mfEP63hWBtvHNhJ801W
         QEkV7vymXEa/aXbYqGX4R5yiFQnl8uzfQEIiMjxXJxpx8itKZweitlkO/FPuZmia0adE
         M6WddBo1NBOeeg5/1y/DaNd3wmc3E/n8vDRwKSngkHvNCgF5wx2WcPhrlyIoBIJtnDOC
         DWPdhzxfLoAUMhVxP5tYYJk6X9aNydarTKdgb5IBaD2c6MQAxCPQWDlMkv2YMw6j0jj3
         N/UvpNU9lhbiLUy9Hr6JHYnM5DzYIpAwh8rG0p8VNvFxLcn+dEak3SolRfU50q23CH6t
         W37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Hq/wXphQ4CQCWqFQUckeg7mpeUY2opCgFidU5GlYS/M=;
        b=xjbg/JhbuGCb9SpBConPBKPXZTaYujOG4IuZ6pBgWObbNm41+46K2GL7R/8HxaCsPh
         Phc/kKElMFBATYfklsAXiJi5Kv4wmrWRyjxVDWd0TgcbIA8+fV4Te+BkRVebnIcHsYgn
         kj2dsfpXvJGrbUTnSBr98SyV7bWlYhlDpYvTUqP9646Tidpej5rvoUMK8AhmNTb86o/c
         WMKUn1Zf5Fp2s1FD7W3g0Aaafgd9KSupOQ6og76Dth/Z3C1AnyCe7gkNuTQRW8kzfvIV
         +lXkSbjVkIuB5B9SCl00qMu+caSQFBLRsgfhLe1Ys1b3g2EAPGuaneFmi4mAQT6/2bfe
         iChw==
X-Gm-Message-State: ACgBeo0LWGuortYs9ChHSdbxCVYaDTVvg5uQobnASC6ai9r5If79l7v/
        BTIBMqsmvmdFl1PIsdCsJRcjFQ==
X-Google-Smtp-Source: AA6agR6rVg//wgHti5p5gLXR9YIZj3y2n/9kU9errMO9J/QeGYwVMsfd2wxCYlqzONqcnaXPvhV2VA==
X-Received: by 2002:a2e:9018:0:b0:266:6871:cdc1 with SMTP id h24-20020a2e9018000000b002666871cdc1mr4524850ljg.244.1662028232455;
        Thu, 01 Sep 2022 03:30:32 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f48000000b00492f84befffsm1567689lfz.192.2022.09.01.03.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 03:30:31 -0700 (PDT)
Message-ID: <93d5de8e-31b2-4412-3348-7ba1903cde84@linaro.org>
Date:   Thu, 1 Sep 2022 13:30:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
 <38910de5-89ad-e7a1-261f-18b51c8e7877@linaro.org>
 <955f7200-9d08-0d21-2d1a-5ccbd0f3a8af@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <955f7200-9d08-0d21-2d1a-5ccbd0f3a8af@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/09/2022 13:22, AngeloGioacchino Del Regno wrote:
>> That's simply not a proper
>> hardware description, so again:
>>
>> 1. If this is separate device (as you indicated), then it needs
>> expressing the dependencies and uses of other device resources.
> 
> Agreed. In this case, what about...
> 
> mediatek,hopping-ssc-percents = <&provider CLK_SOMEPLL 3>;
> 
> or would it be better to specify the clocks in a separated property?
> 
> clocks = <&provider CLK_SOMEPLL>, <&provider CLK_SOME_OTHER_PLL>;
> mediatek,hopping-ssc-percents = <3>, <5>;
> 

I propose the last one - using standard clocks property and a matching
table.

Best regards,
Krzysztof
