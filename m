Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609991;
	b=CRRHC8E5qycVuUQDsmXMQ4YEE2hAa1YF2aRw5ChNuNHg60ow8FOsoj26xcatYUBYbAuH
	 eu4AFJTMbUgo6go6AGfsZPAhhps1H7zz3tsVCm71E918FMvw1IOwB4RtMBBACnJ5wwlvn
	 y+Npnk2CSPrDEFdaYgX17eQfGh4K40aQFt91b67ZrmBdDrUebMDUZKapVODXxSM6TpyXy
	 QBkEqntGBPGF0dKdaHOSygJiUO/rap1s7eK1E9meL0W/JAQrh4dCHMusDpfXRbiAqrFKz
	 CWqmLtc/ACMWyCKoDFaR6JbwDlv6OIlDM10Ve1z4wP6rQQbTAKlNdga3USPevUXau3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
	b=Vwc4S0yHut6hDZ2IAHC+oA8zG4hMJ4AsxIBiDjX5hXaoFmodbj+fq324cvv5vs5sjpF5
	 wtIxtHI2fmyg5LRxgBME3FEe1jsgQy0D0O6pGzMOBf6cLMAf5ZyEJYI01VAuz5O/a+8gf
	 KOZ3mh1NIzgXHlZRLRs41zc3P0Q7B4CzdabtfAAHhCeHMRF70Bf77+9YSMdZpBXMr0dxp
	 +jgyZIcdC1G56/6c6WR98Owr0b9CCdNmlzc+/h4+cjqHaxqsXoyg456y7y9GWr9y4e8oi
	 ZpXcsiHZKIiRyQdr2JDPgs4t7y53TwOu0tN4V9/OM9ygcxOOnPFsG/vZrTTTeQn895g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coF9vi33;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB5B606A32E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB5B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coF9vi33
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ccca948203aso4328934a12.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609989; x=1796214789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=coF9vi33SW4tbGka+gZC7pdGpyvIY0OtwIIMqCJW6vpl0uAXM6J7Dc9W2kSeYwyCPX
         vM0U2N5kitDKak9f1DbQyMXw4taeVk6nLXeJ4JltlSKzQBPEtXHcJoiTegnw8Txj+zkq
         0dpgRSgk8+Pnf7PFRT5Mdo7IrR7VeBUzba7Q4m13xsgciEGMxd+fA8czVgId49TI+GQR
         rpsX3ijWrEAtMHym5qFNdSkOviJpeYV5UDF8U17c5P4nWNLLYz2kaHvV+txYkXyPYsu+
         wRQ91DV59oa740lYbhXpNM2UjhvWiUUdtoADlXYyYNp3s9oedX/hyfaa2obE8JmwwlVc
         mqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609989; x=1796214789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=iRiUozL5KFp2hyaZ1CSqPQSflD2hve/KeCdGohxCX8ADGoYjLKvORCMm+nfHjnLkWf
         ZyYkMVE6/15otNjUofLZ7Jd3sQKHSi2YvEfoSW/sygluHzoCsL2hbLrqfViUKO6K+afq
         ktf70xhYY0sxyCKSJSgvDVBiUyYrVwYR/DKkdUZr4UnlciD7mS+/luanCqxG0rIKR4Gs
         TuQQZpCdt+tcGyTdykIBndEiM8wiCpfvRHSnVnZY50AmNQzvutkj6S8bi/7IRMhsCsUA
         SpLt9nAGJ3WM66p6crfmiD2oOxe3yonHdbHFvynLGGhTmgbuoE11R72zq67YeEm+X0mP
         EzjQ==
X-Forwarded-Encrypted: i=1; AL+hErGMYbSGbPvkq/+OyVB0hd3rt3v808YIjgEEK/YFTOsn/tS/ZWgpWoGKD8x+4BhQXDLggwacplkaWkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cTYXfD4zs2rzajKlv2O98z2SC0M1y7HM5kDsLBjXSEj6m8SFW
	rHcmb8yqKL8VCQx1Sn6SSKOUGbvwNWnnqsqvktgrcPwdMAgI2CJkCS8Z
X-Gm-Gg: AZFdTZfnwrOWX+I0TWOdlfu4Aan2+XBtcG08K7TP668fBPBqoaUrj9uBOc5sA6GokUn
	XlLCFUyUnD5HVbdixYBVHr1GaTYMNYmY0t2rsh5GERkuXCc+vfEcuJQ5XwPcQIUdwbCXNE+brqg
	fYdjkRUr3+XyMbM64WF+eivQ3qd7uNJjEt//o6SneNK/eeXbpfwuTL1PudsKcdPWRMTJdzC09st
	lTPzcv8j3xpdJ101ZKSdNF3Ov8253A9PyQyrPNxc/iAOvTyW3kYgyYS71/BHOcxmD2z3TDnCZyd
	PYnAShIxvI5hJKLB3QNJLIKLFVS6yZuKLdFNkGhZ4OVMBRIjBGJs8hadfSONc8nBvulFSg1JBZw
	SQy76SkjpnUNoYwnZ8aL3JrS+6X1x3jPRFDiHp/kmjeQeoGb1sIoIAwSKdMR9hTruXbxPpQC66P
	rotVI09ljKEDRzKsO/rDYTxwOlqSa4s5eH2lBJzHr7A1qGii9ShxaNDfWCfw9fZ0mFpnjwEgYWM
	Sa4xhZH0JbRSymRVNhQa+MeqSm4/h+POxyB8d0l2Il72byr0HxafzgijwXnuWYkHhTI3Vi+aULF
	CdX7O5dGCXivRa4xeojo3j4fnfglcMDKSNc0uYDfnXyQNb0=
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr16891721a91.3.1795609989472;
        Wed, 25 Nov 2026 04:33:09 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:33:08 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Wed, 25 Nov 2026 19:31:45 +0700
Message-ID: <20261125123146.379057-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the camera subsystem (CAMSS) node and MCLK0/1/2 pin control states

to the Qualcomm MSM8953 SoC Devicetree.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 145 ++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 753167c3f861..396472ba8f28 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -753,6 +753,27 @@ i2c_6_sleep: i2c-6-sleep-state {
 				bias-disable;
 			};
 
+			camss_mclk0_default: camss-mclk0-default-state {
+				pins = "gpio26";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk1_default: camss-mclk1-default-state {
+				pins = "gpio27";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk2_default: camss-mclk2-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio29", "gpio30";
 				function = "cci_i2c";
@@ -1214,6 +1235,130 @@ mdss_dsi1_phy: phy@1a96400 {
 			};
 		};
 
+		camss: camss@1b00020 {
+			compatible = "qcom,msm8953-camss";
+
+			reg = <0x1b00020 0x10>,
+			      <0x1b30000 0x100>,
+			      <0x1b30400 0x100>,
+			      <0x1b30800 0x100>,
+			      <0x1b34000 0x1000>,
+			      <0x1b00030 0x4>,
+			      <0x1b35000 0x1000>,
+			      <0x1b00038 0x4>,
+			      <0x1b36000 0x1000>,
+			      <0x1b00040 0x4>,
+			      <0x1b31000 0x500>,
+			      <0x1b10000 0x1000>,
+			      <0x1b14000 0x1000>;
+			reg-names = "csi_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csiphy2",
+				    "csiphy2_clk_mux",
+				    "ispif",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMSS_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				 <&gcc GCC_CAMSS_MICRO_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AXI_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AXI_CLK>;
+			clock-names = "ahb",
+				      "csi0",
+				      "csi0_ahb",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1",
+				      "csi1_ahb",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "csi2",
+				      "csi2_ahb",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi",
+				      "csi_vfe0",
+				      "csi_vfe1",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csiphy2_timer",
+				      "ispif_ahb",
+				      "micro_ahb",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_ahb",
+				      "vfe0_axi",
+				      "vfe1",
+				      "vfe1_ahb",
+				      "vfe1_axi";
+
+			interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "ispif",
+					  "vfe0",
+					  "vfe1";
+
+			iommus = <&apps_iommu 0x14>;
+
+			power-domains = <&gcc VFE0_GDSC>,
+					<&gcc VFE1_GDSC>;
+			power-domain-names = "vfe0", "vfe1";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		cci: cci@1b0c000 {
 			compatible = "qcom,msm8953-cci";
 			reg = <0x1b0c000 0x4000>;
-- 
2.47.3

