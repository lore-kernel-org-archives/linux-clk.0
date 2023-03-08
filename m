Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B158C64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 11:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbjCHLBZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 06:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjCHLBY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 06:01:24 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F1C3B3F5
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 03:01:21 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m6so20812333lfq.5
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 03:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678273280;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46PplNPKh0FsjNt1qLCmw7K0suqCCDaPvipsAUn6EkA=;
        b=kGloYsb+6IuCO/oXkSMT6uGJUV4qAr0Ay3d5c0V4VsdsU/yGn5f3KHEtNj+6vjKn+z
         CwcpTSYjujw0Mv0/E3w/SD2xyln8zYY6+O71m8BhQMNWBpcsZDOuzbGG2ju7O6OfoNIj
         P0a09kDZZesE0cSiE+BwALI5CjUlJE0SCnyrV2ct34ukcJkyVm8AczXLgek/hkGszSFE
         7I+VK+1VdGgXOi7PxvEDjUuQm8dbl7CALu7/2bOr/39dN+XFZudncbrCkAeReXHdzfSK
         4ELMUxbaQ/QGMOmVgFQUNz+N23a8I5dDvBUN5nYPqUDJxNgBb6GnyQr0Okyq4r1vLL/4
         mKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678273280;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46PplNPKh0FsjNt1qLCmw7K0suqCCDaPvipsAUn6EkA=;
        b=3Xm3HXw9hd0LM9MfN3eUN9Uno0uXiGFO4vU/lCCYPt1Be12XOVjJPuwpvAJl3JbGI7
         OZVbjtwfXzY6b3qm+QJYkfuGX6feoCDT0vLmc+LQkv872VSSq+umlFgB22zQwczo1KzA
         ZA4NcI0imFK+fkp7Zfal1u2FCBw1MmMdrrKQuuc/KW0eYNMRXtVuoP0Ij9S1q1ntOJ2F
         dLOEBRF/4yXkO2Tf8xbIEDwPbWVxR4nc/uV5vwXXvnhjZ/2ozzQ21xzi8JCEVRJ2cVaw
         N7xZ1fYlu2wQpDuaIZ9XHLXt2Mg99v1rLULlPsMI8dpGpgmmPMcauZBJONrY7IH0RaqT
         0O1w==
X-Gm-Message-State: AO0yUKW7ggv/P2pBGgPzGiczhHzqitbAfBI+Fa17Xr5fct2V+no1EUaL
        p9RZfOwJ+CR31oPbKO4z8XZbLA==
X-Google-Smtp-Source: AK7set9m0YF55S3CfW285NO2jwU/NUjTyfb0m0xwgBnrHAjMRPzJ/3HEPRPXGeHJ93s4uTJ0g1uGiA==
X-Received: by 2002:a19:550c:0:b0:4b6:a6e4:ab7a with SMTP id n12-20020a19550c000000b004b6a6e4ab7amr4806099lfe.8.1678273280189;
        Wed, 08 Mar 2023 03:01:20 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id m16-20020a195210000000b004db2ca9dd33sm2292462lfb.275.2023.03.08.03.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 03:01:19 -0800 (PST)
Message-ID: <754a2d38-dd7b-48b6-80e5-683ca193e0b1@linaro.org>
Date:   Wed, 8 Mar 2023 12:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V6 7/9] dt-bindings: firmware: qcom,scm: document IPQ5332
 SCM
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, dmitry.baryshkov@linaro.org,
        geert+renesas@glider.be, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, robimarko@gmail.com,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230307062232.4889-1-quic_kathirav@quicinc.com>
 <20230307062232.4889-8-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230307062232.4889-8-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 7.03.2023 07:22, Kathiravan T wrote:
> Document the compatible for IPQ5332 SCM.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
Does this board not have a crypto engine / CE1 clock exposed via
RPMCC? It will be enabled by default, but Linux should be aware
of it, so that we don't gate it by accident.

Konrad
> Changes in V6:
> 	- No changes
> 
> Changes in V5:
> 	- No changes
> 
> Changes in V4:
> 	- No changes
> 
> Changes in V3:
> 	- No changes
> 
> Changes in V2:
> 	- Added the 'Acked-by' tag
> 
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index a66e99812b1f..c1adbb83734b 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -24,6 +24,7 @@ properties:
>            - qcom,scm-apq8064
>            - qcom,scm-apq8084
>            - qcom,scm-ipq4019
> +          - qcom,scm-ipq5332
>            - qcom,scm-ipq6018
>            - qcom,scm-ipq806x
>            - qcom,scm-ipq8074
