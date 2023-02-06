Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957FCC05027
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 08:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjBFI1I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 03:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjBFI1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 03:27:07 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAEB166D3
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 00:27:06 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id g6so1576826wrv.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 00:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmhZ/cYGiK2NsFEJrNtRjrWEbvnT/SsUaI/b0pdgW8Q=;
        b=YYawh8K13sKDMpfR15eXt7GbxkLub92FItJh5ABEyqDFbvdxbvO4FpTZhRqzGTAYlV
         kuRn1ynIJMD53EHsn5td+rov5O4u1YRci+pP0iYyGkusnnNJJTA5uY0PKTG0CZnCtBm4
         C2gse/5SPCidue/ehAbngXRep6z3FrT/KHscjNOuQtFz8fRXh7Vo+vhEg0zLkvsDQH3n
         yaNNcdWpbScd8IoXmiqGTrEAkYC5tCvrxcV6IcmbyDPK6Vjogf07glEn1G7v1qVyqzI4
         WJ6mcl8ABuAkAzOJz+VZvTNYnx86IR3c+o+YOymJ3Yv+RL2+j2Zhe+4aBaqTkluf1XHg
         RaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmhZ/cYGiK2NsFEJrNtRjrWEbvnT/SsUaI/b0pdgW8Q=;
        b=hbww2pmRIrD+xkA/eJJ81lGdeRq5JMm8OLpJYgOVVB9dT4QZiCagRQCV3dL9yvkJis
         x6M0Jl7mP2cF2Zg0CEhagwr/8ro0tL2+3Y8yIhfmz2+HHgbUMIN3sNejRB1firCWQS1t
         qS31j1m3l5Cp7iGu7/IIfJO90mTBE0aqLsTrmTS/LCbm1dL1lyRZS1tjREytu39weciI
         a+cjbRDLus4Q2RutKVu/Z0D0MSmSInZOMdiokoWk5X1UN0BMta0UwdGGG4Vg94q/wEGi
         inlgIJssWBDRfgP0yBrIIhJoqaeQubmEgm5af8+kH/fY4pbU+WvcB/d6QIgPhdHxbtiU
         CWfw==
X-Gm-Message-State: AO0yUKXVNy/8fCU1M580Sz+EH2RANIiELvjPgvrlc+8ranZTggWJDO/f
        zz2HZiSxTmkEuPVXDmukdbHdXg==
X-Google-Smtp-Source: AK7set/8W1aN1TDu/xRGsUyUU3hUWmAplZgbq0G+hxTv+5AFTuvi+l/7/dpCpqIPNl6FmBygYkSlZw==
X-Received: by 2002:a5d:4e4f:0:b0:2c3:ea65:cc7d with SMTP id r15-20020a5d4e4f000000b002c3ea65cc7dmr2708362wrt.55.1675672024802;
        Mon, 06 Feb 2023 00:27:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d17-20020adff851000000b002c3dd82a0e9sm5612966wrq.91.2023.02.06.00.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 00:27:04 -0800 (PST)
Message-ID: <42b995b6-3437-518c-7c9d-fa0dcdf419ac@linaro.org>
Date:   Mon, 6 Feb 2023 09:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 4/9] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20230206071217.29313-1-quic_kathirav@quicinc.com>
 <20230206071217.29313-5-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206071217.29313-5-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/02/2023 08:12, Kathiravan T wrote:
> Add binding for the Qualcomm IPQ5332 Global Clock Controller.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
> Changes in V3:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

