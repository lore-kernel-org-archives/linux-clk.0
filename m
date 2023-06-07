Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCF6C7EE2E
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 18:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbjFGSgy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 14:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbjFGSgq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 14:36:46 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5822107
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 11:36:26 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5149b63151aso2003475a12.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 11:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686162984; x=1688754984;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3nc7yvS38a66Hs/mYzWRVagS1AxICPdH5Cqth3w9cQ=;
        b=D88sJsHC5TTSdVjCNnP8dKHKMCecaWzVZpY/ySjxfeX/wCpPElfsvttMwSzcnkaj2E
         P4JypKreP1nAcb1QUqZ3pFxqYBhi2YsbZhDmCt9Fticnv8dwQcMwGDBB2/SJidLpZLgN
         73G0VSePPUsBfiQEAG3MeIUSHjhn2BkOR2Xt4mpzMbG+1NUO9B1gMPHED/seiV/xfkLR
         FTIw1eN8jnt53k2LBNOBdRUs8MI1nzP70EG41krrWyKD+/Wy5r9xIpyWAQzhaY9eeKRn
         OH0LovT6zCYnMlPDgkOfT4K3vCcBrsLeSXfxN97zuuucZ6Mhc/Xe8OuPjqJrcB6MKJRT
         qjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686162984; x=1688754984;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3nc7yvS38a66Hs/mYzWRVagS1AxICPdH5Cqth3w9cQ=;
        b=eM2BFHaCQsPjaIIiA2MO3PhL1IgIhN5PWkNBgVB72eLs3sls52UFna+9wcvFkbItg9
         aP7aMYV1c4YqpCuBhubnOoKre+d72kRtS3hMxKAgtn4s3/9SYGNzLb5WRzCW/Y7jB10R
         vFG6cPClWKyCvXlhf8yGGAdnjG+msbhpuwDT4CXLzuTQ02dgbsikBxXw3e3nymlc8kuD
         rvmnPg6/kWahuP68sUv65F78ISZLsf+FRe9WEgEs9W9HRueqxHp1im4M9eHXWjooqIJB
         c035lcR8VddKOG92qAiIPGkMdpR4/7hlyMyKgCXqDJyNTHupXKEdn4BY4P/V7IHL2Z52
         PquQ==
X-Gm-Message-State: AC+VfDyk2vNEU7LpvRKmKyhBaPZhsMsHGzuj4TLYI91VLwrIPXu9LG16
        Dk+wOm8HWXlyVkKlUpZvYhOZQw==
X-Google-Smtp-Source: ACHHUZ7nGuEhVJ38jsgvyId2kGf22wlefHu+wUCPOAjlvIRMer4MbAKklw+bmZjp+BFcARuqC7UR0g==
X-Received: by 2002:a17:907:9718:b0:978:8685:71cd with SMTP id jg24-20020a170907971800b00978868571cdmr2751998ejc.71.1686162984584;
        Wed, 07 Jun 2023 11:36:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s10-20020a056402014a00b0051422f31b1bsm6389826edu.63.2023.06.07.11.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:36:24 -0700 (PDT)
Message-ID: <21bfe86f-8257-d0ff-883b-bbe451d8f77b@linaro.org>
Date:   Wed, 7 Jun 2023 20:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 9/9] arm64: defconfig: Enable QCOM M31 USB phy driver
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <55f51785b36b9725fe5283a58230aee4e89b4d6f.1686126439.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <55f51785b36b9725fe5283a58230aee4e89b4d6f.1686126439.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 12:56, Varadarajan Narayanan wrote:
> Enable QCOM M31 USB phy driver present in IPQ5332

What is "QCOM"? If acronym, extend. IPQ5332 - provide full name, so
"Qualcomm IPQ....".

Best regards,
Krzysztof

