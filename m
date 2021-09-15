Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B7FC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 08:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 458EE60ED8
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 08:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhIOI2v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Sep 2021 04:28:51 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52860
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236686AbhIOI2a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Sep 2021 04:28:30 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4445D4017C
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631694430;
        bh=c0ktSqPBV6zrAWdMe5+J2g1bcwqmTCFhZ2hdgWxJG/Q=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=r8z8RovoeCkO2JbRfHjXP0FCMtPrffDtyK/YKArA4RNKv9X+tUex4nMncfSYubhYx
         4i+k3wYdI/c14QzbINMdMVb7lp4NU36PE5ZQ/irLVGi7Rq00CLDQy719FQX2S+LCiY
         kksJG/J2QTGUjE+7JybzRzbl4N4aM4u1pXXpP64EpxV7jWEOfKnWE0S2SEKVkZpvO3
         P6WXCEhrZbstUv0vAr2hQzZLFqDhlMcCJIX9JENw8Le6xuljL23aY6tjfeXWMih7QC
         vi2fCVELZPau9AJxA7JNyqjGm/TTiU7KH/T5BFdKI29hj8amdWQzj+IWkpngR8FMAx
         oHYaKNheB0NBQ==
Received: by mail-ed1-f71.google.com with SMTP id y21-20020a056402359500b003cd0257fc7fso1161964edc.10
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 01:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c0ktSqPBV6zrAWdMe5+J2g1bcwqmTCFhZ2hdgWxJG/Q=;
        b=ROLp+AJG7AQEPBKNRsRNT17OrfHgUZCTAg3mx+tZwR2QMNUC8x+kmwpzgZhYJPUZ4v
         on5hvhKFwP/zeeHBzdvYTRsJu8i+Oon3j+S7ef2rGsnnQkKtn89AqWBMfIVMp80fu1+S
         UeksGa251LdqlqNLAW/lVWClhkHjERq76ynT5z4uVt29aQTup2kKG6idcln8p3JyaX0A
         kgcDqfX/CDQX8Q0Pd2hmC7ZJvXjLnn2IfXYsqF9+mXnoOmce0uoh4gRQO3ncVbKN1csW
         rsHokVkHwqImZkrVQwS/29gFlAMBhu2XAJZb6FVQ56d6GzXxrODRcoJVt7kDk/OhVntV
         sDeA==
X-Gm-Message-State: AOAM533CEG3iHK9ZJhYX8+ZYUkYM07utT0Y5561fZZfCYJcCPX8QsJlW
        Oy0iDNxcgvHT1iMBrbp6OhN8WX0tk+IqGmeDt4vv3yHfBMfL8mi6hKg9K+krTL8LV4EI+QTZ89Y
        e/nZhSM5OP2sIY12VSbihv32CLP98RYbwpzWRqg==
X-Received: by 2002:a05:6402:42d4:: with SMTP id i20mr18825614edc.348.1631694429956;
        Wed, 15 Sep 2021 01:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJujQjYVHel2sNKzotlRkaiyjwxk4PvbAgB7ek3KN7SaHfnHfWRFV7KrDrr/6Z5D4w/Nh3Zw==
X-Received: by 2002:a05:6402:42d4:: with SMTP id i20mr18825590edc.348.1631694429780;
        Wed, 15 Sep 2021 01:27:09 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l22sm4804830eds.58.2021.09.15.01.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:27:09 -0700 (PDT)
Subject: Re: [PATCH 4/6] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-5-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <396f1761-567f-0407-7d95-acd7bbd38de9@canonical.com>
Date:   Wed, 15 Sep 2021 10:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  include/dt-bindings/clock/exynos850.h | 72 +++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 include/dt-bindings/clock/exynos850.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
