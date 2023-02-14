Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD19C64EC7
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 07:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjBNHzL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 02:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjBNHzB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 02:55:01 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A644C3D
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 23:54:59 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso5489946wmo.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 23:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rASM4GtwEv6A6VC897FWRddFEUTP7URyGdCEO2oh+gY=;
        b=f16GTHa/pdOIC9J9vcbdM0BjaRiBKE+1kjIHvWRG3nQp9xiBHSkbFw9ROQMfSFCUrC
         oQqL2MwNucZOa4gTgYl7gI5UslkZLoVipX6C6QFeBed6gZuy+MX1RDGZxC8dScZqP/Uc
         It/uB9ip2aGFSa3KzYL1gBmMVOytNaImhFWpoyfp23oIWl4e8ytc7dsJstpo8sj54ybE
         tJfw2JYzNoZ+sZEoifmPiV/qNsNRFXFKW0/+PD740w8SIF5UBM/HIpqcwQ5Yf6Y097VX
         IQY4RlmZKliTB75/An5AAXU7VNXQ1Lb9SZ4bh+FyJsNteXOsRVHJeuKl1oFGxDmuBObS
         zcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rASM4GtwEv6A6VC897FWRddFEUTP7URyGdCEO2oh+gY=;
        b=Sf9HhV53Uj7GLc+0lCckKok5Z/qnRXdk9Mghu9D+reFVSGgAxC89jgDf7+Q+V2S2pU
         ZNEqBOa/juo84T2gf1oMIc+GxK9fE+fMhdHFYjIZqVywVYk63+/cKY1yBmkWAsOUH6TO
         AEO7sLrq2eokplZN4gtXJ+d3ptNTJAgHfy4exTFZ1VhVBTzmjzYrQaBetUPihnmnUtw4
         Sj1tBKPkAifOQq/cMwSKdH+2j259DdvK6sOoSa9nmuPobwkrB7ZRdta/9qbtJQNWN++Z
         nxFJWiIpyr330Q/BODBEAAut+Qet5/TfuHGUCTde95jDevPPGHDZKXNYIaQwkX6UKpmj
         HwYw==
X-Gm-Message-State: AO0yUKVI6BSI05SO4GpA6QfYrIZ3R3B9rBw7cGI/qQTKCLnuGdG8pwZd
        B4hM5vhhITpd7AenEALNEy8VPQ==
X-Google-Smtp-Source: AK7set/E+wgr6jNBV7zNI1uHEzBj/wkAR39oQT+JK97s+nvlCKeNm4Zuck24OnT9MRDBKOdTBHpSeg==
X-Received: by 2002:a05:600c:329a:b0:3dd:1c46:b92 with SMTP id t26-20020a05600c329a00b003dd1c460b92mr1812419wmp.16.1676361297605;
        Mon, 13 Feb 2023 23:54:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003e1e8d794e1sm7701538wmo.13.2023.02.13.23.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:54:57 -0800 (PST)
Message-ID: <b6f4041d-5c1d-bf1b-1ddd-055576447c33@linaro.org>
Date:   Tue, 14 Feb 2023 08:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V4 1/5] dt-bindings: scm: Add compatible for IPQ9574
Content-Language: en-US
To:     Poovendhan Selvaraj <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        robimarko@gmail.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230214051414.10740-1-quic_poovendh@quicinc.com>
 <20230214051414.10740-2-quic_poovendh@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214051414.10740-2-quic_poovendh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/02/2023 06:14, Poovendhan Selvaraj wrote:
> Add the scm compatible string for IPQ9574 SoC
> 
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

