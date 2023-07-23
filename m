Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D19C001B0
	for <linux-clk@archiver.kernel.org>; Sun, 23 Jul 2023 14:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjGWOev (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Jul 2023 10:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjGWOeu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Jul 2023 10:34:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4FFE7B
        for <linux-clk@vger.kernel.org>; Sun, 23 Jul 2023 07:34:48 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e28b299adso5618523a12.2
        for <linux-clk@vger.kernel.org>; Sun, 23 Jul 2023 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690122886; x=1690727686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXv7e6KED+JSh8uirNIwgfBSKBLwxK9076I+S0/EqU0=;
        b=mm41k8EhAvS/ZYYDKAa3KE57KEUc4iW/FAINgc/DJ8iU5A8gXvy6pSXKMj0FtGhfWl
         AkrP6wdIPCpdgkzrThwLn7jl3IM1/bGMNhcMsf12Xnr+a7c9uCGBBv5cYgfw1fseGb9e
         ESuvPWgJwbouE5VbeMCkUxrnHppkNzS+p+fevwEbFAtn+VlrrSJXnpSmlmLg2Ccw0PmW
         o+5laetR6xw4bt8smMMdK/ysdy1FcNHh89I+G+H/4KaFv2NyfszQkriJn/7a5VgbAIov
         7YZqDX69JYEf48RKAayVhKobTemURTm9x8muhmDjYuCN0EdcoQsASMi4QBiuzS6OEdEr
         maVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690122886; x=1690727686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXv7e6KED+JSh8uirNIwgfBSKBLwxK9076I+S0/EqU0=;
        b=JFuT3GXpCAU8r6oR010OxFoQc0Lc94FrEdylWFqt8LNn7oEkDakFSVB4kDmuuLbnpx
         nlHPfxu+zrTvHmAlJvo2HUjxLSzeDhNihz/IdoJGNZvsWyTLq2Iw+PahpwE4NBW3qwem
         933I8YiNlCiP3joXPGEnWTJe7s0Ged8teMmSRd3sEUe1j0cPo2QPBYJ73vphIxS/vrqW
         IbcFrD7+IP4uP0fDhSKCBlsb2klajeTIvgXt9Xb5HEWxQ3ilUK72Lf90gcXRDGBYiRK6
         4xv+rUZD3qeal10TE5bTxNbBr8X+/ZYumIx+S6HqveoBqAePjnPXYjjYwqGVjSuUiWkw
         xuxg==
X-Gm-Message-State: ABy/qLb3+bNwoywZcoosFJANp0kL58J+5eNDVD5FjoqC4/R2wZafASO8
        asZDTgp02nc8YiiQ8jGXvKLO7g==
X-Google-Smtp-Source: APBJJlH3sMpku5LLO3f/un8EhhKdjrFQkRn5DLRrg76bjT7U2drDbnhYtpzs8cxuWROzaeMYtJNiOQ==
X-Received: by 2002:aa7:d908:0:b0:522:1d23:a1f8 with SMTP id a8-20020aa7d908000000b005221d23a1f8mr3746546edr.26.1690122886749;
        Sun, 23 Jul 2023 07:34:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x5-20020aa7dac5000000b005221fd1103esm1590336eds.41.2023.07.23.07.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 07:34:46 -0700 (PDT)
Message-ID: <df680f80-875f-b414-911e-69ab4d9bb87b@linaro.org>
Date:   Sun, 23 Jul 2023 16:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/7] dt-bindings: clock: qcom,hfpll: Document MSM8976
 compatibles
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230723140712.9438-1-a39.skl@gmail.com>
 <20230723140712.9438-5-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230723140712.9438-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/07/2023 16:06, Adam Skladowski wrote:
> Document MSM8976 HFPLL compatibles.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,hfpll.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,hfpll.txt b/Documentation/devicetree/bindings/clock/qcom,hfpll.txt
> index ec02a024424c..855344957350 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,hfpll.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,hfpll.txt
> @@ -11,6 +11,9 @@ PROPERTIES
>                          "qcom,hfpll-ipq8064", "qcom,hfpll"
>                          "qcom,hfpll-apq8064", "qcom,hfpll"
>                          "qcom,hfpll-msm8974", "qcom,hfpll"
> +                        "qcom,hfpll-msm8976-a53", "qcom,hfpll"
> +                        "qcom,hfpll-msm8976-a72", "qcom,hfpll"
> +                        "qcom,hfpll-msm8976-cci", "qcom,hfpll"

Let's switch to proper format, because this is not getting mess, so:
qcom,msm8976-hfpll-a53

Best regards,
Krzysztof

