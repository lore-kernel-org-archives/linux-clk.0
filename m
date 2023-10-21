Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761D3C001E0
	for <linux-clk@archiver.kernel.org>; Sat, 21 Oct 2023 17:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjJURFE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Oct 2023 13:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJURFD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Oct 2023 13:05:03 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76515F4
        for <linux-clk@vger.kernel.org>; Sat, 21 Oct 2023 10:04:58 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c51682fddeso33292641fa.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Oct 2023 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697907896; x=1698512696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tg4luee61pXuzS4dMkxS68wnrt5RPD0pUcOefOjPqD4=;
        b=lZIxQYL1LHJs/RMSwUhIABrphKMegscdSmFHaMCoAsYJzsdtIVUl/x2fPA+yzSWh8n
         a9iM0koIpnAp+e6s+Z5AYL2joos/wUyl1xaTny/YLN5DAsPd44IlIpa78ANT7FoiAfQN
         Fgvl686eyT+LjbYc/jwoKBk6Lbdjy8sKIuAzLDTLcyPkWTv3GAPiIWrRDsypw7EzIq4k
         oLzE0RAGKJuR6lep+bd6apRu8CI++QOaw4AaF3o5dTmN3wxo1GGEMpJ4QG4tcVZqb5jT
         QZybYZgM5663Ibgvzewc+aWZXRrzU+ahyVfzEY1zeb+paENmdm7Oph5y2pqT2jJiboI2
         Ud0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697907896; x=1698512696;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg4luee61pXuzS4dMkxS68wnrt5RPD0pUcOefOjPqD4=;
        b=j3d+HSoJx2kIGA/61i/XiL1nLKokMaOhYTUwnYub6wi+qJgcs4hYcjN/X3w2pEuT+y
         pHk8MaGOI4OkhZHk87ujCJ0Eiwg6Hq5E6RNMXbe/rwOwJvNg8S0C7xxfnItG3Y1MUjn7
         8fbzG9rJL9Hyh+mC3XZMTFoM56qj8b/sioaxFtRPsqVCLFJhHEjzgZb6RMz8tRoTUKfl
         TiXHqkwGXKdwPJoZSTK6C9xLoM5ucdSUYZRt6TECH7MZXDJO6w2nAi3wRgwVTHDalIB1
         dbtr3FFvhuCQ7wWF9eDxW04OXrG5mTVULdIZ0jGSwcwI3qxOAtAdsfiwoymc8FYOr67K
         qpRg==
X-Gm-Message-State: AOJu0Yy0MJDfSWron+DDQUKmOmi8p6ZuXiTWdz3u7VBi3q0qX6nBxfBs
        de11SqmXI0Y76QIHWZtZdhawMEP/T8Vxmmh6F3I=
X-Google-Smtp-Source: AGHT+IHgb0LvlG1YXi/MM11Ad8QU0L/952pLT3/KLCvu3nTVbTbnlMPKmQdSgo0bqvEZkUHUVqMQaA==
X-Received: by 2002:a05:651c:1509:b0:2bf:f90c:4029 with SMTP id e9-20020a05651c150900b002bff90c4029mr1971419ljf.10.1697907896597;
        Sat, 21 Oct 2023 10:04:56 -0700 (PDT)
Received: from [192.168.1.116] (abyl4.neoplus.adsl.tpnet.pl. [83.9.31.4])
        by smtp.gmail.com with ESMTPSA id x22-20020a05651c105600b002b9e5fe86dasm875896ljm.81.2023.10.21.10.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:04:56 -0700 (PDT)
Message-ID: <b5033b2b-a39a-41d4-b47d-f120743a79bd@linaro.org>
Date:   Sat, 21 Oct 2023 19:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] clk: qcom: apss-ipq6018: ipq5332: add safe source
 switch for a53pll
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, ilia.lin@kernel.org,
        sivaprak@codeaurora.org, quic_kathirav@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <cover.1697781921.git.quic_varada@quicinc.com>
 <49422d258d67d33a2547fbb7f4f6e72d489c2301.1697781921.git.quic_varada@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <49422d258d67d33a2547fbb7f4f6e72d489c2301.1697781921.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/20/23 08:19, Varadarajan Narayanan wrote:
> Stromer Plus PLL found on IPQ53xx doesn't support dynamic
> frequency scaling. To achieve the same, we need to park the APPS
> PLL source to GPLL0, re configure the PLL and then switch the
> source to APSS_PLL_EARLY.
> 
> To support this, register a clock notifier to get the PRE_RATE
> and POST_RATE notification. Change the APSS PLL source to GPLL0
> when PRE_RATE notification is received, then configure the PLL
> and then change back the source to APSS_PLL_EARLY.
> 
> Additionally, not all SKUs of IPQ53xx support scaling. Hence,
> do the above to the SKUs that support scaling.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
This looks good, however I'm not sure if registering the callback
only on SoCs that are supposed to rate-change isn't
overly-defensive. That said, I'm not particularly against it.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
