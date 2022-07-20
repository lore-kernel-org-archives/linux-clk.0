Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC40CCA483
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jul 2022 06:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbiGTGaT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jul 2022 02:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbiGTGaT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jul 2022 02:30:19 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF7A1277C
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 23:30:17 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a10so19978780ljj.5
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 23:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=svwBknUY50fmzabnEaICrZK9R0fh/lr5fpPdH5SEovs=;
        b=wgDaRIzqN/pGdLypgVO3Z8tD5NNE8KvD2Y8qC6/d3+Y5wuR7re/gdIJdrz7BEuOt05
         UeEi17qiQgHByTtOofLXN+0/nZ52q8ZsQxCZLoDMMORjyv8pRY4nJCR4H9wnOTjb7ROF
         pA1nSB/JxV/dkVNM24j+K8UMoMd+vuAWpdtlJ78byHtlN2h89B5gKmeuASp/pY7pOa5v
         v36NW56+nptXuHi0W4Rs2RCgxbu+UvCqehoSw/HtvEHRAzRVX0uVgyYRRfhdciF5oXWO
         31bcAtekwx1NDiDsaGGnBT0DsH4uL8dkbk4+IQUB90Rnj3Y/8x7TW/Xo+Jok1AWMufru
         JsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=svwBknUY50fmzabnEaICrZK9R0fh/lr5fpPdH5SEovs=;
        b=rJsbwtLz6Q/77wthl/ICJwkVqwh+77OwWanpu2Avr4nbgw8JCAMjIMD2NAuWaylmjY
         OYsnu853tlgDipJBi6oMTSLUH5H1zTYukfFlqvQq14W7VGaS5oJtoFnUQGyC8bi9wWBf
         Ju7q+DWV3hwDu/aOZR1ZwRj37glQH2CjUsgIIfUfgP1C84pI+hp+dWtbl+TN+eXMUMxn
         u8BFtJ1xncRZmEiSCNlpfRT+deyl+QG/eaFacpIMSJzsjZIWaPeFepfbKlEHiTlLy9Mi
         6fS/HZtgmyj+0+iaU4GY4xjudXwPJUHLgEeLGKNjgqPCCOPOokQS36BllwToP2ZS6/Jx
         wD2A==
X-Gm-Message-State: AJIora/xSLFP1tb8ZapTcsmXMcB3HrCNcgb5i/+VFddznkJH6SbMX3DA
        RZrxSThTjS9o/2Wu/4Wa+uSk3g==
X-Google-Smtp-Source: AGRyM1vf7GN6vgL/2J3B+G/GpAG/sQuS7t5m8lyVqk+/jaLOs9tVA7KN2osw6Zf6G8PB2ZE7mExing==
X-Received: by 2002:a05:651c:204e:b0:25d:4798:9776 with SMTP id t14-20020a05651c204e00b0025d47989776mr16630931ljo.86.1658298615813;
        Tue, 19 Jul 2022 23:30:15 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id a25-20020a194f59000000b004896b58f2fasm3618062lfk.270.2022.07.19.23.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 23:30:15 -0700 (PDT)
Message-ID: <991f085e-ae79-bf67-d063-51484a0ba344@linaro.org>
Date:   Wed, 20 Jul 2022 08:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,rpmcc: Add compatible for
 SM6375
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220716192714.454031-1-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220716192714.454031-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/07/2022 21:27, Konrad Dybcio wrote:
> Add a compatible for RPMCC on SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> index 9d296b89a8d0..f22febdfdce7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> @@ -43,6 +43,7 @@ properties:
>            - qcom,rpmcc-sdm660
>            - qcom,rpmcc-sm6115
>            - qcom,rpmcc-sm6125
> +          - qcom,sm6375-rpmcc

I am fine with it, although this contradicts a bit
https://lore.kernel.org/all/20220705161301.493364-1-krzysztof.kozlowski@linaro.org/

Would be nice to get Bjorn's opinion/preference on this.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
