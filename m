Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4E0C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 09:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhLTJkp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:40:45 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59656
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229842AbhLTJko (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 04:40:44 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C6D883FFD3
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993243;
        bh=EVGM/+q0CXCgdQ8nkwe34/uQXDmUodwxi1yGzkWco68=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=H7WTeLrQ4LIfZn3h0e27RBmvGzozMutsv6rP7eWxKsA8d+YFtWDzqUYX1Wp1Q7Miy
         JMK8ykTcemsML8o3ludr7qdBcjQ/7ZhFC2BlxyynE/erOzpndj/oFrcJGkrzdr6w9b
         zQrdb9wCk5H57KKHGWje2prH9NQzpfu29bZOx/jITnrUnSfyA/285KlTTGkpRC3guG
         bKuVsG5cM/SZ0TJpKg1XGS9mTi/JAFQTLTq0CSyECOGXFCLpZebSyMEtfkEPqw050m
         zGgyxFMfl35JGrqDH+3ebPIHRFliARtPufVkptV10gBKNOy8NcgXx0WxXJ5T9Rd/6x
         Nogx/Sr/LlyCg==
Received: by mail-lf1-f71.google.com with SMTP id o2-20020a198c02000000b00425d146a32bso868925lfd.15
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 01:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=EVGM/+q0CXCgdQ8nkwe34/uQXDmUodwxi1yGzkWco68=;
        b=JOEGXR7Pqp3a++qXOcgKHOM267s5Uqq7skLUC8Ldwpd7W/F2lSzU7dONMbKa807LvO
         o1qLntMJjQlM1bw72VpwtHG1wW/16+BXRggGYK+9iDY1Wc7o6jxCcjWeOJeiasKUtg3l
         YzGq8vOrEri4Jb5nK3oonsWCYAr01mJNVCz7bK9zi57TnuKEX4/LLvTy9jOLmtFJsjtZ
         haNjn6PhPObafRxXnETd1K/oumI5+SAfr0rXURL/LR2O2B/tcVVdRVpkL7wQajACrB0n
         Qcac+sOTpuG8Sm00cTbj9JCzh//dPI/Mmj1guMzO/XSTDRimm2JOe/QoUVYXrV2wiC2Y
         qn0g==
X-Gm-Message-State: AOAM533iY2qH70OlojJfkafmrXSy354dfCy4flrbgMGwg4pNXGGar/M5
        1qBMXcYGUHDlKtgbh29nfDjAojbhVNr+HgFN9Lru8PqE7MNIoPyhEFtu8n5Sno38k7uu98J1OiY
        jMfv9jV+3/vyIjLFmWinrK/0r0I23VuGBNft/bw==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr13591965ljg.94.1639993243231;
        Mon, 20 Dec 2021 01:40:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxM2KvTkLS2aeCYmftY/HbRanVa+empcVyws/mA/hlDePnsN/jZUkCVGawwvT8X6EoeDauwow==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr13591954ljg.94.1639993243069;
        Mon, 20 Dec 2021 01:40:43 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j16sm2306251lfe.4.2021.12.20.01.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 01:40:42 -0800 (PST)
Message-ID: <b49ffb8c-8784-978b-faf5-6fe1ace37c9e@canonical.com>
Date:   Mon, 20 Dec 2021 10:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add bindings definitions for
 Exynos7885 CMU
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        David Virag <virag.david003@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211206153124.427102-1-virag.david003@gmail.com>
 <20211206153124.427102-2-virag.david003@gmail.com>
 <aa76e303-95ac-20ff-c0a9-26f7f8c6b2cb@canonical.com>
In-Reply-To: <aa76e303-95ac-20ff-c0a9-26f7f8c6b2cb@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/12/2021 19:39, Krzysztof Kozlowski wrote:
> On 06/12/2021 16:31, David Virag wrote:
>> Just like on Exynos850, the clock controller driver is designed to have
>> separate instances for each particular CMU, so clock IDs start from 1
>> for each CMU in this bindings header too.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Signed-off-by: David Virag <virag.david003@gmail.com>
>> ---
>> Changes in v2:
>>   - Added R-b tag by Krzysztof Kozlowski
>>
>> Changes in v3:
>>   - Nothing
>>
>> Changes in v4:
>>   - Nothing
>>
>>  include/dt-bindings/clock/exynos7885.h | 115 +++++++++++++++++++++++++
>>  1 file changed, 115 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/exynos7885.h
>>
> 
> Hi Sylwester,
> 
> The DTS/DTSI patch (7/7) depends on this one, just like the clock driver.
> 
> Since some time Arnd and Olof prefer not to have external trees going
> into the arm-soc, even if this is only the header change. They recommend
> one of:
> 1. to hard-code the numbers in DTS and replace numbers->macros later,
> 2. merge headers to arm-soc tree with DTS and provide the header to an
> external (e.g. clk) tree,
> 3. wait with merging DTSI till headers reach mainline.
> 
> I propose that I take the clock headers, put on separate branch and
> provide them to you as stable tag. You can base clk driver changes on
> top of it.
> 
> Are you okay with this?

Hi Sylwester,

I see you applied the patches, so I understand we are not going with
this proposal.

David,

Your DTSI and DTS will have to either wait for next cycle or please
resend with clock macros replaced with numbers + TODO note.

Best regards,
Krzysztof
