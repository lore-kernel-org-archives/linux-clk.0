Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DB0C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 10 Dec 2022 11:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiLJLOC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Dec 2022 06:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLJLOB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Dec 2022 06:14:01 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F4E1901E
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 03:14:00 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id a7so7493981ljq.12
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 03:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEdNHDW8aV4+GrhCwlkduF28gNGqSKudgsovjGMC7nc=;
        b=ugaLRmbrbyL66tNKZL5euYF6YcgQrfBV32wHjShTRYgvzzO1stnmfT9pHLl/l1hgw/
         LKFaTY5TEY7BExVLWbH7vuMeO8t4rNIDzyqHIoGM34nKK+42cDy3zwja7oHoswjUWAZN
         mKMb9Yf7ugvHcz4Y1plWGWkMN6I/KRL4iqSVpjDSmaKYQmK4PonDM6qp5eBmK8qo0Wa9
         T07UgoV1aZaddWBt/q5aXZ2k4w62H2oEMcK8BDbZWh44pcxIlU5as7UIQnH9lgUQC74o
         aa2a1lfrlhy1xDODnNOeud7GVmbEBfeEgvF44Ijhvg7J52lxNNhFUCSZnsalC1D5rp2w
         94Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEdNHDW8aV4+GrhCwlkduF28gNGqSKudgsovjGMC7nc=;
        b=pOYZAcrQJvrTnalzOIM3zCYlwhKCZgddKmCUxwOpCxKD2yO3P8y4qR3SGbBT6dvLJT
         sBI/0PkTVSIsTMT87abZ+6OZrBZIIJnC01Oay+Qh0svHlKzusv0Q3ABeSUyCsu5InfUT
         w4ZPEO//+S2fT3l09jWZZrCOHhaQXi0GdN5f29XM8qP7g48BTLZM9HRUGIOgU7pdWzI9
         xvtvh8CkLFIyF8AFD7rxQwkm5DK7r1hjtG071qYdCJroIUOkc49LwVqtYCgn2yEk/zoy
         146Sunso3R+x5lcJ7yWL1cuGnexdHGbUwGzQRwEtrVGoU0MbnK43JhdeqGRk7NdnuZat
         jN+g==
X-Gm-Message-State: ANoB5pkUVSntAm2qpHSfSDnznk6FVZ4nhZIh7Dd8e+QRvTqU2tQz2MO9
        FGwqY5TmBTrenwpFrY6iIK3tFA==
X-Google-Smtp-Source: AA0mqf6Pj3fJwlQspdHSwfFJANKjnMwSvtDoex9iTt3EmjAbLf+okIdhqoWv2QMtoPSOPwXC3Xd7OQ==
X-Received: by 2002:a2e:3515:0:b0:279:bd34:dcd7 with SMTP id z21-20020a2e3515000000b00279bd34dcd7mr2408356ljz.48.1670670838728;
        Sat, 10 Dec 2022 03:13:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 133-20020a2e058b000000b002775d0ae776sm578784ljf.14.2022.12.10.03.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 03:13:58 -0800 (PST)
Message-ID: <deff0b12-8c44-6890-6db9-4634feec30ce@linaro.org>
Date:   Sat, 10 Dec 2022 12:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/19] dt-bindings: clocks: qcom: rpmcc: add
 LN_BB_CLK_PIN clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
 <20221209164855.128798-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209164855.128798-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/12/2022 17:48, Dmitry Baryshkov wrote:
> Add pin-controlled Low-Noise BB clock definition.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

