Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D6CC6FA8E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiI1PAr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbiI1PAU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:00:20 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7141A838
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k10so20796736lfm.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Gv+TB5vz0jii361bUqWIooViGxmGQPct0fTOn1q1P3o=;
        b=g3r+hb6XIf8X+C3ses6PuIx0RVsHov7HhClz0ZX/jDhI2KJcEQ4MS862BV0Cw+ExXe
         1kh196l24uxLctMgqvX/RVlaTrulILQnGEN36KFG6BIhdgD30EFQZv2MniHoXFokpw3b
         TNTvMXUfMYwbSyqjOZqMqGfQNZUvjQBacJOx/LjG2oM3zzWZUouMGXXlaQ+q5IqY2/Xd
         VvjclNlEeiJ5SJmya8OnisNOABYlbXpqHjxw/wc/wsAfIQIGucOgh7eBRrZ1rP+0L4Pt
         AB891HjYfz9F/qvs5D5Pk1fR+FbbebfdSJL2R9DyxJzWxdpAYB7C/ETuQb19m7hybwMn
         ZOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gv+TB5vz0jii361bUqWIooViGxmGQPct0fTOn1q1P3o=;
        b=nqDjgWZ3RvThjDEEKGELvd4C8zEwmNqlM9O9KWQ+DOyDahBS4ZB9BnBSOTYwEZVADk
         eZqFMZoirlZWk0iN1HHwNy5M3P/MJfCR7f8o/xyAI1pBOqzkkDqoSaW6IttwO1BAGnMF
         olZ+vptjbjLTT3KOXtSGZTOj/4S03bLhZFdNIaN9JU8IjUYGegV01E0AOX+fh9l9Qs0/
         Tz6mqZQ8G5wZVAEmJm0ddfPZ0WbmWqa80/fJ0Cyz/ZNFBs9VeamUvD/7Qjc2jFhb/UdQ
         PEZOqwdNtM0PLZ7ZsZXFedtR7u9r0QKnSi7rsqHXGyz3QEBdoOAFee4GUfKPR4aUYXdL
         0pAA==
X-Gm-Message-State: ACrzQf3oquDB8X4B1HiMjuke0Qry153QLwtVyQ11r7rH924+osN5iKMy
        9Taz8a+P8equavhl+s5gGqpICw==
X-Google-Smtp-Source: AMsMyM6+32vjuH06+MaZVY7m2dFezl2OxIKB66cvsrnIjyMoz0Vk+W7GBmOh4h6UI0C5MESuIaknMA==
X-Received: by 2002:a05:6512:2384:b0:497:ad1c:799 with SMTP id c4-20020a056512238400b00497ad1c0799mr13258871lfv.294.1664377208230;
        Wed, 28 Sep 2022 08:00:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 11/11] ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device
Date:   Wed, 28 Sep 2022 17:59:58 +0300
Message-Id: <20220928145958.376288-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names nodes to the mmcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 68ef494ca87a..3b7940022cdd 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1493,6 +1493,30 @@ mmcc: clock-controller@fd8c0000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfd8c0000 0x6000>;
+			clocks = <&xo_board>,
+				 <&gcc GCC_MMSS_GPLL0_CLK_SRC>,
+				 <&gcc GPLL0_VOTE>,
+				 <&gcc GPLL1_VOTE>,
+				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
+				 <&dsi1_phy 1>,
+				 <&dsi1_phy 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "mmss_gpll0_vote",
+				      "gpll0_vote",
+				      "gpll1_vote",
+				      "gfx3d_clk_src",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "hdmipll",
+				      "edp_link_clk",
+				      "edp_vco_div";
 		};
 
 		mdss: mdss@fd900000 {
-- 
2.35.1

