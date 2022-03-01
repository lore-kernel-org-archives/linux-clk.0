Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7D8C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  1 Mar 2022 07:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbiCAH1B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Mar 2022 02:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbiCAH07 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 02:26:59 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7E27D018
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 23:26:06 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id n15so10521115plf.4
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 23:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zqsit+rOnmNUmUZtDFG33t7bXRXpX6/2jlTb49W6F6M=;
        b=XVXq1CqUkOy0IauKoQqHPRVEBDOmFxsVbMCBCVSpMUTt/yZvXTvQxvbCz/HG/S69Q/
         wwMTH65MgQohU0oNjMp1FnEuFWHDW0eNfoeN3aIk21r8FZZvrnMZU//LlIUHMSbXKQDV
         xDysHZftETGFVUFXS1OM7O/KKHFvWR9OwxjevkL2Lyqk73wHDTEMpnESbRXR1H13n1pY
         zGk9G7XmiL1/nZE9ftRRcXSO9iq59bDQ+t6lJgfF36nSB8zPuKUAXjFqJKRrytvXmrGh
         QxrstRz0p2xzoJ4kZhByWVGjC04ReqyaWLmtX7/DAoPEPYWh3zcZets17Ryd5ZMR8C+K
         YIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zqsit+rOnmNUmUZtDFG33t7bXRXpX6/2jlTb49W6F6M=;
        b=g0Aq3kRVETZorjYS6VTsm0EwkArwR1E+DS+QUXIL4caI5IU701jS0ju1PkhbtZkti8
         nHvv4aQY/7svUK6woFRWBpYbcKwHshZjGEnUMyvd6najYfG37zpv1TwEBLEaX0CriePl
         2Xw6gWWbggtqWpLXRn6ZnTADjX2ta2r1zQOSQuC/sQoIYR41FGrmh6zfbytBV8sipMkd
         /bHOeN4/eeVi7p0yB90nxNCT0Fs689C4XWOvZ7IO/tYkX/irjbPdIZRoNi+4+BQsTNck
         TLs9VADHWUAipNsC3+yfXSrQVYOxgYFl//pAeHvQOHrGC+DUclGoY9DpgW1nHoKAEdyg
         n+mQ==
X-Gm-Message-State: AOAM530JE0Kjgg4uBTW66cndVf+/4SfLCzB2WOJsm/B8cgUaWaCbFZK5
        nBAnavtLKQKY2UcSWZKqqrNFBg==
X-Google-Smtp-Source: ABdhPJzJGVeQhFZly8+WyH4nDCQf2KMJMEKARcT98uKhQvoA/Cu0zleaoxSFfcjFu38e5cJcnQ9oig==
X-Received: by 2002:a17:90a:dd46:b0:1b8:8:7303 with SMTP id u6-20020a17090add4600b001b800087303mr20399140pjv.197.1646119566426;
        Mon, 28 Feb 2022 23:26:06 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id m6-20020a62f206000000b004e152bc0527sm15680445pfh.153.2022.02.28.23.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:26:05 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 7/7] arm64: dts: qcom: sa8155: Enable pcie nodes
Date:   Tue,  1 Mar 2022 12:55:11 +0530
Message-Id: <20220301072511.117818-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301072511.117818-1-bhupesh.sharma@linaro.org>
References: <20220301072511.117818-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SA8155p ADP board supports the PCIe0 controller
in the RC mode (only). So add the support for
the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 8756c2b25c7e..3f6b3ee404f5 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -387,9 +387,51 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l18c_0p88>;
+	vdda-pll-supply = <&vreg_l8c_1p2>;
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l18c_0p88>;
+	vdda-pll-supply = <&vreg_l8c_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>;
 
+	bt_en_default: bt_en_default {
+		mux {
+			pins = "gpio172";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio172";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	wlan_en_default: wlan_en_default {
+		mux {
+			pins = "gpio169";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio169";
+			drive-strength = <16>;
+			output-high;
+			bias-pull-up;
+		};
+	};
+
 	usb2phy_ac_en1_default: usb2phy_ac_en1_default {
 		mux {
 			pins = "gpio113";
-- 
2.35.1

