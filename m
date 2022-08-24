Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BAEC32796
	for <linux-clk@archiver.kernel.org>; Wed, 24 Aug 2022 13:38:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238315AbiHXNiA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Aug 2022 09:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238279AbiHXNhy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Aug 2022 09:37:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223A57D7A8
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 06:37:53 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d23so19679749lfl.13
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=FNnIJyZLA/DkTE9+Zpr6Ng3J1POb/zmR9BDJb09121Q=;
        b=h6BdaQtrsWihUPz25ye52qmPW2BJdRf34tszfDgYIc54i4TMcnZJ/JvenaEIMRYjDZ
         QUM5a3L1gNjDID5UjU0pq5tW23N5jHdQbD8KAItUKzFOwX9vx6pT+K364t3h0/tzoxjt
         wJvmk/NyPj0GQR5dtiriZbkkW5uMLQmEx5S8ChFTSeNw0u7IMLUlVhIHsu7ZWeoe/AG5
         8qo6ppqtNVcNZk18+mJ8rOfMhkXjNYH0UJK57wrPlQSU88H/lslZiUX9sLfsZOd4EQjR
         /JY7RnDCDgg0aV8OiX1iM7xzv1KG3mmLnccyGTFVMVq8rDRx/GmWXi1Xl6mSB29RVGxc
         9i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FNnIJyZLA/DkTE9+Zpr6Ng3J1POb/zmR9BDJb09121Q=;
        b=LX/QHGuTXTMLBmAbJeXxEqsYykChIWmlgrmFuqh5BvXppHu2Bp7dU0c0eqP8Mczqvh
         00WmqCFimV7JKxOpBgOaf/2X3aOEfzGHcSRUHb4tBf72hM/zH0jWHpY8CuzCQyyMh1hd
         N7ovmPLfKYYBf7DG2XyQWHjVitDHUcLKvQqPSwu0Yk35M59rxYE07Hrm2RV3Vj96WtjI
         LwCUQYqi+Xy7tJ0E9/tAItfQb+Ob3ysMR+NXlSjba/+4kCsJJcu33Lw/kkNs9Xz5VUtp
         VFC8/GSPSg3sis4WTQ3WmMUHge+4epv1MRuzjWX8shMNYTM1Vp8n5HHum/csP6GPOujY
         QQaA==
X-Gm-Message-State: ACgBeo1QBJeFzNk71vgiu36/N2Fj53TPIF4hYV+2ewVFSATesMkQUKJn
        jvCLrvadc+CPzbT3m7nYrEC9aA==
X-Google-Smtp-Source: AA6agR5/XXVW1Gc7QE0nZt5Z1Bn77q2PqqOB2dPRp0AQNRayelqdqv1+ki+d/TSM2zjY+7pI4vB+Kw==
X-Received: by 2002:a05:6512:b12:b0:492:daa9:75ea with SMTP id w18-20020a0565120b1200b00492daa975eamr7338464lfu.297.1661348271490;
        Wed, 24 Aug 2022 06:37:51 -0700 (PDT)
Received: from [10.243.4.185] (94-12-180-213.sta.estpak.ee. [213.180.12.94])
        by smtp.gmail.com with ESMTPSA id 22-20020ac24856000000b0048a921664e8sm3033917lfy.37.2022.08.24.06.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:37:50 -0700 (PDT)
Message-ID: <bf882a57-adaf-e093-fee0-39e197dbcda0@linaro.org>
Date:   Wed, 24 Aug 2022 16:37:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V4 4/6] dt-bindings: clk: meson: add S4 SoC peripheral
 clock controller bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220823022630.25007-1-yu.tu@amlogic.com>
 <20220823022630.25007-5-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823022630.25007-5-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/08/2022 05:26, Yu Tu wrote:
> Add peripheral clock controller compatible and dt-bindings header for
> the of the S4 SoC.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
