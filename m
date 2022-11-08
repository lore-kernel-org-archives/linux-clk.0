Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6470C43217
	for <linux-clk@archiver.kernel.org>; Tue,  8 Nov 2022 11:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbiKHLOE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Nov 2022 06:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234031AbiKHLOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Nov 2022 06:14:02 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109AAF5BD
        for <linux-clk@vger.kernel.org>; Tue,  8 Nov 2022 03:13:58 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id s24so20562021ljs.11
        for <linux-clk@vger.kernel.org>; Tue, 08 Nov 2022 03:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uEGHhzKbszqMWjuxMkREdBe3r8rfRgsqdTFsuaG+D8g=;
        b=NJ7n5tDHA4FKrxdgKfMSK0JsHzzrPAaCYu9uFHzMI+iTMHzefvTrNRAMFyVDOa+Oke
         SW0pFZ6VU3hfW9BacyR3YDPhurrPdQ0CX54079uUcGSkc5ci79eI5s0ENkwlVcxMumu/
         JMK0yeEhyIe1tAIHjkny0+Qi/juWsPUek0fiUAirUKHM5bRLwFLmsv2ymf8Bl6bDntf0
         tuL1j5f95LjnqRlvoeZsSRpFgW/3+N+1BFu3GByNkq0kjw6j317MtEYkxcg9K4hmGmsI
         eqTliulwoOQVUFWIzLRzamvebCQH9XKIIvLN+FNGAVwTENV0KufYpY8qdPdCT3s/yVgO
         QkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEGHhzKbszqMWjuxMkREdBe3r8rfRgsqdTFsuaG+D8g=;
        b=quOzOlXVp8iCQsrcTrqmhTh0aZa2XgIixlW9C4BvHNQfPEhmVL4o+0SmFaEblJRVgB
         thq1n1cTOAw6OdwC2RxayHbJnQ6qPaCsP4tw1eQo1lhUbdxvwXMYNWJsULpIclJAMtqt
         TwoEDQFgg/pXYa222Pqp/mzoGs0fD0QiKjWXVL1pUq2SNKZ+9xb0KXaO1TdX4pGdMGCa
         baFZoBRhdOXcKCL8QuRWR3pImu2A6TuEzFOCyIiKy8IgwUc5A/AQc0z5loS5BZnBiY4j
         jVzvcxsTmxf6NC7V5Lg/jlkeai+WqNGHtgjqi5a0vBWhbi+fu0ShjXIALaKloWjnd4Q8
         kVvw==
X-Gm-Message-State: ACrzQf1b24OJ3WLo7sRdhT44cDH036bxX2J1Gl2cRFWLWwplCdCiIyuU
        wSZvO4YNyDBwie2bhNaxydIrAw==
X-Google-Smtp-Source: AMsMyM5LerxL9uLhjvhqx4rdYZ00h9GhQiY/qVsIX6zMEtdfJqU1Zg/x1+q1u6X6IVzcNyzLs9GczQ==
X-Received: by 2002:a2e:8ec6:0:b0:26d:f909:6b7f with SMTP id e6-20020a2e8ec6000000b0026df9096b7fmr6984570ljl.482.1667906036420;
        Tue, 08 Nov 2022 03:13:56 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b004b3e6010827sm685992lfr.66.2022.11.08.03.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 03:13:55 -0800 (PST)
Message-ID: <37f8f24a-0f25-2f3d-1bc6-de9d5556d18e@linaro.org>
Date:   Tue, 8 Nov 2022 12:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: ipq8074: add missing
 networking resets
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221107132901.489240-1-robimarko@gmail.com>
 <20221107132901.489240-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107132901.489240-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/11/2022 14:29, Robert Marko wrote:
> Add bindings for the missing networking resets found in IPQ8074 GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 14 ++++++++++++++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

