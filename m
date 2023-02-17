Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A97C64EC4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 15:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjBQPrz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 10:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjBQPry (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 10:47:54 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F13DCA0A
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 07:47:52 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id h14so6117282edz.10
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 07:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ydvsRPVG061WS4UTZVStbsfcU/oL9Zx0nIHQuE4tyA=;
        b=xHv1htd37Mqx8hvLnrTvHhIKTpFqgdOz/1uJyvsbCg+1IPuW59e2MfJdhcJtQ3aWyV
         xUB/T+IXHjLDCvXwC9m29LDgZ+A61/SeNTAAUrd6IJpaDhZJxoEe5LF44aoAoG0mrzUu
         0lOJcKpvLEP5h4rgVdXnUYvWRSgvSOu+eCQTNX3hkJ54KJL6CBHqpmqkLP5mr5eh1brS
         ++TVu9WgIto2kqXvqrncZ44tK7YBoLdTHeaTJ09BtZ2wu03bTVchrrGc3ZuVFHbD6vn2
         ESq5gYkZ6eNaSTUmCDMI6zhEA2eovgrlV9Q83ml6nk9QzoAJwaS7RdSM9QG25SKYHLfv
         1+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ydvsRPVG061WS4UTZVStbsfcU/oL9Zx0nIHQuE4tyA=;
        b=QkSo9ibi+o9ZF8bffnBNovPbVHXdmix47pOAhGlP16kFpHCxnR/6KcJ6I4I4upEtxq
         +R2Ir1XGsrX95XVrIYjnBCI3zytOOOq63vbLYkEziBDJutSeUlaMSfjGhwHWcAbN870u
         1M1bt5gjGDB9I7RyL1YVz+y4MOykb7aGOnykIPiuI9kAruSLZMXCU4Z7CfesnIkSXmnE
         tqYb97OjoW6UWIQb4z3TvnRrJilUi5OsNHpTdam3zmUJ8yPlloxzvL/3bbkk0NsAqfa0
         OE8+ApfZW/yQ+qT3tj1mAkn4sW5cBtS7Mw8Ir0wCFBN0khT3IswdJMAyoW3VBM2rKwLU
         44Ww==
X-Gm-Message-State: AO0yUKW32DpZH8ksU+riVX8g/ucJHfejlG5vNYy5S64S9fm4l+cOyGB8
        3AcQf0pO+XwMZ5tAtH4Ro7qhIg==
X-Google-Smtp-Source: AK7set92ggsq7QntNOjYeDE1GS2W9aHhklXHaJSFIAczwRnKnbIvvSu4L4kHtCgfE55Dgzu7wN1V/Q==
X-Received: by 2002:a17:906:9f25:b0:8b1:2eef:154c with SMTP id fy37-20020a1709069f2500b008b12eef154cmr5350244ejc.0.1676648871136;
        Fri, 17 Feb 2023 07:47:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ui41-20020a170907c92900b008af3930c394sm2282740ejc.60.2023.02.17.07.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 07:47:50 -0800 (PST)
Message-ID: <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
Date:   Fri, 17 Feb 2023 16:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Hal Feng <hal.feng@starfivetech.com>
Cc:     Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com> <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
 <Y++B43uCnPQlRYFi@wendy>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y++B43uCnPQlRYFi@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/02/2023 14:32, Conor Dooley wrote:
>>>> Yes, it is.
>>>
>>> Which would then make GMAC1 RGMII RX optional, rather than required?
>>
>> If thinking in this way, I must say yes, it is optional. But actually
>> GMAC1 RGMII RX feeds gmac1_rx by default. 
>> For a mux, it usually works if you populate only one input to it.
>> Does it mean all the other inputs are optional? And how can we define
>> which input is required?
> 
> I'm not sure, that is a question for Krzysztof and/or Rob.

That's a long thread, please summarize what you ask. Otherwise I have no
clue what is the question.

Does the mux works correctly if clock input is not connected? I mean,
are you now talking about real hardware or some simplification from SW
point of view?

Best regards,
Krzysztof

