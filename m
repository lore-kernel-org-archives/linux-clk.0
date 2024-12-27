Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A21F4E51
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305146; cv=none; b=XWV9MfyD87a5ZSDSLtnEmHkdSd05fxTpEvZfBVkCn8W4OvA9D6BK0j8FIFcs2C4FTnjl4ch61jDxPDyvlFjSR7liTTdY4NUB+xkIcD+GucsmXmIlYLI2RGmF8nxyiKpEROmUPacGdR8DqkpVZf37309o0tpbLzY725K8B3cQbDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305146; c=relaxed/simple;
	bh=NdOLCsokI7fFcZT7leB4rZD0T+tFfneCILi66GjN1HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cb2bwVHl7nzZ5gLw4+O+fHGx0Y27TxHOn9PgXSDuC9Uw1tmKQrK94rtAeffIpJ3Smcl7EI5eTjLxmB8h2X7XF1kRmdV0uOASRLskK3qS7mr8u7U2ZQPO6gAOEZSjX82C8QoCzoIDM5Ef82qq736FE3f6qwV/WcNh+vGb9uBY7+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=amNNKYxI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="amNNKYxI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4363ae65100so76670485e9.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 05:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305142; x=1735909942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8s+qEZpEbsqh0xa5Mnwy31VON0bjr3N90r6hfq8Ne8=;
        b=amNNKYxIIJWpVhHS2HDQm+S2HjX+bznL5YsqvDyOI511jozBxmTujJBoiZXnS6s5Ou
         h6KDZCNcHD5Bzc85zIBqkAOdG/ncts0fcOK8vbPPTHLn4K15FpIA+0Kod3S6ZtCS4NNC
         LbFn26jqxvS0kXWtgQF9r+fTVvxX73b56QiipbrW6ElnCHpAxb0kvuh3N2lDnWfIUUhB
         WRcAqGdWG8TX4Hx0iowAXtnnNnPsJw1G0AswfcdxE9IXSH9yBjfQUH0BiOgPBvFx8IFY
         eacw1a4sh+wOBzL9aOhJM0441Kzs52FyFqejVwE+PYo4D1XxUOZ1aV2QAc/4++f4GuFZ
         W4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305142; x=1735909942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8s+qEZpEbsqh0xa5Mnwy31VON0bjr3N90r6hfq8Ne8=;
        b=AOfNafurcOuMcb78TDVVgPuJkQAjdXjD9rIZIaK3B9KT4t8DHUroDlw+K7GuQ8smLs
         qXJCGOTtrqtIsuI3TP4nTGX7+nbb8ONYDGqGYKDZfr9CLIYn2MvAFAdbdAAfi6X/P6Qr
         gD+kHM+hr2/RXYJ0kXG5yOaS83ygzTviUAx4vHTy70RA8QwFRXPLJeHls9p7i/d/eQ8T
         jbZzukvzNnHnWloOXEjSOzqhx6zf53IdUDI6QBUh1P2hoNP+EhCeKhgQd7kJ4/+BdvJr
         etu9nKdnNzvHaTEXpgpYJIi3b4wHVfyu4ynCl7wptDkhpao3buRygzTzXiv0QHEKyK1o
         rtkg==
X-Forwarded-Encrypted: i=1; AJvYcCXyhHOexiWYrhx65OIbM+WA5uXo7VwbOYkGQDdU7njhRMd/CceiUyptbmMjxKKmwK1DkkzW9MkBXOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwEvc5oCnC1eR7oh9df0xgPrZ5DV4nqAAAD/QNtcPCPzRhzUgv
	tHoSdBNDYUwz+MVoZYcWYehqchQftnZlwI+J8Rbz26aVQOWDZ8A3gOwhqa3s1Ng=
X-Gm-Gg: ASbGncvXOvgRuDNUZK2HZ2wVncbUda6N9yqkH3krFh7iTtbWZkDpJi/phrXp8X1Z2kk
	jeRdb/Fp4cX/dfc8NAmZpVC60mQ+xDu+9gT3WZEPtJx/fUzbV5x2kO8nnAfTtc7wBP08qbOThFn
	7WZnXD6wPKSBYK3IF7iiNS7Syh6DpJCyOrynDzsFp64AOxl3uhJFWv51F3MKdiZaTEqNpbwd9H1
	MYIm/reM7PSLuQJn3Zqqin/svOk5pCd+0pOfPum4LcQVJy3i4fxDKY00B/wzRr8wQ==
X-Google-Smtp-Source: AGHT+IGVndvEJ4cMxkBkzgZeDE9+MN8CqCd3sI3n0j52jtS9UA4faZa1/USE2uaEgfW0/GDHIb2iYg==
X-Received: by 2002:a05:600c:1c95:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-4366835c1b0mr241449545e9.3.1735305141817;
        Fri, 27 Dec 2024 05:12:21 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:21 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:11:39 +0000
Subject: [PATCH v2 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-6-06fdd5a7d5bb@linaro.org>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 185 +++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index cc174a021e4c7b3f6578f44691eb70592975f8e8..decb895da44145e7480c782c7814ca064e7c9aa0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4726,6 +4726,191 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb6000 0 0x1000>,
+			      <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0ace4000 0 0x2000>,
+			      <0 0x0ace6000 0 0x2000>,
+			      <0 0x0ace8000 0 0x2000>,
+			      <0 0x0acec000 0 0x2000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>,
+			      <0 0x0ac62000 0 0x4000>,
+			      <0 0x0ac71000 0 0x4000>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe_lite0",
+				    "vfe_lite1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_rt_axi",
+				      "camnoc_nrt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "cphy_rx_clk_src",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cam_ahb",
+					     "cam_hf_mnoc",
+					     "cam_sf_mnoc",
+					     "cam_sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x1800 0x60>,
+				 <&apps_smmu 0x1860 0x60>,
+				 <&apps_smmu 0x18e0 0x00>,
+				 <&apps_smmu 0x1900 0x00>,
+				 <&apps_smmu 0x1980 0x20>,
+				 <&apps_smmu 0x19a0 0x20>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.45.2

