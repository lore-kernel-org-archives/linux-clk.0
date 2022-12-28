Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B7FC5479D
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbiL1SxJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbiL1Sw5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:57 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A13916588
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:55 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u12so13591790ljj.11
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1+stahcJCfSV1AXaN0HNbKO8b+y7N9zk//F0UFBH8U=;
        b=uZKtg1KEF/EMXmqLbuL5EMEtt141kKHrf2h/AgVtJo5KArvSQZB8VuBHLX7uFr6v2R
         ko/HPrbB61HdtmhTichoRdFpRHfvAuZWW1+3xyenT/m07aMHk+kV7JkfenB7Py20IIh7
         8oajSY6qWgR8oGFFKUlBJhirzBuFlX22idIptMw/eyN28UJ0W1Px3dcFgS6rO+vcX06+
         j51shyGs+Wk5FssENv4KNhwryWknb3b4kz1dUyQxJ/vso0uBXAd9A/G6Bbo3dyosi/4V
         9fWtDni+GCuHG6rH/M1p/PolHB4vAsu/pAXHLC+cCrHc2pPne+bo5/hyy4BqqOI9mI74
         WI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1+stahcJCfSV1AXaN0HNbKO8b+y7N9zk//F0UFBH8U=;
        b=h2DbdbPwqkbWwvmxxEXt2uVbbQQR5WmxlJwtCQOO5M1Iz9v/EGAC3Nh2YWwzqxSQGy
         N1anpRKg3krbNcOXxwMrQ3QZSmE/T/sGkIbnQZbW2HB4axyLiGQ35LoErF2AtbnvygBs
         RUSWo7j7kczO+fFgp48CtFPDrP+34AgqRJlol++RsetR+eK5DZCrROrlZ7TiGxZYc7Uq
         DM2xQzQ1rJkiL25IHQK67Za7xHE1NNMuP0CN9V4PgLYj85UESHjVk2k1hgEVJr8xo56i
         I8YH+6EtzofVBfhQUOGw6WJpst3gI0K1Wa52nysd9DfUwv0gDpWf2RdlUK24WrQR1ZOD
         Eb1g==
X-Gm-Message-State: AFqh2krhqUjZm8LdOc5zWmEc0lSrzt4UQQzS+U6xrOry+vLeD1aNm9Rf
        kewyOgwRgXcD4ZXy0qbdaCwFlg==
X-Google-Smtp-Source: AMrXdXsaF1HBi9+2JeS39vDiNci+fs1hnY4V+u6EJ9WURqnULPQUxqbzJVYuKBjKk9wVgWLAwf77zQ==
X-Received: by 2002:a05:651c:2006:b0:27f:836a:2299 with SMTP id s6-20020a05651c200600b0027f836a2299mr6904143ljo.12.1672253574992;
        Wed, 28 Dec 2022 10:52:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:54 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v2 16/16] arm64: dts: qcom: msm8998: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:37 +0200
Message-Id: <20221228185237.3111988-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 18cc149b6be4..6d69dce14dba 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2398,8 +2398,7 @@ mmcc: clock-controller@c8c0000 {
 				      "dsi1byte",
 				      "hdmipll",
 				      "dplink",
-				      "dpvco",
-				      "core_bi_pll_test_se";
+				      "dpvco";
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_MMSS_GPLL0_CLK>,
 				 <0>,
@@ -2408,7 +2407,6 @@ mmcc: clock-controller@c8c0000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
 				 <0>;
 		};
 
-- 
2.39.0

