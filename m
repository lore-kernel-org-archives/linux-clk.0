Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243C9EE49AD
	for <linux-clk@archiver.kernel.org>; Wed, 23 Aug 2023 05:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbjHWFnV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Aug 2023 01:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbjHWFnU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Aug 2023 01:43:20 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C450EE5B
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 22:43:17 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1c66876aso691066566b.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 22:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692769396; x=1693374196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqyD8w2Ea4iyrL9XdQdNAhbH5OmX3Ob2k4iSn8KyfIA=;
        b=bMY8d/W/LEgLPQBzWnaNhxz0dfV1gzfk2RhBG1NMcTxCaFr/nK1HoQNcPEmbR39cvU
         5TKGqc584NBHL5D9SczyQAkcpFjD3b7g5/J/i6RILhtAlkrBxcwtGlW1nuO3WC418UxH
         6sUlTPD0Ob57apybkYVJRHDAdof9oiLjjY9LaCjcH1Lpop7UrlJEnNO27yiDFuGGEeTh
         Nq2HANaFrUL2pfy4VAVVeZt9RCM5fIRZXs1Y3zqa4OA24/6CTlVv5SCpk5DpJPNWqiJm
         a+UQbjKSsepmyUsLwYKfBucwLW1sCHyWl2+JgMshLco6ziaYEBIS/jbpldGN2RQ1rISC
         Hzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692769396; x=1693374196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqyD8w2Ea4iyrL9XdQdNAhbH5OmX3Ob2k4iSn8KyfIA=;
        b=U2LhpbeD2pt1X56R9t96MrSNGCO4nSnCvkgbNutYMGuW9rSvUs5AVaN477xhb3aJse
         TJ3cEt+4X6LrOnC0FdsBqFufTY0eSvtwFI/XTMdbwNSOl0lac/3ITwJe7SCgGN36iVox
         B3VAZ2fMI+BQ4iWq+UvPN72RdzNI4+dqOz8L4nqsPj3pAuwfeP986VuAJkhGjTdYgkWz
         vJHs/X2ZjXnoj4J5ESmxG8zn8QTvBAHRGsmDJC3SXxUOn3wmGKKJD6AE0hH8CTyUJfHe
         0hTFH8TYfyBpvfSZUeD6glWjbQz+LXmQy4OStYMMBeN4GVyESCrlx0ye/0Y0zWONOpUe
         U7EA==
X-Gm-Message-State: AOJu0YzTQXXifrLw/oc6v2KC4vijcmXAtqgtsQPHtBB+PtRlPQccLu26
        H3vpdTiJks9toSAO1rMo0atzpQ==
X-Google-Smtp-Source: AGHT+IF3UMH3/lRVUBShLpk35pMdpeTpLzVykKBv/KpgWa477LjlFDFlSqmgvDXTRwzRNkr1zgLvOw==
X-Received: by 2002:a17:906:7485:b0:9a1:c44d:7056 with SMTP id e5-20020a170906748500b009a1c44d7056mr2483700ejl.26.1692769396259;
        Tue, 22 Aug 2023 22:43:16 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906134600b00992d70f8078sm9372064ejb.106.2023.08.22.22.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 22:43:15 -0700 (PDT)
Message-ID: <c2faccd6-1d77-9b81-d8d9-830e95e804af@linaro.org>
Date:   Wed, 23 Aug 2023 07:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V10 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230822082750.27633-1-yu.tu@amlogic.com>
 <20230822082750.27633-2-yu.tu@amlogic.com>
 <d2a6060a-c8a0-51c7-f621-1bed2c3074b4@linaro.org>
 <e9932f90-a011-ee9b-ef09-f2e2475bdd0d@amlogic.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e9932f90-a011-ee9b-ef09-f2e2475bdd0d@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/08/2023 04:24, Yu Tu wrote:
> 
> 
> On 2023/8/23 0:32, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>> On 22/08/2023 10:27, Yu Tu wrote:
>>> Add the S4 PLL clock controller dt-bindings in the S4 SoC family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>
>> Lovely. I sent youa  friendly reminder at v8 which turns our you
>> ignored. You keep ignoring, I will start ignoring as well from now on.
> 
> Hi Krzysztof，
> 
> Sorry. I did not forget the friendly reminder in v8, I consulted you for 
> this at the time, so I re-sent V9 after adding the tag. Because it was 
> just "meson" that was removed. But V10 is based on Neil's patch, which I 
> think is a bit of a change. So I didn't dare add it. Instead of 
> forgetting your reminder.
> 
> So what should I do, I'll follow your advice exactly.

I don't think there was much difference between the version, which
received the review, and the current patch. Otherwise your changelog
should say that you drop Rb tag. Rebasing of something somewhere is not
the reason, so please describe what are the differences in the patch?

Best regards,
Krzysztof

