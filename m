Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A7AC7EE43
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jun 2023 16:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjFJQkF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjFJQjp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jun 2023 12:39:45 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D923C01
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:39:15 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977cf86aae5so425759666b.0
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415154; x=1689007154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYRNaZZWvIO3JyhV4C5ts/iImEde7OfTy8GQTAVDiq0=;
        b=NRTuQOucr9g/g0w9Rn1gblcRZDMbm9wB3TOFDPjKnGQZkpLvFTRd6UnmA4u7x+zRj8
         Kk0DTGui5luvucKTcoMW+Kvq12rbRbcMt/1HQX2T/vJeesfx3WgA7CXw2wJFqsDm9Ovi
         P6+RxlGE5uxW9KVTcFHQW1DDZvldHJbzMxD0/kLRr+Ap2tQCZLrragyrGi0MNg/T9HN+
         8Gw5fbCqDmDyBzAFEBNRwy0tOdpBn15OgvGEZG6NI5sF66Rzb5QZjpKYNv6YpvHIQVvW
         eCFWu84WtrRdSkVLaCy/bKoeBi4OAIR0ChSfgOnnT7G9HzeOVjV3weGnuuD0yla4Ye9A
         U5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415154; x=1689007154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYRNaZZWvIO3JyhV4C5ts/iImEde7OfTy8GQTAVDiq0=;
        b=izPWzsbBxa7RPag8PVFNCm6cMt8jitpx+8DgM4/NxFetx+PalFcFxJyS9yWl7eHXAV
         RNU227dMlcsdo43/enbHMG7l+sBWJj3kGOrL6J9ViCM+JTG6vPDYXeCfUE+jt6rCS5qb
         nvVx//uIz3LVaXPOepOESo+Fc2kCozbDzvO7113aw5dvcpwaP9SrSJfufhPPQlNSpCI4
         iz68qbN8HCAKejgKfUBJNfTlToqsWXLMkKosOrdYxvk1exzCBCKZfbA0etERv794bUAB
         nCnlX+oNsm6XE4fJjExbkRZuOR7J/vwC9ZNjUvDFy9CIwzg0lyA07ngL9+nEr5tAiMDq
         +Kzw==
X-Gm-Message-State: AC+VfDw+bt1GTRnUySL59fc9u6PXVKjgrHnPjruSiR+gdl/MkAzGGS2a
        2YNGNlC3UGnmnwEC621xKRvbOQ==
X-Google-Smtp-Source: ACHHUZ4RlNWgvJaw5Czsbg2CvOrwzUP7dhxbLbAtcji3Fh6iECuh9pfdfKxpju0rExcl1Z8DC50kzA==
X-Received: by 2002:a17:907:7e99:b0:967:5c5f:e45c with SMTP id qb25-20020a1709077e9900b009675c5fe45cmr4491929ejc.0.1686415153969;
        Sat, 10 Jun 2023 09:39:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lr12-20020a170906fb8c00b00959b3c30f2csm2715157ejb.222.2023.06.10.09.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:39:13 -0700 (PDT)
Message-ID: <9f0a9234-b453-69a8-859d-84c0d43a303e@linaro.org>
Date:   Sat, 10 Jun 2023 18:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 13/18] dt-bindings: clk: axg-audio-clkc: expose all clock
 ids
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-13-9676afa6b22c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-13-9676afa6b22c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every axg-audio-clkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

