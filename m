Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0623EC43217
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 09:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbiI2JV7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234962AbiI2JV4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 05:21:56 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0708D12FF0A
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 02:21:53 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id t16so879033ljh.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hmEOKTnSHdLdOpU//VqeokuUw4c7o7IbkBZ71gGs7mw=;
        b=Oy90nvZ7P8Oo+CJrDvRbRt/Ry0LT/No+n+F5mqRfR+oTAOvy+rnsj0sWIAirO3YpeU
         GGPkml5vqSSVQCRYymZQbfp9Rz+AEJ2LFgXgjslf6yYEWlnxye3MdAg2buSb8hi3dNtQ
         EyIAL6oWtbPDqciFcLifAZQ3N/vxNSVrPZ9Z/e9fMUhhiZVcMXwzsZU5+Qm3fjKTsOhY
         tGRtGdgm1+XKMP3schNAqoFse5LVz3rKLlZ3jcUeQZRCuukVh8i4dsy+P+R+k6LgmEWB
         AFbVZBvv2GiQrJWGwVzv5aTFz7k47kBiF0IFWGEwgM5X/IJXxT13g5PZfxLEPtoaeDGH
         ew2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hmEOKTnSHdLdOpU//VqeokuUw4c7o7IbkBZ71gGs7mw=;
        b=DCHbE/xKDAKyDw5dOET3wlu5uIgg/NKZ8XlEEaOFBN1WzCHVpvc2oWFZvNQKnd/cqW
         sFeirSdXs8nWMyLzbmst8GHt+eiQFNwm5XjG43z0cAt9Lv+CC6/f/2utJ4wFyrdExBzt
         xk3LeOmdE7aFq7LSwxc2W+XggkwNY7Eln3yq9YW/9U9o2+YsiXw4TG6ed6LCtXCyJ/PE
         +bxrvPyV4YxHImtbjrU0N86XPoJrLoRSZPHjTzwyHDcC8hSRTDlKL5kVhNnU98/UegSW
         2NbQxWlzh1X9N3u2vQufXJoRDEnurRtABvXRYWLL893bLSCaOXuxEOXFOiHHXBta4axQ
         Np5A==
X-Gm-Message-State: ACrzQf2qgRMtJ9S0Nwh+ZIxwEtXMQGviLjOqkCUB3wU9drf1cFWR8uPF
        jxTOrw9DZ9uvvkFmmZ3RagMCcw==
X-Google-Smtp-Source: AMsMyM6bBHyXrirwJs/tm/7rBmLAAskTpJ/WhE5s1xIO8nr5slTY1czph093qZzkRkeLlrLXVSeu2A==
X-Received: by 2002:a2e:9d88:0:b0:26a:95c1:218f with SMTP id c8-20020a2e9d88000000b0026a95c1218fmr781613ljj.223.1664443313447;
        Thu, 29 Sep 2022 02:21:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:53 -0700 (PDT)
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
Subject: [PATCH v2 10/11] ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
Date:   Thu, 29 Sep 2022 12:21:44 +0300
Message-Id: <20220929092145.473009-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names nodes to the gcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index c09ed8728ec6..76b9aaf93196 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1054,6 +1054,10 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
+
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>,
+				 <&sleep_clk>;
 		};
 
 		rpm_msg_ram: memory@fc428000 {
-- 
2.35.1

