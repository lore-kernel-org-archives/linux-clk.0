Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752A0CCA489
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jul 2022 17:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbiGDRZF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jul 2022 13:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbiGDRZD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 13:25:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03323101E4
        for <linux-clk@vger.kernel.org>; Mon,  4 Jul 2022 10:25:02 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t25so16787203lfg.7
        for <linux-clk@vger.kernel.org>; Mon, 04 Jul 2022 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uolOp25H9wddcEJ+5GA//rI982FbfbGMRO1Mg4UdOGU=;
        b=SWx1fSb4QtNhDokc/hxFxmWh7eWjHPBfcKDAcwdYlNK6sUknjkwbjllsRkop2h81sS
         VPUDUYNvwxySjP0HI7lO5Kn2Cg2mptVzY0VaAKqIA+kc/b/0Oj+f7aU8fY37wP6+G/Rt
         GETdExaf/AWVcxVPjPIbgSm+/Uf6CRoyA1h4Ex5nk2/glKPFPAPojzBHE3FhGxf3VoPD
         6Eu41rkMGg59Psqh4mi17cVFZ+WyLi5XPC84D3j0f+HHaX/tbZy4RSJdTu8ZU0jdZNPF
         rm1mZqquMWQIIw2gp80mlknSAbYq/mu25yTbE2gN6QvWlFqEsGfe9WXPgaF24lD5CqCU
         Zc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uolOp25H9wddcEJ+5GA//rI982FbfbGMRO1Mg4UdOGU=;
        b=CcAneWT4lplgI5mZH7u+YVM9f/b+4mde9Lzzm2JB6a0Pet5CFDmFvteFcVxjFtIL92
         Yv7pINrQwdNvBmTLfFIGU0yCZUHEXzJQNuSo14x+TQmRJ03rbk+mJKCX5YS4LeGKs8dx
         yDc7fRXNheig35qBUZ8jSSChUPMLuZRJGXG+/b0qeGw7RJ1sAkNJhVbCrgojFC26OUFr
         8BfJWRh/O5BDOERccGEnIDxO2tb6ehPFCtkCkhiWkt98oEFnwQIaxTkUzf8Gs/zcn5dC
         8NLk93MajQtZ5QsbeP0MT06gqvsOtekhrx+DdUZaX5ajMyARTDn6PjbUL9rNp1NS8ZHR
         1xiw==
X-Gm-Message-State: AJIora+QqD32JITkAXuA3ye7HDEyVcO0D4vZcnARtTYLgJzNtMe2Ye5z
        5zMoD7twxrE/Mq/yfbRMCn70Cg==
X-Google-Smtp-Source: AGRyM1tmXQZFnNCqWUISHVl4APp/12qA/8G0XUfD8+jZj2BIjxaG4KpQbKbZaqlOtEPAtqIDf1Eu/w==
X-Received: by 2002:a05:6512:6e:b0:47f:7725:d445 with SMTP id i14-20020a056512006e00b0047f7725d445mr20527364lfo.237.1656955501582;
        Mon, 04 Jul 2022 10:25:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u15-20020ac2518f000000b0048152c51812sm2339596lfi.154.2022.07.04.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:25:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 7/7] arm64: dts: qcom: msm8916: add clocks to the GCC device node
Date:   Mon,  4 Jul 2022 20:24:53 +0300
Message-Id: <20220704172453.838303-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
References: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the MMCC device tree node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 48bc2e09128d..de741f287e1d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -936,6 +936,20 @@ gcc: clock-controller@1800000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x01800000 0x80000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <&dsi_phy0 1>,
+				 <&dsi_phy0 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "sleep_clk",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "ext_mclk",
+				      "ext_pri_i2s",
+				      "ext_sec_i2s";
 		};
 
 		tcsr_mutex: hwlock@1905000 {
-- 
2.35.1

