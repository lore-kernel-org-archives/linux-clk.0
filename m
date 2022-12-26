Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9824CC46467
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 04:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbiLZEWX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Dec 2022 23:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbiLZEWI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Dec 2022 23:22:08 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCBF2AE6
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:04 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bf43so14689509lfb.6
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3Cjy9s6gypFp3ghKgty1JYd6DQSNA1Ltc9upzL/NcE=;
        b=ort+xNiFTW1OLCtBf9mySYVPp/oh2y0W7fcdvsiGLVD8ffg2068oh/jBCHfBngMXLk
         9a216O+Mvxwcgi42b0wNcGdy/UHsj0IHZL1HMO01zTsS8TCL7KRyj7TmMqsjMRISTNMs
         brPoNwt0kcRrVJKeCmolumLDAcwl+W0ViDnbnlz0P3m6/0ux6XhwBER+DWnZk8i+rapl
         MEMOwS57bV1Q81OkFY27I9F5uueu+i7HHlZqF8xBWq4kEEjsxMm99Wf2IbqC6Pra94D4
         g6YAGTEtrVU8gBOMKQES9swUgR3QfAJWiqQF3lm5oPZ3VmwN9EBF/lpnKZw4XHvYFzv3
         0YJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3Cjy9s6gypFp3ghKgty1JYd6DQSNA1Ltc9upzL/NcE=;
        b=sYdurovWfheOXvkMxGbylQsxBNRuXzl7EQdfjc044TGRmeY1eTbczoG2CcJaMOudpJ
         YwlcHYxfond//MUJUBTanrHNCh88K8D/TQl8flgILOJQKnjAGpOmDdzDMp00aJEzjYoa
         ZcyuNDxIaoEfW2Opq2DlqGcKF5xkoWBjEO5UuYeoBtf2oPYc54CovOrMA5lcD/OMr0w8
         Trzn5TCXnFYLjcbT7gPF0eFAT8XrpnaOQre6+Ux74k0w3vnoI5pkF3wmmaYEgB7O7TPt
         p1EhdZMD3NoBjhGAvsR0lEmA9KfcKCpB5zddtTy3CBQ8el2u/Wyvj4+f0PnTbn94QqpB
         080Q==
X-Gm-Message-State: AFqh2kqX/G7y5cK1AOunwTVwa++m4QZOMSul4h/uwMBWbroZGxvkGEFm
        IfEodlaYtjiMI3b2M5GNQs+pgngt1ax1Z2OCkF1W0g==
X-Google-Smtp-Source: AMrXdXttQJDfNNEbtYq/mZaOMKWs7K3DAmhknVeOeKGMe+SZhCQ3+Zm7jCfw/DTE33ixK2oVZg6TLQ==
X-Received: by 2002:a05:6512:2102:b0:4ca:f9bd:3390 with SMTP id q2-20020a056512210200b004caf9bd3390mr2247565lfr.31.1672028524475;
        Sun, 25 Dec 2022 20:22:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:04 -0800 (PST)
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
Subject: [PATCH v2 13/16] arm64: dts: qcom: qcs404: use symbol names for PCIe resets
Date:   Mon, 26 Dec 2022 06:21:51 +0200
Message-Id: <20221226042154.2666748-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets") added names
for PCIe resets, but it did not change the existing qcs404.dtsi to use
these names. Do it now and use symbol names to make it easier to check
and modify the dtsi in future.

Fixes: e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffffaa7507cf..ffc4b081bb62 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -806,7 +806,7 @@ pcie_phy: phy@7786000 {
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
 			resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
-				 <&gcc 21>;
+				 <&gcc GCC_PCIE_0_PIPE_ARES>;
 			reset-names = "phy", "pipe";
 
 			clock-output-names = "pcie_0_pipe_clk";
@@ -1337,12 +1337,12 @@ pcie: pci@10000000 {
 				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
 			clock-names = "iface", "aux", "master_bus", "slave_bus";
 
-			resets = <&gcc 18>,
-				 <&gcc 17>,
-				 <&gcc 15>,
-				 <&gcc 19>,
+			resets = <&gcc GCC_PCIE_0_AXI_MASTER_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_SLAVE_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_MASTER_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_CORE_STICKY_ARES>,
 				 <&gcc GCC_PCIE_0_BCR>,
-				 <&gcc 16>;
+				 <&gcc GCC_PCIE_0_AHB_ARES>;
 			reset-names = "axi_m",
 				      "axi_s",
 				      "axi_m_sticky",
-- 
2.35.1

