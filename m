Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9E5C74A5B
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 08:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjCQIgd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 04:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjCQIgO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 04:36:14 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645195D27F
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 01:35:31 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z21so17431433edb.4
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679042108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=07OTXx2gmMLFRss9R8SVR6w8+GwnhkoIhKvMHjHuNVc=;
        b=ai8A80EZYMu+akU8PJJAH0vLmlFE5cZf21etGygLHm7WkGc5m2AWbDpKEPboAKEtGg
         cDk+v46yqcKvt3wHzWiM0Z7O9EJfsbGc/Kfw3bkAIGk9o0b2LnXwB+2zAOF+ukDdHTq0
         P86U0Uo6QYIw3qlBoiXVjhs1y32UR4RHXlyYHFAWhjad1Khnjubc+0o19Hd65yCJQ1n8
         TNWlm7QrEuyf5NNtmb9WRWwgQhXBRts8PCiOoD7V/o+gZL8Itd3F7cLSvUADMXTDY/Av
         u677i11mEOYtwvUFAz4XVNe5wGWLjLPIF4dfetoukl3X2fmvgHmPHkS9JOnRoyyBafcd
         kecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07OTXx2gmMLFRss9R8SVR6w8+GwnhkoIhKvMHjHuNVc=;
        b=43uYfTepkX1a709UDV5zzjyCB34mCcBi2IDN4DQxqQCNSm4EhSMLrAbfNzYLcOsKVV
         FeQFgRycdAgBkgpyXj2Snxp7/l1zOcQdWZ3FLaIyKVnU1APMW2JHkpVABIvJ4H23SoOT
         HpCXEr501eF4hyVd0LHZdteaA3U/ck03p1dBxd+/vUv5aTzip/dPYZHkhdZ17hLkYfHm
         gQs4LPm+xfhlXSMzG1v0pGzFiS6Ta933ytmThOvoDPBv/0znxg609OW+QcI6OdLOKbIf
         yCG57oJJ+pxiYCsCzV2CWaokaN5CeSCLmSzHX68ZyUCHdpqd13rfwef9NQD0RwjDdcDb
         bWDg==
X-Gm-Message-State: AO0yUKVxE80CWxfFPB5xwoU2p96gBvQcma5wyT6Li2BR58vOhUeVSBKT
        kr+4gcOUhaKrZZTGFFQL6eiRVQ==
X-Google-Smtp-Source: AK7set/+48dKcFx/8P464kE7iY8BqOjmSZI43xkWsJ1O03iz6ApiZBygnsSNSGscwiEjgAHKIe3yCg==
X-Received: by 2002:a17:907:c22:b0:930:1178:2220 with SMTP id ga34-20020a1709070c2200b0093011782220mr7382695ejc.40.1679042108106;
        Fri, 17 Mar 2023 01:35:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id v6-20020a50d086000000b004fb00831851sm722831edd.66.2023.03.17.01.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:35:06 -0700 (PDT)
Message-ID: <0344c3a8-fd24-ef88-880f-a70bf6d28d71@linaro.org>
Date:   Fri, 17 Mar 2023 09:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: dispcc-qcm2290: Add MDSS_CORE
 reset
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230316-topic-qcm_dispcc_reset-v1-0-dd3708853014@linaro.org>
 <20230316-topic-qcm_dispcc_reset-v1-1-dd3708853014@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316-topic-qcm_dispcc_reset-v1-1-dd3708853014@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2023 12:48, Konrad Dybcio wrote:
> Add the MDSS_CORE reset which can be asserted to reset the state of
> the entire MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

