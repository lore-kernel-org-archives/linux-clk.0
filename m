Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76863C77B7A
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jun 2023 16:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjFJQja (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjFJQj3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jun 2023 12:39:29 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE4C3C33
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:39:07 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51830f2523fso573580a12.2
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415145; x=1689007145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QiXYDHQLPum02ry8vW/Ny8uS/yxBKBPG03To311Ihhw=;
        b=NxSakPZ4DOZAcyWtlrET9GBA440gLPD9Lg5iidkj5a/7RImEi3zGKkKJnDG2Eugfpv
         lnbLTfVv370m++JC3nnkHPPmDhlCqRXMLco1zgVfuVFz8ciy1nMTkXoC7JYsx71Wwnxx
         l7KqsGWVNOsPBc3RK96XzrM605cxARowyjsXZwzkxPKeUegKmT8NNrnlOKh0zx0QcAr6
         aMyGHKqczHUbi2uZF2nBsnMUxLTT7qqXKGZY+5RLNGc7oZNB9lc/ZdOFlSm1SHeDzb5F
         gArkVf5s9icp+p6Js4q6t1Die/eZQvCG5DEC/a7MKvRa93aqCwBGmDgzI4CaUdgZp34U
         5ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415145; x=1689007145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiXYDHQLPum02ry8vW/Ny8uS/yxBKBPG03To311Ihhw=;
        b=DF6yOSl64Reu6fPSIajQLM1ZHb4zidXs2Cesm534M/jLrWJu5hx7xulHGgyB0kbQy0
         7sd/SsOx+NOP8L3G+PUVJ9LdHZq03TTIrkR1P3naW/yyW+MB0uGh/UCTKmDlQyLUpnoS
         H/KoHTVWFF+5g8vZVRjMPcSHIg2rCfJKcGR2V9qbZN4Cy7jDB5XBOuA/lM8Bvzd3lQCE
         +QXFrworhR89y4TOLOXo4hytowtZewFdN0xHRuV6WyePZy2X8NCaYQbShpLlA9v6gFeC
         wKhHnd//DhBFOXt2ThWjk1HKReAuqAXDJUWIL+oBY1m9gctFBAEFKDZ/WnlTAXbBbhdc
         V2uA==
X-Gm-Message-State: AC+VfDzE68YvPzQ3N3ylXmwRr/m/4FEH8MdeH84BGY/xvytRsU7EyGvh
        7bF/lzHoP+QjCzQ98RjmMK7o5w==
X-Google-Smtp-Source: ACHHUZ5Jb1+VnWqrBMQFrwFTVbVrskJi7tR7TK7otkENFqwYCziIMptTjdy7AotWU9Bq3PUpJWdcfA==
X-Received: by 2002:a05:6402:138f:b0:514:7f39:aa81 with SMTP id b15-20020a056402138f00b005147f39aa81mr1435661edv.20.1686415145043;
        Sat, 10 Jun 2023 09:39:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n22-20020aa7db56000000b005182edf2a52sm753791edt.30.2023.06.10.09.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:39:04 -0700 (PDT)
Message-ID: <59bfe97b-a403-1d61-2969-da0440506067@linaro.org>
Date:   Sat, 10 Jun 2023 18:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 12/18] dt-bindings: clk: amlogic,a1-pll-clkc: expose all
 clock ids
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-12-9676afa6b22c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-12-9676afa6b22c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every A1 pll ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

