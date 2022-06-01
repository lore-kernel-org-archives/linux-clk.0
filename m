Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D713DC433EF
	for <linux-clk@archiver.kernel.org>; Wed,  1 Jun 2022 12:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353046AbiFAMnx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Jun 2022 08:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352976AbiFAMnc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2022 08:43:32 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72650457AA
        for <linux-clk@vger.kernel.org>; Wed,  1 Jun 2022 05:43:30 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id jx22so3456556ejb.12
        for <linux-clk@vger.kernel.org>; Wed, 01 Jun 2022 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fJgKFMAN9XJcQFXSIBW4zb7s2vD8f3jyjsxvG6sAqRM=;
        b=wWb/JJlzX0SIWHjpeJlod/weT8/DIjxKgugl1Z6rRqQJ7VMH80FEIreq0WFcVSdQKL
         cinKRNoTO8GAYb3D/LjLx0reNWvGukOd318oeNuQofM3XgdUKIdJgEQJ/uEhXVMrDzuh
         1uclUGsHXCOCLzWLDcWyuOERyhPHeULrEKZNzNfvrUFF0FgolhHV1jblnkwjOXCmsZgF
         DJIbZOtOEV1LWLrtX0EFBFZtp3HoJxDVsxge+8HpmkXql+oR7Qrx/udbQA7Bu9iTmbUL
         lchwJvlp18Pn8XZot6BpWIrQF4GAtmFL3RnTZe2EoZLn6iCSvXddWWuAsJWutA+16Bsq
         rCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fJgKFMAN9XJcQFXSIBW4zb7s2vD8f3jyjsxvG6sAqRM=;
        b=vxljWrcwV24xJokqF+mf1D5HnvKg6OaEIkuBj0AbGxRrRk5Q3abECPuWDuk3Es2vTK
         RF6hRM7QVpw/vaM2Z3nnZeZMlx8NIEER062DVK0KQ7+CvUvFvflLyqz0IsN5pGRWiXus
         5G/qjAyt2cKxGDzqRg1hYtS5IOa+Rq0gXe42AGfyP/5NNyNzp1duxsfA7HTpZ7C7Mfqc
         vOjuk/CgTl53ex/ddD/vYITwQ4UI9s7Au3Urj/O4ZL8VL47vFRTDyeeRGtPUr+T3Cuon
         r61T1uWY7qVFQJWi4MYDJN3NkisrkB2U2uf02RzP7e46+Ju5qKjRszquKM0qYXULf6dO
         ovow==
X-Gm-Message-State: AOAM533xmJ3Q1cSScC/v/gegOU2PRsV9LvY6zdV5+p2ydUOYKT6M0hL/
        /doAmIEFHwXbdAzGIrnUHue4sw==
X-Google-Smtp-Source: ABdhPJzxE/WrmlCGuCBtlVNzkPgXcSPnDCjyJPc8KiQIiNpVTpDZ+PYqo5REyO8I1Idj9VX8sBcRYw==
X-Received: by 2002:a17:907:c11:b0:6ff:a149:43 with SMTP id ga17-20020a1709070c1100b006ffa1490043mr9062197ejc.317.1654087408947;
        Wed, 01 Jun 2022 05:43:28 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906830a00b006f3ef214dc0sm682055ejx.38.2022.06.01.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:43:28 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, robert.foss@linaro.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 1/6] arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
Date:   Wed,  1 Jun 2022 14:42:45 +0200
Message-Id: <20220601124250.60968-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601124250.60968-1-robert.foss@linaro.org>
References: <20220601124250.60968-1-robert.foss@linaro.org>
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

