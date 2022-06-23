Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B7ACCA48B
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbiFWMEp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbiFWMEh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:37 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBC24B1E9
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o23so15904746ljg.13
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CY/R0xFxG7Py4HYT1PPxbuqpWVbd/YtENkbXJ6Hu/gI=;
        b=qWF5I02mOgSa/6EheKom+AYbV93XG73Ty7LFbQLmHPnP9//1va4j+e+h8SH2IUOjx2
         duCoO+EFt7R/NT0wrAdEc8Vdzw81Attg9obPOvpg1oFAyNKJEkM5mzbX5uDQoZLZnIC5
         AJvfyyRdIxR7MScM4YNMrwVwKSDfCgn8g1d9feQG+JiRTjqjM41AxSjP9AybInDFwIzr
         qsYENfOi1+/TrRaNG1JwJoL+8LkkZ01yotFduy0kdhiZx6SqfEyLIkYsfVtt6WzkeiI+
         ViFY4bpI4R9GQYtrdFIo59O4nox2AHAgmEqJxUNDbi02yS4tNrlgQSHKXC8KDQQJ2+w+
         quXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CY/R0xFxG7Py4HYT1PPxbuqpWVbd/YtENkbXJ6Hu/gI=;
        b=Tra4VtICmH5MmR5K3sSmtw40acXwvIxsludTpVD7bs8UJFWAWg/f8guOSer27DYz+k
         iTs9de56a5eT9YgEeQL7+6ipHqx169xEPgLzPl+SD+JcSXLv3xqsXSYNZWFDe2AfAwqJ
         pLExdF+jl80qiLlI5GxRYn6tHqt/REsADsDorPjDus+QCLysLF2zTny3a9mQa2VDgYi+
         Rr0ZJom/XMFRXY2CTDc2N35HbWZul/TDFk3jrJFDvoM3B7JnNQIO1RerTmqfVqhrXX5g
         gBNUA9pjZtqrQZoLtiM0z6ydSNm2O0qdqGG5Nzny8W8S21HhHMhmwfIDhApx2CVSZ4r7
         0ifg==
X-Gm-Message-State: AJIora8ERA+VYsoogUyIw/YBPo5Mnag7JNji4Mb9aWaXnTBYNJ4O5n5g
        hxl8CZZdJYgneqYPqIay/kw9/A==
X-Google-Smtp-Source: AGRyM1v4xU8frsl4EdzPmth7IQWf9+k5j4HpKc5Lfr4vZiEBleu3ornilOj2mxVdCh7cdA19hq/XCA==
X-Received: by 2002:a2e:5342:0:b0:259:ac23:8d52 with SMTP id t2-20020a2e5342000000b00259ac238d52mr4637857ljd.488.1655985868269;
        Thu, 23 Jun 2022 05:04:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:27 -0700 (PDT)
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
Subject: [PATCH 11/15] ARM: dts: qcom: msm8960: add clocks to the LCC device node
Date:   Thu, 23 Jun 2022 15:04:14 +0300
Message-Id: <20220623120418.250589-12-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-msm8960.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 4a2d74cf01d2..3d58846319ae 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -63,7 +63,7 @@ cxo_board {
 			clock-output-names = "cxo_board";
 		};
 
-		pxo_board {
+		pxo_board: pxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <27000000>;
@@ -137,6 +137,20 @@ lcc: clock-controller@28000000 {
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
 
 		clock-controller@4000000 {
-- 
2.35.1

