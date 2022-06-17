Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B65BCCA482
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 12:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382222AbiFQM3d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 08:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382271AbiFQM3c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 08:29:32 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCC4606ED
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 05:29:29 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id d19so4557384lji.10
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bGeccNDCBeLsb8V2UEPm2YdO4aA4EMY5TjAXSJDABD0=;
        b=e9w62j0uWtKr7FsHGlHFnDLN7QfktdUKyYKHKqm45BUP9sG8t9cDFKdxXtUmblJwYs
         kBLTEy46y24UQ9QS13QANcc9xsIuLG5deZj8he85aFa8PvsJvblQzjwliOp6ZNDUM/KH
         VRukBFksleSWvRbig+RWHjmWrCKrwXitJbLel66n0hD/FfOjKIlKyMlbxHYE1VHVyZw8
         pRL8JNVrbEwu4ZiEA88kLpadF08Dbhc6efarSu9UnjB4H0elpINxI0qagyAbQ9/TYrJ4
         V4hcmopoSMdclftwieT133ZmBS42JimOzWQC/GoYAhIs6+KNoCGYCaZhoTYIDLQJXWUd
         pNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGeccNDCBeLsb8V2UEPm2YdO4aA4EMY5TjAXSJDABD0=;
        b=EOQ3l+j3g2hFn0nVLUSDE0VITT/DnCVHbm4Mw0VhvovilqQZ+bOl6aNwDsKJC4Ccbo
         IKS/m8QofS0wHMu6JacW9Ebrvx8asdAafpCz0uNTBmm0HzokQIbHx21VXP1cGfkRxwrH
         4FxnBGZZ+RCxOdzweptmb6FNoM65+G3BQ2MKjHOJZDxNYQnWGvxh3EOvm29uvq6tPzUl
         TlEOL7J5KHNKSBmnrTbTZQoBn2i//tss7BsPOCzXV056qswqSpqlvKYJQSFy8Im33MQ+
         QyyQEds8FPj4+1hRZtiXd2g6o7tjfi0f9dYi2kCYJdj/gf/UJj5kusujz523SD47uOCU
         MXkg==
X-Gm-Message-State: AJIora+IOLxSQXKA4Ot5Nb5lVS8moIlM++JEasgF3VfMpAq3z3D9LTQL
        jXxROakg2tjfx+sCIH/KskaKjQ==
X-Google-Smtp-Source: AGRyM1vdjRy+BCqpyZ3tLDjOl2VIOGzlWV1J901EdHDM6CIzlHMOP0RhSBVH0wsgmnzO4sa72wYh6A==
X-Received: by 2002:a2e:8749:0:b0:255:81b8:163e with SMTP id q9-20020a2e8749000000b0025581b8163emr4834846ljj.463.1655468968270;
        Fri, 17 Jun 2022 05:29:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC device node
Date:   Fri, 17 Jun 2022 15:29:22 +0300
Message-Id: <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the MMCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index dffb87a5ee74..0c7b7cd9f23e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -751,6 +751,22 @@ mmcc: clock-controller@8c0000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x008c0000 0x40000>;
+			clocks = <&xo_board>,
+				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
+				 <&gcc GPLL0>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "gcc_mmss_noc_cfg_ahb_clk",
+				      "gpll0",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "hdmipll";
 			assigned-clocks = <&mmcc MMPLL9_PLL>,
 					  <&mmcc MMPLL1_PLL>,
 					  <&mmcc MMPLL3_PLL>,
-- 
2.35.1

