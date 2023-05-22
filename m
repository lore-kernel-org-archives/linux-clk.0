Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ACEC77B75
	for <linux-clk@archiver.kernel.org>; Mon, 22 May 2023 08:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbjEVIg5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 May 2023 04:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjEVIg4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2023 04:36:56 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19332BB
        for <linux-clk@vger.kernel.org>; Mon, 22 May 2023 01:36:55 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64d30ab1ef2so2264698b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 22 May 2023 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684744614; x=1687336614;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcrDpdT0P9HHoECV1vJkLFWVWwbxP8Fr74ykIaaMjzU=;
        b=B1RoD1yqTtItp6r3dhSCZiKiWHVenEw735/3jc4hF+NN0Z9eGPuHCZ9KUjyzCgpynX
         rjbwysUxw7q4InK+r8ctWMTyoFgSy9POLLwQbmznuI2ubUyLSg+sGjS5vpGK13cswrS0
         fGsWuscsmsoRIO6azL9KjPAjvsfkIm/V9wpPH3i0xCat7zxMY7ctJnfmWZ+bkmSoFJXq
         GavttCItjHcBvtxkmnoFOUmXYde2NN1/OdJHNHbPTezjqArcIRURzzXDQ6KCsZKI+wQg
         ETZMKfJxk9im1gQt4SgLYAiZTjbFY7W6RPzuVqutAGu4lWfJ+CV4BcK9JvMPZE/iFiYA
         MkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684744614; x=1687336614;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lcrDpdT0P9HHoECV1vJkLFWVWwbxP8Fr74ykIaaMjzU=;
        b=iuE+AM/S+QfG8lE+cgIEgYNPSirf6rgdZQgyvtr9rTr0kvINDtF4RuDCgf3ckht/56
         pbLnUMazTGAfzqnDcepZvNCXeg40Yl3wByF0ZxwPXUk2V7oNFzk/XDxYAa/E28SC7tOx
         Ys8p5hE+/49O+n/OpxKYt1Sk0vTocAZKe6/vcDZI1lYT2UFTDz3SE+L0g7P3TqGJXhlW
         an8hKZWNmReSqE2bNnRmar6/dB9sxfSog5qo0T1Tt+/+gOoe7daXW3HXN8mMDZdwNvLL
         pe8nKVVTSSM78D793upvtRes+uTEGzTmr8w72pJLoA+WJSj1/l7/NVS/Cw8FJLFZj5lz
         7Rjg==
X-Gm-Message-State: AC+VfDz50h4Q/WtOgI7dWpQneLCeDrjv5tlkayFzFUdRVqJlJLNPlVtZ
        179jydW9NDopk/Wgy8cl8Wz/2g==
X-Google-Smtp-Source: ACHHUZ7EUFzpEYB4KtHJwQgK1FcjRylaJpeidTl7vlWxTf7raf4yEB4xfF0K/RG8mbA35FrF8UxVjA==
X-Received: by 2002:a05:6a00:234a:b0:64d:123d:cc74 with SMTP id j10-20020a056a00234a00b0064d123dcc74mr11227091pfj.4.1684744614530;
        Mon, 22 May 2023 01:36:54 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c60:d309:883d:817e:8e91:be39? ([2401:4900:1c60:d309:883d:817e:8e91:be39])
        by smtp.gmail.com with ESMTPSA id n2-20020aa78a42000000b0064d57ecaa1dsm2738919pfa.28.2023.05.22.01.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 01:36:54 -0700 (PDT)
Message-ID: <056fa22c-a6be-da19-1352-d771ac61ebdf@linaro.org>
Date:   Mon, 22 May 2023 14:06:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From:   bhupesh.sharma@linaro.org
To:     Anusha Rao <quic_anusha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        thara.gopinath@gmail.com, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, quic_srichara@quicinc.com,
        quic_gokulsri@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_poovendh@quicinc.com
Subject: Re: [PATCH V3 3/4] dt-bindings: qcom-qce: add SoC compatible string
 for ipq9574
References: <20230518141105.24741-1-quic_anusha@quicinc.com>
 <20230518141105.24741-4-quic_anusha@quicinc.com>
In-Reply-To: <20230518141105.24741-4-quic_anusha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/18/23 7:41 PM, Anusha Rao <quic_anusha@quicinc.com> wrote:
> Document the compatible string for ipq9574.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> ---
>   Changes in V3:
> 	- Picked up Acked-by tag.
> 
>   Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index e375bd981300..0d1deae06e2d 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -28,6 +28,7 @@ properties:
>             - enum:
>                 - qcom,ipq6018-qce
>                 - qcom,ipq8074-qce
> +              - qcom,ipq9574-qce
>                 - qcom,msm8996-qce
>                 - qcom,sdm845-qce
>             - const: qcom,ipq4019-qce

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
