Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237B7C41513
	for <linux-clk@archiver.kernel.org>; Fri,  4 Aug 2023 13:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjHDNgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Aug 2023 09:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjHDNfr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Aug 2023 09:35:47 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B69E4EE5
        for <linux-clk@vger.kernel.org>; Fri,  4 Aug 2023 06:35:15 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3178fa77b27so1813271f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Aug 2023 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691156113; x=1691760913;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IL2AJxGdbMBYZwQaiXV29t4KoXB7Jg7IkcgZUQkDNUI=;
        b=epRCAO2yPXPwYvAi1GgZHCKhfv84DCIM9+99WK1/2c9TlslGxxkNgeDjIrUAeN/Fe6
         1k06bF5r89HcVt/6oaA44RPf6X/u7qpIgb/kQenNO+5p+wssn84D6xNPjnCC1QI6U30O
         IpocouGfOvOJh/0FAA95TDyT3iEgB34Oj97lzXX/OoaUKZCWHb1zhUy0dJzm72hKKhHX
         wynRKMo9C5H6+b4tY9tvLYnkdHFvNi9F0trQdtVfIEfPwYL9PBD7J3EecIpPME3Dhwof
         sFfIoKxCFXLT5AIYD10vSb5BPpNbBlgT83Mr6Hxu8tou3htUcQMLIeu7ALw+4VVYKC4j
         Deww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691156113; x=1691760913;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL2AJxGdbMBYZwQaiXV29t4KoXB7Jg7IkcgZUQkDNUI=;
        b=G8PssNheV6sCDtCdMH7HFfOeQE9Unpwlz84XoeqnSt8iVuHO7Hy2M/SuS91KWKEzeF
         F/SIVL/YKgBAkn1+kdg7HGwCbBojZZNtScTlimV8A76WN7GInfVj+uOTLHIg1Ebq4E1g
         /fG5M+VjuwvqDDiguN9qSfhOrqrle5dEqDFRn0YOzc+VPMR208FENQSHmVgG/gc+/JsB
         6VKBFvDe79Yi4XKLvN2RjaxXl8Xdy99sOW5tMIT7WuviTVzSizoVkcx5zMEZOIQzf/Fi
         WpBXb8kcJ1/pUPsnJPZFK9spPJ/MYt7YPwbNl5Zgu7tSif05oKkj8ZLqy3prFLQtOcGB
         tgbg==
X-Gm-Message-State: AOJu0YxdCpLfRNjOrOgVSr4YoTZ4yTWec+dP3cydid3xj1ni3lZsVP57
        8sePugxxM9lyGxzFFHi0TaahoQ==
X-Google-Smtp-Source: AGHT+IGFj2WJkLOCSreoMV4op68jFbpcQyR5ma8/Hp/gr6iIaCluzNOhufEIeNmZI5BQspwIpnn97Q==
X-Received: by 2002:adf:fd03:0:b0:314:36c5:e4c0 with SMTP id e3-20020adffd03000000b0031436c5e4c0mr1472761wrr.11.1691156113348;
        Fri, 04 Aug 2023 06:35:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc? ([2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc])
        by smtp.gmail.com with ESMTPSA id y15-20020adff14f000000b0031766e99429sm2534654wro.115.2023.08.04.06.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:35:12 -0700 (PDT)
Message-ID: <9adbbde6-a12c-2857-3103-1c012eed6f27@linaro.org>
Date:   Fri, 4 Aug 2023 15:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/3] dt-bindings: second batch of dt-schema conversions
 for Amlogic Meson bindings
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jerome,

On 06/07/2023 16:52, Neil Armstrong wrote:
> Batch conversion of the following bindings:
> - amlogic,gxbb-clkc.txt
> - amlogic,gxbb-aoclkc.txt
> 

<snip>

> 
> ---
> Neil Armstrong (3):
>        dt-bindings: clock: amlogic: convert amlogic,gxbb-clkc.txt to dt-schema
>        dt-bindings: clock: amlogic: convert amlogic,gxbb-aoclkc.txt to dt-schema

Do you plan to take patches 1 & 2 ?

If you can, it would be simpler if you could take patch 3 in the same batch.

Thanks,
Neil

>        dt-bindings: soc: amlogic: document System Control registers
> 
>   .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  64 ---------
>   .../bindings/clock/amlogic,gxbb-aoclkc.yaml        |  85 +++++++++++
>   .../bindings/clock/amlogic,gxbb-clkc.txt           |  53 -------
>   .../bindings/clock/amlogic,gxbb-clkc.yaml          |  37 +++++
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 160 +++++++++++++++++++++
>   5 files changed, 282 insertions(+), 117 deletions(-)
> ---
> base-commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
> change-id: 20230209-b4-amlogic-bindings-convert-take2-e2caf8e1c13f
> 
> Best regards,

