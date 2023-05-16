Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1D7C77B75
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 09:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjEPJWp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 05:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbjEPJWY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 05:22:24 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5B54EEA
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 02:21:38 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so25237394a12.1
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 02:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684228895; x=1686820895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLFC2bNX6txLnjTPD5+kbo++oGCyGs9/o5oXQDZQo4c=;
        b=iu0gLDPhCLaWcd6EPNDAMZ6RADmZTS7G17U99YpQtRVBlZ5XuiIUPr6/uZOmxwbE9h
         xTJ41HMul09+N1P7ZoYma9BMw6ie+5PW+hznisj7u8wHbDV+4fC7oTzMO1n9uAXz/1Sz
         QLRhsg24PRZUztVMhLfV99/GvIMJC5jcDPTZ4SYjpxMkvaU4Fx1Pw4tFyY2bpxySNvKG
         w/f49Nb3M/glSIUNwreXGY3xjvPh39lKiuehClugMZQCOeCcwqONa60EYADMN04C9Y5t
         ZGi8JBWP+pFZAz3uZELImxqWYSAU3jd1KEX3u+MvlBDFl1qsLTUAiCs2tcijr6lJhhcw
         c7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684228895; x=1686820895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLFC2bNX6txLnjTPD5+kbo++oGCyGs9/o5oXQDZQo4c=;
        b=Ar8DWyjY5lcCcn4VksuibaTimqmKKjnq8MxVntwmHODc//Gtc8NsWD1JlLQREqnuc/
         4YnMaEpGj4HbkMJlw95iEjL+NyNpFQrPGJ1/d0gvGZjaF/19EIFJaar1ZjMz7zYPhBhq
         Xhi8vKqtBaPCztmkckCL9oM58OhomUsBwV6vFcu9aCoN72o0TrKz1etdG5+oHV5qRlQ3
         gireigwsza8KjtlQaszyG5ePNrlDGtNeqqrqy4lauA5Jq1EQR4upP28Ci1Q8CIXEvxRH
         soBnfzAsEGgMOfaJ0goksl5bAkX0pEahWsDtY+0x3oR6PM7iJGzYpMXhioJso16PRcmH
         ck0w==
X-Gm-Message-State: AC+VfDyMFQfSb9OVNKZ2XZHqI5zGSP7Iny0c6R5qpwQjI4FECdqMomUV
        nBwDrPVtuMX4M2zaC10xNLF3dw==
X-Google-Smtp-Source: ACHHUZ7pSEzzkRBU/kT98UVCxfWhQeBfw5kAf0aPQHsa2kgcYfw+RMjIwWa+6b7fuAWllQ+0Y+XM7g==
X-Received: by 2002:a05:6402:614:b0:506:c2d7:503c with SMTP id n20-20020a056402061400b00506c2d7503cmr28441142edv.41.1684228895224;
        Tue, 16 May 2023 02:21:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7da96000000b0050470aa444fsm8008834eds.51.2023.05.16.02.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:21:34 -0700 (PDT)
Message-ID: <f2c348d1-4ffe-d515-17d5-ddb25bd38f53@linaro.org>
Date:   Tue, 16 May 2023 11:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 RESEND 2/4] dt-bindings: clock: document Amlogic S4 SoC
 peripherals clock controller
Content-Language: en-US
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
References: <20230516064736.10270-1-yu.tu@amlogic.com>
 <20230516064736.10270-3-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516064736.10270-3-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 08:47, Yu Tu wrote:
> Add the S4 peripherals clock controller dt-bindings in the s4 SoC
> family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

