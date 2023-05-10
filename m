Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE86DC7EE24
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 07:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbjEJHJ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 03:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236461AbjEJHJy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 03:09:54 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5F9468B
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 00:09:51 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so12227255a12.3
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 00:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683702590; x=1686294590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJvf3WnGfiNmFmKHLfiwqmHicsidW15LaCdZqZNR7to=;
        b=CaBXCo7zlGmZqcb46dpr5dnGUiRLX2GuWsmdUXt/KlWSntoyOknfpMG0/Vilp4leNh
         ZQNxDXGovRR/jmNIhBVBZAL1ggvoi/MWDP7SGMQTUcO3LIV0vWHcin0oMsAZQSEfs3/W
         ga/03SxrGNCOzBLAimCOfRBr51ChkvwcjZfu8TRNC7QY8eL20Z6ZTp0HOWXnMJ1uPv2L
         7FxrL9Z/T0+jLqZsqw88TP3nsPrO3/+yZU7qnZJ6DELwjVGLkjxNOs3QFM7moQVgEsFh
         oXzCeUPk0FTa/EaV6alI4R8urepPEZm+cDVxzy4P+I6NYdxTraSDR6dA643OR2LM06qj
         qq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702590; x=1686294590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJvf3WnGfiNmFmKHLfiwqmHicsidW15LaCdZqZNR7to=;
        b=VzLitDWbyPwVhUjrxdGUMnei1iDmjgaefVWO0e/K2+D8MbE7k8cFoQbLwUInK6buef
         YUJ5766H8qkSWp8E5/vyU6TNTl7mdp6rHzfvodQFaUgpQUEnZOU5Cb3iEBLQkZOWmzE+
         zm066BTgC74PAH+VFZy5YzObJggMJJRkxL6hY2kr3zQEW3SQNiyAJ6sPkLvh8ciJRjiy
         3XRql5bHFBVCfBWxZN2oTPTIJYCmzC/2DMPRxv6SJCXqFw2xfdc6lU311CZr7xERteKR
         A38MLpWuRQqz1PHgwWpfcxl9nPNlQT0adcJVk8TDKBV8LUqH75nHUWVljD5ZyYDXE4mU
         eqpA==
X-Gm-Message-State: AC+VfDxW7c42As0alQGMaYMHFTjlpcHqbCbJqvkvfcJtEb9ZPT65pp1y
        D3pjp/nD2525RvEBW6E3r589Gg==
X-Google-Smtp-Source: ACHHUZ45V9nWx+xpymCCTDt+xqMHZN//QImYns3SLixe0knjRClRjdgBA/A6jG8Yv/UnrJA85OvrJg==
X-Received: by 2002:a17:907:8688:b0:96a:3005:61b7 with SMTP id qa8-20020a170907868800b0096a300561b7mr612454ejc.74.1683702589873;
        Wed, 10 May 2023 00:09:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id w21-20020a170906131500b0096637a19dccsm2277509ejb.210.2023.05.10.00.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:09:49 -0700 (PDT)
Message-ID: <0ffa55bb-9869-f94a-17e8-46530c2d91bd@linaro.org>
Date:   Wed, 10 May 2023 09:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom,mmcc: define
 clocks/clock-names for MSM8226
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230509-msm8226-mmcc-parents-v1-0-83a2dfc986ab@z3ntu.xyz>
 <20230509-msm8226-mmcc-parents-v1-2-83a2dfc986ab@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509-msm8226-mmcc-parents-v1-2-83a2dfc986ab@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/05/2023 23:16, Luca Weiss wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on MSM8226 platform.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

