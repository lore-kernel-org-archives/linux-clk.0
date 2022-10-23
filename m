Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE40DC3A59D
	for <linux-clk@archiver.kernel.org>; Sun, 23 Oct 2022 15:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiJWPWc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 11:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJWPWb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 11:22:31 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F456E882
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 08:22:30 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id a24so4437857qto.10
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mINfRrv10YbsHL8f7bHkN2lhU+cugNCUGw70BIJKqT0=;
        b=EnDn8SmtuqPY0xKqaq/JpfPrX/R4fSxphhQYEK/soFXMmAzvSfBxnDEr0TQhK1MYRP
         9hB0eGS+m3v8et/fK+QpqNuSvNvZht7zNaORiTRsTxJqXOu5MQBMODnWqhMmd8EKosMV
         yiAgEt4uHzto37QjLzy89yU1pDem07xc04L9ubWCxsfNFecswCUymuh/7X7ASVmyH3Lp
         AtWZXcrHWOqrUlm6LHkoiEzaHR0Z3n4umTQGvJA6oUsC81AoiRx46d8eDBpVccUTHik6
         MTAusWduOdBB0DurFycHzFJ5A4znUCwHOyEJnq2C5HbP2V9JIElqqJdoyGOS1SL/37+K
         TY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mINfRrv10YbsHL8f7bHkN2lhU+cugNCUGw70BIJKqT0=;
        b=ez/mgK2162tBWxMMwasgqeI2k+UbUTzioBy7AiF86ynhl2V1pbZjmlt0w64ldf8Y7+
         Hc/R3Mp9EYbwmIgNt3sknyTDXwq9j/BjjcsWe/DcGk+PDcH5+zOOlFIZ8wPRHrCVq+RF
         jB+ZDH4iTicCxlQGlGoJqL8kn9tV8Kty+XDZr+9wlWNyqKJZk3oURUNdFmkv1Fmq91nc
         bhz0VraGAdtBkyqRDyHJCHXNb0EyFVtRX8AL+OX75Lfi22XwItn+M1bB9MESu0jOUvhi
         oxCs69S5mABw49sAmTVpruEcpys3zkfOWqNop5fi7/7fd55M6/yVfeHHqsS/Cr5cJXZd
         C8EQ==
X-Gm-Message-State: ACrzQf1x+CJrfu4N6Cn1mgT21SwzZaICFMk+N0dM8xreCNtbpAbKlFRa
        aAWPOMg1Eu3JJOmTFU8dsQ59rQ==
X-Google-Smtp-Source: AMsMyM5E5rQJzhPoo3LiOFHGgRAsT1+TNl2VLLZN+mbvskNNOzafo8Z7l0Kw1RdnqciMhhFUkufK6Q==
X-Received: by 2002:ac8:5808:0:b0:39d:d5cc:5fca with SMTP id g8-20020ac85808000000b0039dd5cc5fcamr10805578qtg.12.1666538549165;
        Sun, 23 Oct 2022 08:22:29 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id t6-20020a05620a450600b006e8f8ca8287sm13275457qkp.120.2022.10.23.08.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 08:22:28 -0700 (PDT)
Message-ID: <8f9d6060-a280-8300-d6ef-d9fe40d4669a@linaro.org>
Date:   Sun, 23 Oct 2022 11:22:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 4/5] dt-bindings: ingenic,x1000-cgu: Add audio clocks
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
        paul@crapouillou.net, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     zhouyu@wanyeetech.com, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221023145653.177234-1-aidanmacdonald.0x0@gmail.com>
 <20221023145653.177234-5-aidanmacdonald.0x0@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221023145653.177234-5-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/10/2022 10:56, Aidan MacDonald wrote:
> Add bindings for audio-related clocks on the Ingenic X1000 SoC.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

