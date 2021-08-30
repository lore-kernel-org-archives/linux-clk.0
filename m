Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF3DC432BE
	for <linux-clk@archiver.kernel.org>; Mon, 30 Aug 2021 06:52:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BF8E60FA0
	for <linux-clk@archiver.kernel.org>; Mon, 30 Aug 2021 06:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhH3GxB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Aug 2021 02:53:01 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46014
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232855AbhH3GxA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Aug 2021 02:53:00 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6B11040795
        for <linux-clk@vger.kernel.org>; Mon, 30 Aug 2021 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630306326;
        bh=MgfWimLEdQUarvzIGTaBBVzfBQJf+vNUd1nNymnWejg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=kdwNYmhIPcBAncaKJUgsxYu8e0ib7cLmwCCEHqHdfX9pVGUovJOv1nfD+cjU/l5kR
         plEn4pAICma4Z2O2Xu+xumfjtNJBDZ4gmi7kcbmv8wz/c8NjZ+4yRcBgmoWgnSDqtK
         uHvdP49Df+fRf3HQm+pAHH4uY8mVLzTjNK5wJ+7I/rxWHWr3HJZl2TZYPMkF4z5kMx
         oEF+2EXItPUcOeCmc6cCCzspqxnCyQCvhAsOqBEdkzh1dvPhZlGxgaHWVx+I6F0+Qj
         vY73cGFREAN1PD9JOdBem88x1zN4Hnif9t0S4m2OM7fNoRWN5JzbRHEed6Lk+92yJS
         WsyJsrEmZkmPg==
Received: by mail-wm1-f72.google.com with SMTP id u1-20020a05600c210100b002e74fc5af71so4332650wml.1
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 23:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MgfWimLEdQUarvzIGTaBBVzfBQJf+vNUd1nNymnWejg=;
        b=uehe0lzMorLx1jSjGwAVD4BVUP9sRrkZvBhmNtPXdUfR4I4fkNtpl3wDuclNM2A3SH
         f9esCMd/jgc6Gpob+lQcJxzWcEao1N/BUokm7jKo4vqgZh7Ne/OVS7zw2a76y01CJnNY
         4L9fWE46xWLrR3o/jMrdAmdwKVVq+o0pPghxT1J6vjDzJ4j1m+gteb3dZKOl378+dmzW
         9ogOgw7AJILU5ZdQhB1Y4Nggz1lpj8ZPXNtR9ZQDVIQuSI7lpPlqUROM8WFpFX0kL0xk
         YIDdSY//cyu9rOtHA8d8QXAC5UbF6tc2AeD6oj0xGH3vH7tj0YtmR489h5SySND1zSxv
         n1Uw==
X-Gm-Message-State: AOAM530sL4rqVTvYdbpHQy/V97VJ5pp6CVEMAidb6CdKlNatUc00WEXc
        anyX6MaNdLAz9YAlIpoKeGY1YiZT1POI5lwWdTwTMnyNVsqK7xODEP6svKtz0sbVkdHtmk/Lab5
        lZQ+TtfYiFvsj7ueZ1GMrCb4DoHsfjDRwbzEr+A==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr20662356wmk.96.1630306326154;
        Sun, 29 Aug 2021 23:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKes6qCmO78Vl1Mx8rIagHedcVuejvecLvmaILX7azR2lg3wu5LqUpJOXs2fPSLJi+OusJCw==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr20662340wmk.96.1630306326013;
        Sun, 29 Aug 2021 23:52:06 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.166])
        by smtp.gmail.com with ESMTPSA id x11sm14679065wro.83.2021.08.29.23.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 23:52:05 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] dt-bindings: clock: samsung: convert to dtschema
To:     Stephen Boyd <sboyd@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
 <163022098497.2676726.6455473597971395732@swboyd.mtv.corp.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7228126e-2ba8-bcba-af26-8d7ec4e33a62@canonical.com>
Date:   Mon, 30 Aug 2021 08:52:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163022098497.2676726.6455473597971395732@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/08/2021 09:09, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2021-08-25 06:40:48)
>> Hi,
>>
>> Changes since v2:
>> 1. Add reviews.
>> 2. Split Exynos4 ISP into separate schema.
>> 3. Add maxItems to clocks and power-domains (review feedback).
>> 4. Do not allow samsung,exynos5420-clock and samsung,exynos5800-clock
>>    without syscon. These clock controllers should always use syscon
>>    to allow DMC bindings access the registers.
>> 5. Drop assigned-clocks.
>>
>> Changes since v1:
>> 1. Patch 7/8: include header to fix clock IDs error in example.
> 
> I think this header file isn't in clk tree?
> 

It is in Linus' tree... full path is:
include/dt-bindings/clock/s5pv210.h

What's missing is entry in MAINTAINERS.

Best regards,
Krzysztof
