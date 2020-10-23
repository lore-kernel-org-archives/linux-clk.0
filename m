Return-Path: <SRS0=2J+f=D6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E17EC4363A
	for <linux-clk@archiver.kernel.org>; Fri, 23 Oct 2020 13:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC29D20878
	for <linux-clk@archiver.kernel.org>; Fri, 23 Oct 2020 13:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpTp4wLu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464516AbgJWNT4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Oct 2020 09:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464437AbgJWNTn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Oct 2020 09:19:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E230C0613D2
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2020 06:19:42 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j30so2057836lfp.4
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2020 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vs5mIrV/vf6dXVUTDjt/isM2L9GuwwyE1om4bgY/ZkU=;
        b=CpTp4wLudC7DAsrK1ThoOcKozcTO0vn/+OJRKPKooHTPqgO9ZFJmTTfAdC7YcLIeIz
         pDwIay79IUiwsxhjAFJg1a5VAo5gMpSVcDWkmiJrEaAAtO5DTgZpcEYfSCUkG33Vj5PG
         vUYgZxKYPsL0y3gf6Ee20myRXrgimuasFlBpqofZ/uEEllU3OXJB7dELxbZf7yUJMhEV
         /B57sdfKz8n6408WAfe5JxsAwEaz2gDQ3F3czB2nK3ssd/vozqMxIuVtJ32iVYkUjdSG
         jcluEtB63dJkJDOElwj6N7yy6srLXcof8S6OX7mqrEEi+DiGm0n0LwngI/s2Ld9NOWRZ
         Hg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vs5mIrV/vf6dXVUTDjt/isM2L9GuwwyE1om4bgY/ZkU=;
        b=LlXCDth0EOiIk9ihqTCVYqF2fkBKxM3oCNtJOpSSwh9lKjwOy1cj4D1jC7LH4/bbRv
         ScKRWbkLkJo1Xe3VvnDjXP04b4ya0HhIFssQ+KKM6NgVDYRnhdgJN4PPxek22//ZxEE2
         tdrW+blDgEARXUFB+TuEZo2TF+TSJ6NGT4AT3dzyoOyYvFxVZVpC5P8keYSN3+qevn3h
         tqNusg1TBk0l3bKzxDU38qkObA2ZLjq2L5Gclgf8+Yy49E/WmDZZaCraujI3DxEzUN1h
         bnUp/59kK7OVvarAn+yQRfk+C28bheiiSbBhta1w+lbU7LCRfJqQ0Lxw0HjXZS2/Vx1D
         3vAQ==
X-Gm-Message-State: AOAM532mLPKkPmr5LDmv0YrkmkzEATy2xROXrQlgeLGZ5PdYLRM8qGSb
        LkF9Zgc+vZpXiKAxoAXZtk8Wfg==
X-Google-Smtp-Source: ABdhPJw9ugMZCYpQu7QxG3hoZDbK0RbL4rhOr50EyBLVYx2Slttp8dcxQ4Sf5TIkPSMR6cZIH1hSwA==
X-Received: by 2002:ac2:5976:: with SMTP id h22mr708794lfp.507.1603459181044;
        Fri, 23 Oct 2020 06:19:41 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id o22sm161564ljg.122.2020.10.23.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:19:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm8250: add mmcx regulator
Date:   Fri, 23 Oct 2020 16:19:24 +0300
Message-Id: <20201023131925.334864-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add regulator controlling MMCX power domain to be used by display clock
controller on SM8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d057d85a19fb..c1d4a63cd2de 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -214,6 +214,13 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	mmcx_reg: mmcx-reg {
+		compatible = "regulator-fixed-domain";
+		power-domains = <&rpmhpd SM8250_MMCX>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+		regulator-name = "MMCX";
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.28.0

