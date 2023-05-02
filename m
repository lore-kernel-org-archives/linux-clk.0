Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFAFC77B7E
	for <linux-clk@archiver.kernel.org>; Tue,  2 May 2023 06:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjEBG6T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 02:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbjEBG6M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 02:58:12 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEA74237
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 23:58:06 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc22805d3so3727476a12.1
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683010685; x=1685602685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6m9RHcIPcK/mHhABU/sY7MA/NMPTV0i7puXCnV2P8jM=;
        b=AnHYGyl9itgQMEjkltPT+i4Jr7vO/8WkLQF7cmothsCUHAG91C5ouOsC5STPn8IJxU
         eNuVB4xjBgKpICryps4QKnXzm3qarOOPMlFDqmtf/MU3OQIPRjVgV8RhKbqIAZQTTP2X
         jNbM7sEbvHl1w1y1aaXGe7GHcVfzSqc0TlW1lGjL9xMie09vWLHOrX+bJrJR6kUe08Tj
         1LXyQStByajEQPqUf5wMOBioM7pk7l8TrlZ/ZFrBmg6fjbP2H2OIVI8xu3mDAFP2zE3d
         W7X+kC/JQwOgw516x8dJpmZKpHWV3pAFbX4EcUQKh1O4nexdEKmHMUk1kCkL7FNYJ8zo
         Mvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683010685; x=1685602685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6m9RHcIPcK/mHhABU/sY7MA/NMPTV0i7puXCnV2P8jM=;
        b=Cjbcjnk7vqohCC2/nT7YgZeshfrmd5ZA53XwnRZcXzkKtQ9H6Y7MDrhY23l7q/tAZd
         TI3GMduNigE1YIHy0Imk37TA1gFr4snafbpAovAK5GnAAQ2kebFS8ZQeNSNdpQX8pcIe
         IbDBO2JT9LLu5/A+dehsveZ5CwYZQqhrFEwym7r6Xz/CVbehB6LVwHp9P76pUcevPMvM
         rNv5+bx826Ubvn42zW0kPPmd3CQGzAab47HNhbQxlcuSZQCAXhxK84+iYac43Fu3FjUQ
         uZxUkZ/OfMkDBBEcmJOV9phyUvniU13prJxFxyCByIfHdCmxF5BQ5Pjky9Or8Lk9NXzD
         PEsg==
X-Gm-Message-State: AC+VfDzSTkotyut43J50QI7nOJ0a3uxlut5AejxdQoa9ZRpRoi8IfLj/
        Zdu8u7P/l+PYlBYsRmn1tovYlQ==
X-Google-Smtp-Source: ACHHUZ5r3ZjPDDTyDDUni0Wh82eRaJzFkTRcqEvQUQEebLKQ4oCLeeRw1bsL3dNlISDXnD99fP7LoA==
X-Received: by 2002:a17:906:fd84:b0:94e:d72b:d10c with SMTP id xa4-20020a170906fd8400b0094ed72bd10cmr17096058ejb.40.1683010684997;
        Mon, 01 May 2023 23:58:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id rv13-20020a1709068d0d00b0095952f1b1b7sm11918971ejc.201.2023.05.01.23.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 23:58:04 -0700 (PDT)
Message-ID: <1c66d8a1-b4a9-1127-7884-5c36ea03b1b0@linaro.org>
Date:   Tue, 2 May 2023 08:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 01/10] dt-bindings: clock: qcom,lcc.yaml: describe clocks
 for lcc,qcom-mdm9615
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
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501203401.41393-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/05/2023 22:33, Dmitry Baryshkov wrote:
> Describe parent clocks used by the LCC on the MDM9615 platform. It is
> the list as the one for msm8960/apq8064, with only difference being
> pxo/cxo replacement.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

