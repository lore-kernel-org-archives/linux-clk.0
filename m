Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF77C63706
	for <linux-clk@archiver.kernel.org>; Sun,  4 Dec 2022 12:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiLDMpZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Dec 2022 07:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiLDMpW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Dec 2022 07:45:22 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AEB16583
        for <linux-clk@vger.kernel.org>; Sun,  4 Dec 2022 04:45:19 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b9so10576357ljr.5
        for <linux-clk@vger.kernel.org>; Sun, 04 Dec 2022 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIVRlpQw2BiXQjlLoWqpKBlE3DlnG3UKDex4KSMyuDk=;
        b=eKDuM+xxSW1lIb5mxsBLYiKe+KhhHMnRDpSMD96YMgI74eyAZHUDe0LzmEkiiJwLmt
         eNpI46ndR5XmMovRhn5AY2wtQqknJfPKYyrpBfx3731bO/a1oMNFzs0tpDHK7oxTQadb
         CtocrP21mHRXOiKdZU8GcSb0aNkZATD5TSr4crvaIfTxCj98VfK/Y4OG587BhqJGFQa4
         SJ4E75nusXADAKkKMG782wUJxo5FcMwOdOnLtwL+rFctn9aaolmsTpX3E54cBPTP7W+f
         iIJs8s/IdMNOTUEAL+uQafXIEGFqoT92ERxupE8Hyjgbyq5XKRaRAIgLvEz6Nag3Scqv
         Qd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIVRlpQw2BiXQjlLoWqpKBlE3DlnG3UKDex4KSMyuDk=;
        b=5UP78xQXEskgt6nwz6niIhuxZ5z+qQbylc1WAAYFLFxGGKN4t3guQuRIzG97ViVTf7
         5P/DhwJFYccfUQ32frQkou602RoQFNk/mp7OQKsPywSlxOPcWqMkgNR2tTDuW81Dg7fK
         4nOlNBi5OC+qMefgim/pciyh/LKiXM4DDPQx+r1h6FMz2iduk2H0185L7a1+zTR8ARUI
         nb0WRG5KU3Yh8oIfKhJcHZxsxkSaUULyC5tADfsAr3YJrZoEm/EgOVWACGmiJUq+hUwB
         t31m+grD0zx6feUqP3cvawxBzBg7h5VSY9lTIP+sihy9XG0ozjN+xwjLeTMlOgqK/xe/
         Mj1Q==
X-Gm-Message-State: ANoB5pk3+65xz9aaCUHtk5P4eWFsJ3t1eMMqiLuaN55UD+PtXeeG47z9
        C09S9V5Hp50WDI9vLHvgHfHVZO2ZaxEAafvk
X-Google-Smtp-Source: AA0mqf6L9ju1HHMPzEr/7DWQD4960SJgP+4BDMaU2cDVY5w13bdy7Wapj+llPXdjlqhi+jcqaxU48A==
X-Received: by 2002:a05:651c:110b:b0:277:e62:ab8 with SMTP id e11-20020a05651c110b00b002770e620ab8mr18965902ljo.314.1670157918092;
        Sun, 04 Dec 2022 04:45:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651239d200b0049771081b10sm1763006lfu.31.2022.12.04.04.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:45:17 -0800 (PST)
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
Subject: [PATCH v4 10/11] ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
Date:   Sun,  4 Dec 2022 14:45:07 +0200
Message-Id: <20221204124508.1415713-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names nodes to the gcc device to bind clocks using
the DT links.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index d3e3b34605f4..10ce92772e7b 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1054,6 +1054,11 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
+
+			clocks = <&xo_board>,
+				 <&sleep_clk>;
+			clock-names = "xo",
+				      "sleep_clk";
 		};
 
 		rpm_msg_ram: sram@fc428000 {
-- 
2.35.1

