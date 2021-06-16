Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A195C48BE6
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC37960FF4
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbhFPOOT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbhFPOOP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 10:14:15 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DE5C0611FA
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:34 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id t11-20020a1cc30b0000b02901cec841b6a0so2639530wmf.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V9cAs4L74nz4XfccSVfL7ca2Yy/QzkxFU6fTpHjGxgY=;
        b=f6yrmsi/ZtXMLCtqR0C38J36hLarvdkbEShpFPv9YhdnH68wYcLE1B7zWbSxeL/8i9
         ieKVPDG+PWXF03PuzBx7vwGJYQ8baQxsxNHWZIbiTwpnTMAvz5TtAC6BRp3ugrWnR+N0
         yYIZKvvhMTk9cG8nUewBL3wXxku/Ma72pEaK/QYrBK+88LlJ4wG4R9J+GzrRRoyTws0t
         qEw8k9eNVwGQSD+Ml6RU2hf+S9bIwsvxsYA9i39v56K/MtTkeyQfH1i0MO1bdZ3kiuJb
         ZCPkOCBIYVPdaTTfrw8dqAGDnt8fa1nxLGunC9Li5v0D1D3pMQULJDrKFwZBYqhyqAzJ
         fgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V9cAs4L74nz4XfccSVfL7ca2Yy/QzkxFU6fTpHjGxgY=;
        b=MgV62n7TmFNxLQCn/6PWiAE27x9RP9NG71MfL3qjx/LEeX8+eDSgPsnIQCBaRaJ7Xd
         F/oRWr1+gyGsMUNIfJGtFPApfwPajt8fWOgHMJ6X2h+Oc8bNruq6KkBLxuVQ2ZE4qwzJ
         4WpSXyFGRPjVMfmEybnKlIUik649MZ/g0J4E455MgEgXrpqO6S+JtyPzCf6/udQUhY0L
         eILMrS3hnLDY+91WJPS6Zyp7BgnRbYnfNseVhva9HiyxZRdlMBaQ7unREGGg4D0YOK85
         uTnOJu1PG3L+pa441xLg2dV9PdvtekGAtRNsotmoRXNZPmEwVuohoFeHG4pCtjLCETvg
         bmzg==
X-Gm-Message-State: AOAM532kXlNyjDoWsqK00anZcesWoqpHOqZ67nqwX5iJd99zTn20oDx6
        UM+aeDiqfPbJ3xCTgFAfqJeYMA==
X-Google-Smtp-Source: ABdhPJzhqvsnDX658wb7DXQJuY+cteqhlVKnNJdgPiZIlDqxxex1YvcFwSPcZKdmecVDbQviKrIh1g==
X-Received: by 2002:a05:600c:198f:: with SMTP id t15mr3679658wmq.27.1623852692720;
        Wed, 16 Jun 2021 07:11:32 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:32 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 09/11] arm64: dts: qcom: sm8350: Power up dispcc & videocc on sm8350 by MMCX regulator
Date:   Wed, 16 Jun 2021 16:11:05 +0200
Message-Id: <20210616141107.291430-10-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add regulator controlling MMCX power domain to be used by display clock
controller and video clock controller on SM8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ed0b51bc03ea..5dd32d4b1936 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -169,6 +169,14 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	mmcx_reg: mmcx-reg {
+		compatible = "regulator-fixed-domain";
+		power-domains = <&rpmhpd SM8350_MMCX>;
+		required-opps = <&rpmhpd_opp_nom>;
+		regulator-name = "MMCX";
+		regulator-always-on;
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
-- 
2.30.2

