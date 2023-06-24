Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670DFEB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 01:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjFXBpP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 21:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjFXBpM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 21:45:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4635295A
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:45:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f86d8a8fd4so1769288e87.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687571105; x=1690163105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgZ6wHeTXHNNkzoOXI478qegj1Lre0Rvrf2+aJPQh2U=;
        b=eSbjnbRzRayiaiewbJqC9fKDANQuO4GROdfkvdYPRoFgBG534eQWc9YXuuML4yL3RH
         k1YUQ6YfWEyXF/rXt7zdVgeFTNnqzgelPOhAHYrPOBMPVhsHFLlor7cceLf3IFRoJjon
         wtIwG07J9Va8ousJY4GjM11IigmdrNcue2Wo1NE6F7vkCVzy2oHy9Rbjs3hOFj/yttgK
         GfrmbtDBMbveG2N7MZJX/vGEDObIq8YHXAXzhSabKamNPF9LOSnuT+aFceu9GBI8d33Z
         4kh+VMiDb73GtkwnpCrh60uJ7kAtNPtS4u5RJLOrpATNbzqdsIZfCe5NBdygUNTrkh9w
         JD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687571105; x=1690163105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgZ6wHeTXHNNkzoOXI478qegj1Lre0Rvrf2+aJPQh2U=;
        b=Dk3sZGajnbL7eNZzxhA0SFKlxFGIr9di4CI8Bx3NRfstVTzPltVajEdwJ524efgT8k
         C6gUsdDjLzoYGmyGoejzP0e+hmcF7EV4US1EHBa7NFqghqwSNjJSTdiuT9QlN0UI3uvr
         D/CmsIwqNMduGmh8U+IxiU15gJfLRhLT12ZOI8YL9mixv/KBEjv/xKQmZzd4gpENdCDk
         K4uQz4jtz0AmIvqxjiTNrFa2Vy9XQnBFXbvqEtWBDHApnpLy2DsXhvfkKXU64Uzuik4Z
         2vNUcXNztvZpySyA5qbJwDraLhA27zkJBpSKoenComMAWvQHwWaz9ELtOccNpJ7s4WHF
         /epg==
X-Gm-Message-State: AC+VfDwZ/hUhT3UnjYCsgfMvNCoydEY719jsz/+zBNsRSvhAjBoU9EbV
        3X4SogalWGC7/Anig7zkkzAEeA==
X-Google-Smtp-Source: ACHHUZ4sGL50pdfpgbTYEWBnXhaoOwDNhtjA0HU9MfSlbP7f5xiQSXja1T7V068FK6vEK3erWsTzVQ==
X-Received: by 2002:a19:4f01:0:b0:4f8:6ac1:15a9 with SMTP id d1-20020a194f01000000b004f86ac115a9mr10865967lfb.31.1687571104836;
        Fri, 23 Jun 2023 18:45:04 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id a19-20020ac25213000000b004f865fead78sm92605lfl.161.2023.06.23.18.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 18:45:04 -0700 (PDT)
Message-ID: <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
Date:   Sat, 24 Jun 2023 03:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24.06.2023 02:41, Marijn Suijten wrote:
> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
> be passed from DT, and should be required by the bindings.
> 
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Ideally, you'd stick it at the bottom of the list, as the items: order
is part of the ABI

Konrad
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> index 2acf487d8a2f..11ec154503a3 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> @@ -23,6 +23,7 @@ properties:
>    clocks:
>      items:
>        - description: Board XO source
> +      - description: GPLL0 div source from GCC
>        - description: Byte clock from DSI PHY0
>        - description: Pixel clock from DSI PHY0
>        - description: Pixel clock from DSI PHY1
> @@ -32,6 +33,7 @@ properties:
>    clock-names:
>      items:
>        - const: bi_tcxo
> +      - const: gcc_disp_gpll0_div_clk_src
>        - const: dsi0_phy_pll_out_byteclk
>        - const: dsi0_phy_pll_out_dsiclk
>        - const: dsi1_phy_pll_out_dsiclk
> @@ -65,12 +67,14 @@ examples:
>        compatible = "qcom,sm6125-dispcc";
>        reg = <0x5f00000 0x20000>;
>        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>                 <&dsi0_phy 0>,
>                 <&dsi0_phy 1>,
>                 <&dsi1_phy 1>,
>                 <&dp_phy 0>,
>                 <&dp_phy 1>;
>        clock-names = "bi_tcxo",
> +                    "gcc_disp_gpll0_div_clk_src",
>                      "dsi0_phy_pll_out_byteclk",
>                      "dsi0_phy_pll_out_dsiclk",
>                      "dsi1_phy_pll_out_dsiclk",
> 
