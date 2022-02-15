Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088CDC4707A
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 20:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244047AbiBOURG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 15:17:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243981AbiBOURD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 15:17:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92892EBAC1
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 12:15:45 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u20so10531525lff.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 12:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=289/KRcXVcnS1cCQf6Ylol+IbGt3fnLTiUWFx0ZifHU=;
        b=KzYHgYSUpFP3q5+s3QyhWqexkkOlfiRzO73vnK/LoLeOfoqJ/HIFz4agRS5YWTLk7v
         NevGSZ32B6WWyOlzDbtPoPQyMd5k3xXdD0TuC3jnt6aEKyh4YlGg5OUJLdTUAr0v7ibe
         wDb9MxZSi3JFxu04HmNfkBK5F1SinPs06sLGVI9JwoFHv/YRugMrHJkKfGnq3eFYXIdM
         5zVej9lK0lgq+LT70nixO/ZSL5I/X4aeOMwPiHc18BE6sDmo1X2qSOoazT3jRegwyF6h
         XE/Qxkm32qDxlP8TIIW1rGGQ0u+gkh9UC7DjKZ6itiHuLbiI4EW9zqlyHaUkdcukGmi4
         1T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=289/KRcXVcnS1cCQf6Ylol+IbGt3fnLTiUWFx0ZifHU=;
        b=Pv0cjHq/uKJ6Rw9/XWW2FSKQdGMzn91+Tw+iUxzX/JT54CxZ8JlqNjIbXflOUBv7MG
         JRQ1HfvMxr31ur14n3csXSKwjWRcst3GhiKHXjdR8yWems9rE5DTxX1XmKoGAjvoNAv5
         dLroT5+M/PG1PMk3/kfscBt4ND43wmo9GiWXBYKwW+v/lZJtY7cVaz4JT4nzCIGXJ29F
         K4h6cSwTkPqrObmw5RVW+hFL4skFomWlSuPDkD0tS4FUh1guAHjEBwUo7YJ7LmypllDa
         72gbQf4uVjX2akmLmkP9iEwlbIQa0nuAouPVnpDKbxJskg4cuaQsS2hBJr5gZbRLBAKd
         LZDA==
X-Gm-Message-State: AOAM532AmFo2rsY4rh5xXb8X0L7NJpNlh0X9LGb9mphs3IcwmF4EcyTH
        g8Lwm+64jJ2yL5o2MtZo5AuBTA==
X-Google-Smtp-Source: ABdhPJyIEQrGOXrpemV0qqsQDBWBeeEye1u1Iumt5gTShQ0bbEzhs5uLX3H/tZ8L4yUaMOsDm1Mjsg==
X-Received: by 2002:a05:6512:3087:: with SMTP id z7mr566466lfd.446.1644956143839;
        Tue, 15 Feb 2022 12:15:43 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: msm8996: add cxo and sleep-clk to gcc node
Date:   Tue, 15 Feb 2022 23:15:38 +0300
Message-Id: <20220215201539.3970459-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Supply proper cxo (RPM_SMD_BB_CLK1) and sleep_clk to the gcc clock
controller node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 91bc974aeb0a..7a46f0f67cbb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -679,8 +679,10 @@ gcc: clock-controller@300000 {
 			#power-domain-cells = <1>;
 			reg = <0x00300000 0x90000>;
 
-			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>;
-			clock-names = "cxo2";
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
+				 <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&sleep_clk>;
+			clock-names = "cxo", "cxo2", "sleep_clk";
 		};
 
 		tsens0: thermal-sensor@4a9000 {
-- 
2.34.1

