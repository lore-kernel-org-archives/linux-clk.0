Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832E7C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 25 May 2022 13:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbiEYND2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 May 2022 09:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbiEYNDY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 May 2022 09:03:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FB32E9D5
        for <linux-clk@vger.kernel.org>; Wed, 25 May 2022 06:03:22 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id v4-20020a1cac04000000b00397001398c0so1057465wme.5
        for <linux-clk@vger.kernel.org>; Wed, 25 May 2022 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=SNO1m8U5Xj7Rbu3Wzqk6A1RHIHLARUnczB7VjexblOo=;
        b=WgUMz38IMdM3gHf+Kw9OI9iMxdfzp4N+gZ4iB9mT/DEaxKgJ6ERdPjEokKSnfFaQVp
         CEiN6D3OD278urpEMb9+i1Ecy9zdBPuPGcFWWfQYf1/eF7NUSI8999lAlgNTg1uvQpew
         IFjY7eOfMoZqzX9GAZBGpAaU9NzyDMFP58KRokMaNL5qWsnTq0NP6fluXmmDoI/eTSjb
         /3KHoCcNJdhIzs/Dgn0ZPPszMF0Smen7B0TVA2RtLSXizmFJ8Dk8tqent5Q0+/oGmNas
         2mOoX0fSXVx9+ztAxyFT1HpRUVFz4dnDRCI4xOlUuDxDcLQ4r3jkdPgxxIdi4q9tIOT1
         DrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SNO1m8U5Xj7Rbu3Wzqk6A1RHIHLARUnczB7VjexblOo=;
        b=3R8AjVGNgCxCnwCd+kQ3eP5vp53ufewjG8ISFrN+7aGmcKp1mkJU8q2uKCMB8vD4na
         c2+DTq8RmrtXUQhF2UOMME5r0rDjlE2Gm78NRLatsuoh3Wcma0a1fFlQgoJCYkN7zYSH
         BktLGkC1Uf202MivgxWwE12muEH1LLVdxjrtUZYj/libA0oxustNondxrRrUdJlm/HU6
         wxtlLmsuSGlJKB9kgUYx9DCAjrR16SnqS3hc91s2Mq0r+eP3n6QonkSNjNja9l1srfES
         C6gYuCQ6bfgpqMScuIa9xltmgg08z7DhCu57J+WJOcVVplISE4jbi/DRTg82YAkSm1fZ
         VpLw==
X-Gm-Message-State: AOAM531bCAA/eyAxzyUYUOFqBa6fwgSDrJRUi904fa6HbED9OgjlfB0B
        +IOvqqMLugWbD1Xsqq02K27U7A==
X-Google-Smtp-Source: ABdhPJwXdCU0C5UhVtvR05q8q98D3UaG/PLio57u/H9iF2J5nXz1TeNIsQKAjN3zJgqdvfYfTSPKnA==
X-Received: by 2002:a05:600c:3ba4:b0:397:49b8:262 with SMTP id n36-20020a05600c3ba400b0039749b80262mr8104872wms.77.1653483801030;
        Wed, 25 May 2022 06:03:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d598b000000b0020c61af5e1fsm2307098wri.51.2022.05.25.06.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 06:03:20 -0700 (PDT)
Message-ID: <a59678f4-96ac-7edb-cfba-364aae396959@linaro.org>
Date:   Wed, 25 May 2022 14:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/4] clk: qcom: msm8939: DDR and system_mm clock fixes
Content-Language: en-US
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/05/2022 17:38, Bryan O'Donoghue wrote:
> There a few omissions/bugs I found recently which are worth fixing up.
> The BIMC_DDR_CLK_SRC command RCGR points to a value off in the wilderness
> and should be fixed.
> 
> More interestingly a number of Multi-media peripherals are defined as
> pointing at the system NOC for their clocks, instead of at the System NOC
> MM.
> 
> This turns out to be not much of a problem so far because we currently
> aren't trying to set any of these clocks and the MM_SNOC clocks are derived
> from the same source as regular SNOC clocks, except they can vote for
> higher rates.
> 
> Bryan O'Donoghue (4):
>    clk: qcom: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
>    clk: qcom: add gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
>    clk: qcom: add gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
>    clk: qcom: add gcc-msm8939: Point MM peripherals to system_mm_noc
>      clock
> 
>   drivers/clk/qcom/gcc-msm8939.c               | 31 ++++++++++++++------
>   include/dt-bindings/clock/qcom,gcc-msm8939.h |  1 +
>   2 files changed, 23 insertions(+), 9 deletions(-)
> 
ping !
