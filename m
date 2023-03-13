Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE01C61DA4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 16:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjCMQ7o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 12:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbjCMQ7d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 12:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23B72B2A3
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678726669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yTmnd9hxPpCOOutU5STf4RtQkxrVi6PXtGHNfI7VNJw=;
        b=DEaL0+fNPUYXgw5OhGyCV7Lp6czBeQLYg4QxQZXIrLrRPVzZlL4TyMakB5vhz52QKCpqB9
        S7QTQG6boTy8bY110wxsBz66z44RBF1iRkK29LHiDbYHL6LzqilVt7HeA78P7zl2qbD9iB
        HA7OJ1zXJEoBecKYX6GqnkQ5rCamb7g=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-e90UDFkuNt2Xhc9dcJ8s2w-1; Mon, 13 Mar 2023 12:57:47 -0400
X-MC-Unique: e90UDFkuNt2Xhc9dcJ8s2w-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1765e2031ccso7501584fac.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTmnd9hxPpCOOutU5STf4RtQkxrVi6PXtGHNfI7VNJw=;
        b=0mQtVFtO5q+qonsJ4kgvKRZARqTj9lbTXuuWI3MZD2MP5FVHPvMdvh+ERXEj8stnsf
         wCfIj0CCJP3Z4yxsvwhUkzL+sWj1VA4x8akLNN2fARhn372+zERTfz0BMSrI3hT5kKac
         AkEvBFuEazav3QxH1Tt38phLH0pTK8SU2vrqyTCddHu1lSMS5WmeLH439cG3hNOZ8vHZ
         7/yXALS+YKD69tR+ZFh6yCjDjT707t87KJ/b472K7iknOZYW+sUR3wEYNZ4aTyei56sy
         lLwVEf2QeWFNmHwHqaAH1eHqGVi1PXPzAiA0A/7NMGaSWUb4FbZCm2sxltkprrt0rkkz
         rbiA==
X-Gm-Message-State: AO0yUKXKeZuzzyi+T6ZI0w9pw9+ULsyY9WqOGfDCD1QyL0RATNt6pcd3
        Og6zzxcOKwKPfQu9U8ZUAvvtvPeHR7Nu2s/3qqRrGn+NO7b0I7ee9oxRrvfh6/C61Atiq9V4zm2
        Wwh5R65LWIlepPTfCDlW1
X-Received: by 2002:a05:6870:100f:b0:177:c2bd:3f70 with SMTP id 15-20020a056870100f00b00177c2bd3f70mr1768590oai.54.1678726666832;
        Mon, 13 Mar 2023 09:57:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set9LTjJnVi7KbqyM3HxA+UA+0412jb6ywCtvfKt8ocQUFVHxB1G6jo2+/GA0kywQ4LDzFQSvgA==
X-Received: by 2002:a05:6870:100f:b0:177:c2bd:3f70 with SMTP id 15-20020a056870100f00b00177c2bd3f70mr1768573oai.54.1678726666521;
        Mon, 13 Mar 2023 09:57:46 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:57:46 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next 06/11] arm64: dts: qcom: sc8280xp: Add ethernet nodes
Date:   Mon, 13 Mar 2023 11:56:15 -0500
Message-Id: <20230313165620.128463-7-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This platform has 2 MACs integrated in it, go ahead and describe them.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 0d02599d8867..a63e8e81a8c4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -761,6 +761,59 @@ soc: soc@0 {
 		ranges = <0 0 0 0 0x10 0>;
 		dma-ranges = <0 0 0 0 0x10 0>;
 
+		ethernet0: ethernet@20000 {
+			compatible = "qcom,sc8280xp-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+				<0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				<&gcc GCC_EMAC0_SLV_AHB_CLK>,
+				<&gcc GCC_EMAC0_PTP_CLK>,
+				<&gcc GCC_EMAC0_RGMII_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+			iommus = <&apps_smmu 0x4c0 0xf>;
+			power-domains = <&gcc EMAC_0_GDSC>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
+
+		ethernet1: ethernet@23000000 {
+			compatible = "qcom,sc8280xp-ethqos";
+			reg = <0x0 0x23000000 0x0 0x10000>,
+				<0x0 0x23016000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				<&gcc GCC_EMAC1_SLV_AHB_CLK>,
+				<&gcc GCC_EMAC1_PTP_CLK>,
+				<&gcc GCC_EMAC1_RGMII_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+
+			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 919 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			iommus = <&apps_smmu 0x40 0xf>;
+			power-domains = <&gcc EMAC_1_GDSC>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sc8280xp";
 			reg = <0x0 0x00100000 0x0 0x1f0000>;
-- 
2.39.2

