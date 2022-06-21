Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31F6C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 23:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237933AbiFUXeY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 19:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354799AbiFUXeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 19:34:22 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580A730565
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 16:34:20 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id k127so9278811pfd.10
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fJgKFMAN9XJcQFXSIBW4zb7s2vD8f3jyjsxvG6sAqRM=;
        b=Z/aOhdB8XUfEaX6j3ZNfWzrLU8KayJ5c0OPQZEAXfEJowv3AwV3zrG7mrwvN0nWAWV
         CUn4WPnoToYv/Lxu57bR6whg484OXyqomiPAZhX3mPCt617VmjYCnAzR7NMvpq26gd+d
         GipV0733h/usUyYvSwuLEVVvgMHQhQq+gfJif410klwaaoUgSf4wq0IX1OvZF7k896DY
         Lv9IzoMeHExsa5iz3vfVL0THo/CRD538fxMfbYL9TprYPtbRincPVLittQnywjDm2cIL
         52MbdQSNyFpI2tF3sKICGYcKiPBlQ/BmbKVzbswSeoAQ8zqTOMqIysFYiXB4EIqYrLNl
         FKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fJgKFMAN9XJcQFXSIBW4zb7s2vD8f3jyjsxvG6sAqRM=;
        b=rEu7psakNYrA2dkjfzyuXZwf2EN3hpo+Zmp2W6hB/tLVL7I1LdV4TDD4LMFg9AzMst
         rTjM1hFOY5WEX9XBSFwqfEPLER3WNw8iaP/KFfr37BXdT1SS0fTw5QdWYgPUF8M97Je0
         GcPajYXxZ0zd5VrSLq7sSrvCCsigcXynjZYxsCQz508wI9zTkr20rl1ludXeMagcoK+h
         fbO+jEpzXzIVrM3rbKpICZq9kYkiNalOekb/Pa9UBdJFIJFE7UzKVMvXwYlXz3gfTwDw
         nzKwBHANjkvo1BEpzRGozr2BvGxSSn2vfifkf55453jIH1dsj5sKgljcybwRNG0hx4mF
         Mr5A==
X-Gm-Message-State: AJIora9D8gJ2NaOuRuf9zWYnB6Q3c971Trc4WTKkx933OQfJkS3nvUnY
        Hn7FFyJkk0UzwTpzUn97XW+ECw==
X-Google-Smtp-Source: AGRyM1vur6Kvm3tsOQjtHwjlG48ZcycgnHC9uDokuSDAPpAacs8/ihbnm3Kn225KKBUKyNxVUGtiVw==
X-Received: by 2002:a05:6a00:b8d:b0:525:4637:de98 with SMTP id g13-20020a056a000b8d00b005254637de98mr67960pfj.31.1655854459880;
        Tue, 21 Jun 2022 16:34:19 -0700 (PDT)
Received: from prec5560.. (71-212-119-14.tukw.qwest.net. [71.212.119.14])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090302c700b00168e83eda56sm11297873plk.3.2022.06.21.16.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:34:19 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, robert.foss@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v6 1/6] arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
Date:   Wed, 22 Jun 2022 01:34:07 +0200
Message-Id: <20220621233412.506768-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621233412.506768-1-robert.foss@linaro.org>
References: <20220621233412.506768-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace &rpmhpd power domain integers with their respective defines
in order to improve legibility.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c0137bdcf94b..52428b6df64e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1656,8 +1656,8 @@ mpss: remoteproc@4080000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 0>,
-					<&rpmhpd 12>;
+			power-domains = <&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MSS>;
 			power-domain-names = "cx", "mss";
 
 			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
@@ -2167,8 +2167,8 @@ slpi: remoteproc@5c00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 4>,
-					<&rpmhpd 5>;
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&pil_slpi_mem>;
@@ -2235,8 +2235,8 @@ cdsp: remoteproc@98900000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 0>,
-					<&rpmhpd 10>;
+			power-domains = <&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MXC>;
 			power-domain-names = "cx", "mxc";
 
 			interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
@@ -2540,8 +2540,8 @@ adsp: remoteproc@17300000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 4>,
-					<&rpmhpd 5>;
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&pil_adsp_mem>;
-- 
2.34.1

