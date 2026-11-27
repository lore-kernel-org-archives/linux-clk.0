Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787174;
	b=TO9BnHpD9S0NLndO8L+Kr9g+uzRvnWPFcWBG9sPUqFJtaiBsiplJavcBl0Cs7IphIbgL
	 /huKH3T59hANwdJvW0eyuQMjtPDpbiOQYCxGTeTucZaWNOdlJfsMzZydSYXgwaTs3qOkx
	 6hOELvc/m3OL4rPmexZf3kQvg3PUkt4c6QEYgk7jEFwQFsl5YKdNIiDoJQ8B9OzQza7XS
	 Na5Jjfql2bw7DS1fMSS7sTx5xj0MipvPGT9nc8K3cvtz7WxCpWm46MYAa2vqO/cRPBIFS
	 vSA78hOou1VU27o+Ix4d38aA/2h5Sqhg4VOMBDKY7EbjJLFgIN/lwyFmL8WGzCgCyog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
	b=NHOeJU8iWEGmHOGNljEmS8ssaGxJ2Ju1YESvdWcUYhed9W+y9qJAgF2npamDco2uzUcg
	 UeGekiovxaVZHMoMLaiem5gQxNY/kwKv0aticIUF64lLpcnMIdUaTGUc683cWw1LFR0Ty
	 S2HIhsxcHEYvtyKwJlZlZBtVflwyAgIPw/P0mIJ/R9OWEgW4ybweBSdzR5ePF48SLGNcV
	 Bd28yW46rMoB2DPpQgBJz0cIftT7y3Zmyzuspp2tRM15uvXvestX6KbS7t9L6nQZDV1/p
	 XMllV5kx2C0PaSXCUC8l8TJQjtMbRWbj2wOEuZUP6gA5D1RXq8/f4tzYeY571e0CB/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsSgoHTp;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B1606A331
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612B1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsSgoHTp
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0918f9e6cso23985565ad.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787172; x=1796391972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=qsSgoHTpvT/9ctbzZttJZbtP2h5pd+ESqc8K/2LSApxjk/xCp20O7Fx9kzvh8G6913
         7ZnaOx9ePfZQFSFrXeKpDFzMGe903VH/MGVYaeQN9rORudZ7+77YhFmlHb/7kXxEKLCM
         DTG6EbON6clJR0AvkEmLs0oWREJkTIbwlTzyyNb2obn3/UfC2sGXsjUgAD8vQ/b+fObq
         WGsVkxQf4nbTj6KKbRaJKRsxodoDy4rhSUX4QxsnplgzF/G/Ky6T81XzaoXbDStAZrq0
         ua9/JpZIS5oTK/rksg14NStePupbw5EDsZXPQqpy3cyTW/kRk1fIQWZ0H/na+TYZCPXU
         nhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787172; x=1796391972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIOi4XotjSG5N0aylWyaQJUjmIRTPs8fHeL4rfibqSA=;
        b=EO6mZxuIX3LyaqcqVFSriQo1kk9IO+0WVyshHH470OcsjC/qyGDN3Squ4Y9dkF4XVw
         aOKsK8P23TdA93L5E4iRdFmWMNv0nvIwG4RqZhYdIKR0Z9ptMFfwOyoJ/9ulcb6KjuCx
         VzahcI8dBVPD1tO0iXWH6sEtu6fCyw13n4sgJD+awpSXXrlnmVRdMRAcQEMGUh0SBj3B
         CY1VYDgM+upkg1DOp1VjcAUtTVcvCI5EpZUXUPEzptE4cCFj9Yr61Bzdh+mlOfKa/pAz
         SOGINqy3k6Ripp6DTlRxGKlWgPvd5KDb0byKync9/S7c4MCcDlcnvjzQkEWkiC0Wx9Im
         JolA==
X-Forwarded-Encrypted: i=1; AL+hErHaDppvz7D6FaZurjz7q6C6cqxOb+DH0jRpGOUOtJhFLRM9cf6ML46QbfozTidnN6qO2RMquq6G5hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/epbSzHX0o3KAPcAdWiAHN27nq0P7/SXFL0J4LviUVyDH+UHGG
	a+kcRS5XmnKy4fxpRtBom75MkysynEb/0Y8ul9DxyBKZRTtmozRHQ9c/wpWHD1OMfkg=
X-Gm-Gg: AZFdTZekH3C7Pm4DXdaPMMIry1U0rDuHaFPQttbFqLleArZN2/4JIlX4vCRcIVzvfRJ
	qdRCGIeBx1Ir37JiUT5hk30L05D3WtZfizprfzeu4FrxyUtb7D8dFaoiPRbaiodBgpnX/1orye4
	Ezi1Mza62PVSJyqzAlb1ueVexL0aCvtMcOURAikveIIgAY8LPh7GQ2myhxPdfHuxgnUovZSqdY2
	Rn001SHpXbEB1BvVPHpo/1isJ2h4qW0TcvLHpEa30p7kwx/BHtSLx93MQg7BfsTXzKA7dx1OO4d
	3+Rn+UY2c0RQ0pKOjvf0pvhW1f+YgW3up9YfBtCit/Nz34a2dj1RisWElUTRd8DVHTRwHSITe95
	02COhQW7IZVsVP5HLIs/UTug/Egh/J5a7KlLQZikzwTdGV9Tik/oUi+QN4EJfPWjGRTEB/iRHrG
	KrC5jt9MGNJzX4SllZsOPZtg/Yac5yaQcFavPzEuvxeODh6javOVsoiI8M4yPzSjMnYXCbdXWoT
	mn29V+U8QJrqimZVD+Mys2QzEwbgttwpX3S6ZUdAUfa/N09TNnTS19VrIOxGKPyuA3eS5ZDvDec
	nZQL5M6BB1pK5LFMT2Os5J5FRLHZG8/4OpH6WnMLm7s5rg==
X-Received: by 2002:a17:902:f792:b0:2ef:e864:e0fe with SMTP id d9443c01a7336-2f03f1d70abmr227466355ad.25.1795787171767;
        Fri, 27 Nov 2026 05:46:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:11 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Fri, 27 Nov 2026 20:45:06 +0700
Message-ID: <20261127134507.125513-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

