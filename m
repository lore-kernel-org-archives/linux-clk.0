Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66B5CCA48B
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbiFWMEi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbiFWMEe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E921F49272
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c2so32987081lfk.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=phwT+Z6nWrWm8Hr0ddNtVBYpY/29m2pZjUGouNitf4c=;
        b=GQL8E4bhfx7Iai+2lcA/S84OUj1KpEBjIQE+ze7obNQQ6vaNEW4VwUMYD6X56Wxgj3
         J9XvfjrrblfmJG99VkxuxAgxnfB1CZVReAj/Ztypv+2QjFgMQRyixmRbKFyAbGPaVRZl
         J4gura9cPiSojJCCrPK6e11Sl4NVj2+maHvwdyy1X0ZRwgi5NXpDijsOQtvq5irjwsfz
         4kWmlXoP9Oxg4YgdgYkn24L3zhxrth3u/Vff3oRtCKIKodHrt2vFhrNSDtaWltE5CJeS
         tzz7c9WfyveFTxFml1X5RROitWAipVoBmDxNKKzaYx3Ia+iIGYa65S+Ht+WEU3wj/aDj
         lJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=phwT+Z6nWrWm8Hr0ddNtVBYpY/29m2pZjUGouNitf4c=;
        b=C+rqThVjoKqojvPm+0lypBcw+6QgZ+nlP9E7VHgCEedOauPu3dyb6s6p8QYTdlJDoH
         DVTj09qJvOXGlzeEUMdSb8ayysK//s7E7kSpfT8W7ejV1hvGAbH2xRHdAwtILqGHjgCy
         wJVY2sg6YzsbyAG20cIFU3Yor/0UdAmuFuzjevdCTJJpq9uUF4eU+4S8/op00onX4WLE
         nmsquiFM/gF+nv7rucFiV/z/z/XJqFK5ynqJsvUCZEeCP/tjrplS4BQYGKsz+yfLT7nM
         M/hW+Cp2VoibsX03Pi1apH9fa4FulvSzmuEE2w0X8xO4j8B8Dj8Ya29S55S2J9RXRAm2
         +G1w==
X-Gm-Message-State: AJIora+KWu3tvzt0wDVLc0bOXKM5BpSPMn7fIoku3WkEbSbmvJAXSZlY
        5qyGiKA57Ja2FeNA8mvnEMOyxw==
X-Google-Smtp-Source: AGRyM1vsh64TMNAD9XuPmd3FfqFMpFJ0tlZrucUc2f64uUmXi21/MIvZq1NrLpYBdC650ejTtbzbow==
X-Received: by 2002:a05:6512:2810:b0:47f:a76c:8770 with SMTP id cf16-20020a056512281000b0047fa76c8770mr1707701lfb.116.1655985867352;
        Thu, 23 Jun 2022 05:04:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 10/15] ARM: dts: qcom: apq8064: add clocks to the LCC device node
Date:   Thu, 23 Jun 2022 15:04:13 +0300
Message-Id: <20220623120418.250589-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the LCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 0d323c208978..72b099ed4543 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -834,6 +834,20 @@ lcc: clock-controller@28000000 {
 			reg = <0x28000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL4_VOTE>,
+				 <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll4_vote",
+				      "mi2s_codec_clk",
+				      "codec_i2s_mic_codec_clk",
+				      "spare_i2s_mic_codec_clk",
+				      "codec_i2s_spkr_codec_clk",
+				      "spare_i2s_spkr_codec_clk",
+				      "pcm_codec_clk";
 		};
 
 		mmcc: clock-controller@4000000 {
-- 
2.35.1

