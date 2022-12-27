Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FF4C4708E
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 01:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbiL0Bcs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 20:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbiL0Bck (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 20:32:40 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D985A5FD5
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:37 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f34so17814077lfv.10
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TVkAZLn6xEiSVHIuCMOu53NayhUzE/k9oibYK/dDvI=;
        b=Zj6PUkuM2VItJ02WnHEi12zZkU6DpgUS5frg251XItJd8qHhZrFDlVzJeVxrcmZs9n
         goiCFvq3Ty1S3MiYA+gLbUeLS2TattTvxTfuauWXatnTbAlCP/EmaXqDJsSFvuwG2l5F
         6WlKDQy+XJncBofcJ5LzaQNleSJqIJzAolj+d5paIGD+Zg43xQlptSjLgrmsuwtdNOsv
         48u/WGS4PbwIB/7EJMgNnq+zgfbtSLJy/0gKRYJRQMNICN3koHZErN+AthYWHPlfcw+g
         muxdQYDOECLkJJR5dxdjWWqEmGrf18CZXZjOYBmIhR1EMyyPgdAXkcCynWl2nbbt1rvF
         JgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TVkAZLn6xEiSVHIuCMOu53NayhUzE/k9oibYK/dDvI=;
        b=U+e9nY4w7ayr3OuAsk6bje8l4xKcVlO2BLAMzHOSZST9juAU6r3k58C0LybjE39JJT
         Lt6vpS6AYulmp00Cd9rB901q9W02PP8XBOyBbD6YPglgofOgB6AF9SLitROtsFaxscV8
         tw8c9U4/ZvJvNDFN/qTGYCO18clVcDtgebrbqT/kjjsz9rep/S+TuXjCc+I/8OuG7rN1
         J/+TMaBiZ5LlP+doLVZhy8nk51f6WgVotM0sGY61jbn67JMxkyO0POO7kEK49aEKHp0Y
         mjxnA9q9b3N6GfDdNLzAR5VCQAIRkpPwF5IjxXAkbRBgCAqGdZ5Akq5ZVVCljRb3R/CA
         PCsQ==
X-Gm-Message-State: AFqh2kqGThelqCM+6Kf36Xy2miUXWbpJWMKL7YkrxZTV2IxwsrQf1Kx6
        4SeK94v4I4RpvAkgZAd00d6fSQ==
X-Google-Smtp-Source: AMrXdXvk1MzxkNutzwGZwEFM9pXsY91JAfRyuyIoaYdM7l5q4O8ZyIAaAyxpGguhE8NFB9X1tKg78g==
X-Received: by 2002:a05:6512:2a91:b0:4b5:a9ca:9725 with SMTP id dt17-20020a0565122a9100b004b5a9ca9725mr5129337lfb.28.1672104755907;
        Mon, 26 Dec 2022 17:32:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:35 -0800 (PST)
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
Subject: [RFC PATCH 12/12] ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device
Date:   Tue, 27 Dec 2022 03:32:25 +0200
Message-Id: <20221227013225.2847382-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names nodes to the gcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index fe30abfff90a..815b6c53f7b8 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -388,6 +388,24 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>, /* ufs */
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>, /* sata */
+				 <0>,
+				 <0>; /* pcie */
+			clock-names = "xo",
+				      "sleep_clk",
+				      "ufs_rx_symbol_0_clk_src",
+				      "ufs_rx_symbol_1_clk_src",
+				      "ufs_tx_symbol_0_clk_src",
+				      "ufs_tx_symbol_1_clk_src",
+				      "sata_asic0_clk",
+				      "sata_rx_clk",
+				      "pcie_pipe";
 		};
 
 		tcsr_mutex: hwlock@fd484000 {
-- 
2.35.1

