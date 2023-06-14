Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785D4EB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 16:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjFNQGA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 12:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjFNQF7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 12:05:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19321BEC
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:05:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-519c0ad1223so765612a12.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686758756; x=1689350756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tBboY0bdYrdeQOHKC09XaZuxefgFR2fXkH5uFS/N1UM=;
        b=T9YRgaE3TfN/AeQZJiFg6Yuvsr5a9iZoRVG51qhPhFGE0a7pV4BoLDSY205XjZgpo9
         WSW1sBJJnHCzDV2YDNdzeFtfEdqfHNUlEKVSRcYOrv+LjRwAwI/Z8fcvi6Sqo4KktxE6
         ZslN1klEOjK2WilOFUtS63YxPYY5PXpqmM7UHsAcMEguGCeZxQUpJFwmjwQ5fnXIZwzx
         MKX1B0EP+dBt5S0B3v4eN32/aqaBOhW9YoO2ZtQF3GmiG0aY0NMjP9k3oyiuw6hfzX9K
         TXn4tlXSsg+F/jnBLJDerXWyh1mIlMefS64HJU1G93r2UxWo/LX3PMrGkI0wnbSfFRUC
         +whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686758756; x=1689350756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBboY0bdYrdeQOHKC09XaZuxefgFR2fXkH5uFS/N1UM=;
        b=ATjG0vY21kGY4Syfu4P41CC7fkljPKBgmqvAKBKomuTgLaAKqOwOlcNTVm0vtXFBme
         bLiTeawW5pOk87ltNKO/N/VTihYqbJpTd3y6C04tRgvP08yEjXfasQd2Ec6w51hiL94/
         W7e1tKnVym6EbNRqokdbR2uOoi+PT0/2y72AIZeylMgzm+XMv+LF6j1+EKFyIygiL/Ti
         0t20KRAAW6+n+XAvEKRZuZkibAhp/jcF8bDQBr/ku3vxid6fXny3jBX0X5z5Z0IQkCyp
         nlxf7Pf/A6kK5cVfitIhU4NYl74hGTUPXyAe4W4Jh2D6S4fy5fcxyiQoloSTjxIQhIRs
         HAeQ==
X-Gm-Message-State: AC+VfDzMNl2/JU0WD6HL61LcVJivxBqjlpcwPEQHEr54PyDjq8H712uP
        TVXaM4EKK6FVJ6yHHX81zPKgNg==
X-Google-Smtp-Source: ACHHUZ6xxmoCev7+3moOInDw8sUm78Icrrw6bYb9TBUSDdgK8VTZNEi6AcPSCY8OEDpi+iU+SjvFqg==
X-Received: by 2002:a05:6402:1147:b0:50b:c085:1991 with SMTP id g7-20020a056402114700b0050bc0851991mr9018172edw.19.1686758756213;
        Wed, 14 Jun 2023 09:05:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z4-20020aa7cf84000000b005187a57fba1sm1964383edx.77.2023.06.14.09.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:05:55 -0700 (PDT)
Message-ID: <e48f6153-0485-9fb9-5fe0-145251a8b367@linaro.org>
Date:   Wed, 14 Jun 2023 18:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/18] dt-bindings: soc: qcom: qcom,saw2: define optional
 regulator node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
 <20230612053922.3284394-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612053922.3284394-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/06/2023 07:39, Dmitry Baryshkov wrote:
> The SAW2 device can optionally provide a voltage regulator supplying the
> CPU core, cluster or L2 cache. Describe it in the device bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,saw2.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> index a016242367b9..b809a9cc0916 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> @@ -47,6 +47,10 @@ properties:
>        - description: Base address and size of the alias register region
>      minItems: 1
>  
> +  regulator:
> +    $ref: /schemas/regulator/regulator.yaml#

There was such property in the binding (and DTS!) but a bool. Previous
patch silently dropped it, so re-introducing it with different type is
confusing.

Best regards,
Krzysztof

