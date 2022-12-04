Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8442C63703
	for <linux-clk@archiver.kernel.org>; Sun,  4 Dec 2022 12:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiLDMpY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Dec 2022 07:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiLDMpV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Dec 2022 07:45:21 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BF216495
        for <linux-clk@vger.kernel.org>; Sun,  4 Dec 2022 04:45:19 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id n1so10580383ljg.3
        for <linux-clk@vger.kernel.org>; Sun, 04 Dec 2022 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz6SK3rDjXic/7QlaiKOpz4oBBRo4oAab1QkPKIoqeE=;
        b=qyWQRNks3BmC++YHNhD0nCSWaXK04RmlUdFOw3kRN+u1neP974oIRGq9+OMrLtjaOf
         sWj+E+/p6vv0aJ/cxpeNsQVSmUqQpjkaq+aYllvjB2RZ2Akg/CGyaNAfC4/I3W/Rq90e
         TXSp6ngAShijT1foy1Eidt/Nq7lV3dv3rJ9rXnMDpehhCVVvK1GZWr7J3WWMNDsVLObK
         wQSFGNP1XhJVS8hvCkHU1+MW5zZtAb167u62WIvDkq4v/49eQCD6RpbRSEFEbYvLANpe
         H+x1yL8+ZLlX1EAZeDaJJv04V+npmpYQPbaLoyzNjQV8mHC35WAe2PginiKVDzVMk34K
         gnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz6SK3rDjXic/7QlaiKOpz4oBBRo4oAab1QkPKIoqeE=;
        b=YkgqkDkYjanbaPX5lBprdebUQtt5ycmamxY6KtSKzy3+mjgG9zjjcaswqUxn70sNR9
         ipL+aYww5EV74tVNcfyulmchbxLHCwgLwZCtUPIXLv/8ytDEGoIzrUAkVU5ryucwrgo0
         whDrEiql2t6DZ2NLgZggr0yemK1qbdzAsUMOTx9XAVYF2aMlU8yt9fvDP14zvNYGkUcG
         4losYls2MtTmjddnGP64OA+IxVRluFC8JMv8NFkjfKxKtcun6TwNHsmQIG3g1if6FnrP
         gBbFCwmwS8x2g8a82f0GKZLF6intBlpAkxnsRskz1KacQYwX/qkwa81AlDXf+aEBfW3q
         1/Jw==
X-Gm-Message-State: ANoB5pmK04GeL/cBOT/vy+c3sf2n607Zcl5qHPstMugVaXHm72yrPL3U
        sEj+VTYbC0BzJkJIq+0uKhSE6A==
X-Google-Smtp-Source: AA0mqf7c4f9udhhUW/TaMW7meiyjZQ2hGgzQbQOAXKc29Yhq0HFTYlMZZ71FSYtpfUmLWgCyNz7b+g==
X-Received: by 2002:a05:651c:88d:b0:278:f53c:380d with SMTP id d13-20020a05651c088d00b00278f53c380dmr19718123ljq.1.1670157918889;
        Sun, 04 Dec 2022 04:45:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651239d200b0049771081b10sm1763006lfu.31.2022.12.04.04.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:45:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 11/11] ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device
Date:   Sun,  4 Dec 2022 14:45:08 +0200
Message-Id: <20221204124508.1415713-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names nodes to the mmcc device to bind clocks using
the DT links.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 10ce92772e7b..c48db7a8f671 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1528,6 +1528,30 @@ mmcc: clock-controller@fd8c0000 {
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

