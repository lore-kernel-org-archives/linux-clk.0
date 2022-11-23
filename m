Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D842C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 10:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236030AbiKWK1R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 05:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236026AbiKWK0q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 05:26:46 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D65349B380
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 02:09:58 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d3so20861490ljl.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 02:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjVx0yPImCcrCeHJYSZsdrbYMFr6VcjIJVu6xhC1kYQ=;
        b=LoDEChFlLgzRfgj2sVBMbstyjMSGKEC6XjMZqmuvucEVuveBIlMXgMMSiuI++6+IcQ
         aS9bnxmzJlAaKE+MfOds2q1b+s9mvevdH7oyVKelyHFFwUitnM3B6hVK/Q4+dSUZML4m
         Shqp7BNXicViAayytoxOzh5SIR1YozQRAcKIIho5gSGw7Yly/2XOiUkYyMnPzevrBxSO
         9eKLGtlDGoav4GxFExmr0nsywKeoBzKpnkjYraQgBUnOY+M7H4qofnwhO41PkZw+vYzx
         wXuLtPXV8ddWlwU8afXb2XTDejwM14uouwWAX0eYMVU2UOu7cuRnrakbiNz7eCLy607j
         FcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjVx0yPImCcrCeHJYSZsdrbYMFr6VcjIJVu6xhC1kYQ=;
        b=LbEdOREaeBGjr3CncFaWMNJuU0ndZCwoDXKFELNAnkfHjcFE+cklvi5f0WLeleNAMg
         6f0Q9NtirZO2Fy7zS4BpWtoakazJL5+rnmmD6WjsipEt6WbH62yXPl80sYfkAZNTG6kA
         b70Jo8yYWgSOh1bMCEImgBNcHBsl24ZyPnkMkftPa7PGDYORg8waQekDFiSRWelp6E8Q
         fb2AvvJVfrrC5nX1rR8YgBrK9ydtUCqV5HzFcfGW4q7yrXGLSAuTqqbI6WJCwfiSertd
         0DWdCp1uMCeV6rJa1/UfR5/RJgXX2HY+y+jFPxOCCBAbVW+G0fkEjCh5ugqbQcMKnAuW
         kSEQ==
X-Gm-Message-State: ANoB5pmc7TtC8YCQC3KDJU9xw1ZTGVSC3cFPrCLoYwauv4Lt0hee/m0Q
        RMaIDsVs/uJeeK7ktlpLc3DbKA==
X-Google-Smtp-Source: AA0mqf5TV5txgsK0WFTA0l4gRjfGYwijM8avNcNq2kGWPcaw69fP3+7jectvC9FDgDMfpYRzpwNglg==
X-Received: by 2002:a2e:8891:0:b0:277:a4e:98f2 with SMTP id k17-20020a2e8891000000b002770a4e98f2mr9186739lji.358.1669198197083;
        Wed, 23 Nov 2022 02:09:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c28-20020a2ebf1c000000b0026b2094f6fcsm2141922ljr.73.2022.11.23.02.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:09:56 -0800 (PST)
Message-ID: <09a443b3-4e27-a751-ba2c-057d69363a13@linaro.org>
Date:   Wed, 23 Nov 2022 11:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 3/4] clk: meson: s4: add s4 SoC peripheral clock
 controller driver and bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-4-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123021346.18136-4-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/11/2022 03:13, Yu Tu wrote:
> Add the peripherals clock controller found and bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../clock/amlogic,s4-peripherals-clkc.yaml    |  105 +

No, this is total mess now.

Additionally, you received a lot of feedback but your changelog says only:
"V3 -> V4: change format and clock flags."
so you ignored entire feedback?

That's not the way to work with patches.

Best regards,
Krzysztof

