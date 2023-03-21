Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBE3C74A5B
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 06:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjCUGsM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 02:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjCUGsK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 02:48:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8905720049
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 23:48:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y4so55779672edo.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 23:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wInF6GafTuPljjFUA+Is8vEjW4Pl6T2we7ZsIWHpBdc=;
        b=t9qzeK5r/pPr7nWar54bwzgkW8DFarwVWfGFpk9NaytbIwZEw12umrs7bj5QwxiuK9
         +kES/0g4F0MOIqGI3y0l3OhtGun11qEdDNfxlGop6VqcPTYPWZiDsGR6MWW4HCkzKWje
         nIezYvISRxREMY9fTomU4/11ue8ESMWS4hggPvBp3S3VmXnorkI5pZ9V1KEZvhlPzbqy
         noAwHJARgZzzi+g7afH2SqNj6avLPLAFW13JEKXKc7AkAMtRUGwm40CRFQj9R3zAEcJQ
         bjV9n63wr2KXFRgENQYbp/6cJ6azeqYMXLsTGiaad8fCbNzd8Me7BOEfbYj8BF+dg5KV
         TqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wInF6GafTuPljjFUA+Is8vEjW4Pl6T2we7ZsIWHpBdc=;
        b=e5NrVNrEjKsku0CXhwFKhaV0MVJ9NYzqOpQYCFaT0BlAhbMAGcZKIyA2YViMZM7P2E
         eB7+2u53Cdf1amafvktJiNnTnzLi2UULAkinNqxQqOWqAgAxFR63KhAKQgAzWHn98D8R
         k3fiRpxb2k4py+JYUmM0iWIRX7pnvP5XwTusrQkw3OQHbr8z1JzjJelRKjOO+cneQawF
         85Ky+gEOs7DhIHXGPG/QRIwVGsr8C6KaPs7oYLCKoShF6UU5ziqGT9BEGC4/jpqPXanK
         Cz3rgNKYm0ZFZLPImHAhc1hAF015N1jpKBIZzfVHkNdQ6rmJ5KDJkTWRsDxg/Oa3ZnM/
         89cw==
X-Gm-Message-State: AO0yUKW2m+nL5IyiwGlg/ZXRULZyqsC9wWieZdJv6tWomOU27Fc4E5Mm
        TYPlRlLkxX0ZJwwHShShbPQiCA==
X-Google-Smtp-Source: AK7set+yUBYPnpsgcGFshQfAIT5gVBUyoTKz/PVli/szhlsgnT8leqFozAyoOp7o+jk4oZaehIJKDw==
X-Received: by 2002:a17:906:397:b0:932:1af9:7386 with SMTP id b23-20020a170906039700b009321af97386mr2043033eja.27.1679381278702;
        Mon, 20 Mar 2023 23:47:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id qq24-20020a17090720d800b008df7d2e122dsm5344909ejb.45.2023.03.20.23.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:47:58 -0700 (PDT)
Message-ID: <48261996-1993-7c9c-b090-eba68157aecf@linaro.org>
Date:   Tue, 21 Mar 2023 07:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net-next v2 04/12] dt-bindings: net: qcom,ethqos: Add
 Qualcomm sc8280xp compatibles
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-5-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320221617.236323-5-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/03/2023 23:16, Andrew Halaney wrote:
> The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
> Add a compatible for this.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> 
> Changes since v1:
> 	* Alphabetical sorting (Krzysztof)
> 
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 88234a2010b1..c60248e17e5a 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - qcom,qcs404-ethqos
>        - qcom,sm8150-ethqos
> +      - qcom,sc8280xp-ethqos

This still needs sort.

Best regards,
Krzysztof

