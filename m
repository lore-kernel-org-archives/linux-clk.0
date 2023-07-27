Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABBFC04FE2
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 12:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbjG0MWg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 08:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbjG0MWd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 08:22:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612A82D68
        for <linux-clk@vger.kernel.org>; Thu, 27 Jul 2023 05:22:20 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso49367466b.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Jul 2023 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690460539; x=1691065339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBcPaBCD15GVUt1t8fe+n3lTCxT4h0u6r6X0oXlZlwc=;
        b=e081yBpEl6WUyQ7DrRPgXBrwcqwu4Zlr+puzBZS56IJgd0T++PdR0LhMQQP9+eGBJh
         vPp2ek8dutLOQ45EtSbH11eENOOFmTYHYPNub1vraSKWz5mXM8gJEBy/MTOuCXtqrXRC
         tUa06KALw5Q4Qzz9oDT5BK81+Mk0yoWq7dvHwgQZvkgGS10I6gUXftd6LCfAUO6lE0aR
         b2SefsYc+gYmH/yfi2HAGUuP460jJ89FaOtEgtKbWo3FteTCJhNTjwhDSeYxyEoVbNaR
         WSg2mfD3JYetOQu43w+k9PyfmRvgcrMmw3lM9SteyO+TLxiNEr7Q8+oBstysJ//7cqW+
         l73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690460539; x=1691065339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBcPaBCD15GVUt1t8fe+n3lTCxT4h0u6r6X0oXlZlwc=;
        b=SLTiFpZDoM5ufLxekBz7nbypcZzLN/iP3aLhUiI2iMPHWy9oemlYPQcclCg9AOQYjh
         JbrQgJu4G2uA9AL27vcnnJPGs9W8pv+g0hiQn6ajeRKWyAY7wK5GfkJkTCPvsOSx+TkB
         5YsGvOjopoDh+I4dqoymNyVlU8KbkyHzrkKyVP+GcKRfBB7xYe25IYQy9dPjG2rVe8QB
         2ZQd/r8usUv6QhwM8gt5asItyvc9I0QzPhCeb5jhv2Lq0x5EA+9gg8T5WTcgnh3NhAcq
         ce+HIku6QL4aEaJgyJIE01HWqmPdq50mPpOAZ1vrK1nefOEt4KHkdjRCnbf2Wn2cL+Tz
         GkFA==
X-Gm-Message-State: ABy/qLZayW/sWUT4k5z5K0rYT2a/H08ATZbGQvPMWecf2l4m9+VgAveN
        mQWE+sRNl7u/HnHOGJBpLxpBWA==
X-Google-Smtp-Source: APBJJlG8c4LaXOrZrh8NyuL1H8V9TCwkuizDCvPywRcH0BHTiQ4d0Yy80J1WZnSmA2GAgK4iabH5rA==
X-Received: by 2002:a17:907:a075:b0:99b:64ca:6999 with SMTP id ia21-20020a170907a07500b0099b64ca6999mr1967077ejc.7.1690460538803;
        Thu, 27 Jul 2023 05:22:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00993860a6d37sm717844ejo.40.2023.07.27.05.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 05:22:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/17] drm/msm: Add SM6125 MDSS/DPU hardware and enable Sony Xperia 10 II panel
Date:   Thu, 27 Jul 2023 15:22:15 +0300
Message-Id: <169046051039.1413710.12901529844343078449.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
References: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun, 23 Jul 2023 18:08:38 +0200, Marijn Suijten wrote:
> Bring up the SM6125 DPU now that all preliminary series (such as INTF
> TE) have been merged (for me to test the hardware properly), and most
> other conflicting work (barring ongoing catalog *improvements*) has made
> its way in as well or is still being discussed.
> 
> The second part of the series complements that by immediately utilizing
> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
> 
> [...]

Applied, thanks!

[01/17] drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a7e3fda5948a
[02/17] arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b7d35a8eae54
[03/17] arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2be52ca96a71
[04/17] dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 example
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4be2c19261fc
[05/17] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4f86e343f3c6
[06/17] dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
        https://gitlab.freedesktop.org/lumag/msm/-/commit/91043642f28c
[07/17] dt-bindings: display/msm: dsi-controller-main: Document SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cf5859476e5d
[08/17] dt-bindings: display/msm: sc7180-dpu: Describe SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/04a664dffd19
[09/17] dt-bindings: display/msm: Add SM6125 MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3bde3b8f8a04
[10/17] drm/msm/dpu: Add SM6125 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/76c5dffd0bc4
[11/17] drm/msm/mdss: Add SM6125 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/de50357565d3
[12/17] dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cdac445883cc
[13/17] drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7638d8059ace

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
