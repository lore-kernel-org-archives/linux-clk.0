Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A056CC3DA7A
	for <linux-clk@archiver.kernel.org>; Mon,  2 Jan 2023 16:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236431AbjABQD2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Jan 2023 11:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbjABQD1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Jan 2023 11:03:27 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE64E5E
        for <linux-clk@vger.kernel.org>; Mon,  2 Jan 2023 08:03:26 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s25so29394149lji.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Jan 2023 08:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=am6ZA2IygZpjsFVfOboIQOY/eHsWOf06mjYmev75JTQ=;
        b=FqLAxO7dWspIsHLdjdPJMguYSjgNz1BL0qUSVFO3paGpfOYPkgY/A7Ej1R8zeIfU7/
         hcQyWr55DTXBpcVkgDrG/V8Ih4UknDB/0De4Y9er63fp2SLZBdjW3qmzY1dIeiTFXJMy
         fGHXgPD7ZSgn3S/272g4KDh0no4iA8NTbsx8Kmw2VLRH0T2/CGUfTAOV8LOC+ll7jJqe
         enjlcXTA6pMGP04kGCN/9h2DBalNlT6DgeSCEzd4DF2RZ3FI/0a+HdVHK9f2YYx0oArJ
         1aonOoRRKoV7EaEXPwtdnplhCieeqKoQZJOra5adR0EF6OC2kRQ0MzSmOwR1xJQFA84F
         YMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=am6ZA2IygZpjsFVfOboIQOY/eHsWOf06mjYmev75JTQ=;
        b=49EQ+iSKAMZQjK/oWPuyBSnbTB0m+7zB1h0UFUqgnMFc1h76j+0TlvEraJg+Om1R3y
         23YJPrX1r1XGCtP8WogsaFUDqb6dTmWp9nu4rAFrECEhATOdNaBUbX2jjfr2N1STLJ3A
         iHPkH9yO81qVSypSVP2W2XWAfInelVfq2vmdyx4NuwSemYvd9KLsD6hIVDa2N+w6UpV5
         UYzbsn1bYLz70f5LvEdnBE5cq1yZUMuRTn2O0Un91ejCClJNRGqV5/lBpvElyOFwJdzQ
         Lm53LvEOntDSDPFwitp0TbTi2mFOtZxmcK5YlV8fKWZ38/LE8o15KZG24dx6zO+4SIJL
         vTSw==
X-Gm-Message-State: AFqh2kqWQ8cxV37QDmSDlwsIja3bqXNyt8UN8KEnAC5afDal2RYoxkLe
        mmRC+C/bdxcf4JYW+Axly1NxPA==
X-Google-Smtp-Source: AMrXdXukcDTEmLeG0Pm6NyYJLX4Me3oHOABqZu17HpqfJkbQeJ35Lo2shsFJ6YLbjC5sU5q7zm/BhA==
X-Received: by 2002:a2e:9b15:0:b0:27f:c5b3:792c with SMTP id u21-20020a2e9b15000000b0027fc5b3792cmr6539138lji.41.1672675405001;
        Mon, 02 Jan 2023 08:03:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p7-20020a2ea4c7000000b0027fc5d5dbb5sm2047016ljm.77.2023.01.02.08.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 08:03:24 -0800 (PST)
Message-ID: <0d225fb0-7bc7-4de0-0f07-039502926e6b@linaro.org>
Date:   Mon, 2 Jan 2023 17:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom,sc7280-lpasscc: Remove
 qdsp6ss reg property
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1672407799-13768-1-git-send-email-quic_srivasam@quicinc.com>
 <1672407799-13768-2-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1672407799-13768-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/12/2022 14:43, Srinivasa Rao Mandadapu wrote:
> The qdsp6ss memory region is being shared by ADSP remoteproc device and
> lpasscc clock device, hence causing memory conflict.
> As the qdsp6ss clocks are being enabled in remoteproc driver, remove
> clock controlling in the clock driver.
> 

That's an ABI break change. You cannot just drop it because the driver
will fail now to probe with old DTS.

This ABI break (and Fixes tag below) requires extensive justification
where is the bug and how it affects users. Otherwise, I see no reason
for ABI changes.

> Fixes: d15eb8012476 ("dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280")
> 

Drop blank line.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
> index 6151fde..9c72b8e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
> @@ -33,12 +33,10 @@ properties:
>  
>    reg:
>      items:
> -      - description: LPASS qdsp6ss register
>        - description: LPASS top-cc register
>  
Best regards,
Krzysztof

