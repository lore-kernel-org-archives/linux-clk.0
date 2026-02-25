Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91D3DA7FD
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032308; cv=none; b=LjO7I7EuLnoIsPIaCDAkVmCmdBAaUgw3GN8+DFWF1dXmyKu5YL1KjAodtOXgvPn1PNBweyv7SwKB0o0gPJ+NueoD8oF4xg+pdW7/UkpO55ph6cRFzdi1W0e2Uz04BbHKDjGOh3DH+UEuQBjic0TPbBqghGwH5AdCNtKtmviHKdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032308; c=relaxed/simple;
	bh=GYfoI7T6mjDa/S+MCyCQqGHewuW6qEL6oggAmV3uB3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESgJXq/CNUFtkuoktxyhntypbuaoTNyjxiUuF3i2fXYChNGc0Ff2izKGN8RXIXqOsQtPlsTzgB3kctcUu/zqbZdY+bSEMHx0w1m5dr3/hs0U3RFU3BxzUXQ7IEqlar+Wx/TKuAXQ9X3PcQMZ/Cu+Ui/4+dovqaVn64FvK57MqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPUicIid; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPUicIid"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so61064725e9.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032304; x=1772637104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qV5VAnGs37bBggq0q2cUNMLZwS44aCdCLNpUemn8G6Y=;
        b=cPUicIidmntKPbIOCpSqoBYSpo3hw3ZH8wrsXDpVp5XDCTD0UjPzixlAOLfqpKtqDL
         2qLztCMX4Y7TVKEKYoH67e4hWlxAUnHWkoIFbnzTdY4f9xM6b4fZzh6WdP6iLPIV5d/j
         Z4dueswVWvFx/aKC/8U7QrcZ8Bpi7BUWE0I69YsDwDgtxAoCjDoT0s7kGaowZIqgv8J6
         vMEp6VaDhyWCzPoNHj7Y3dBKCNnia4OEUm5poq1b2DB0GHHe4dXWgf1MrsK7WVmKBV1B
         2qtfXoW9HutgV+p5o/xPo+8sqD3ovQpN2MmqNtzk+4wda9bzQvGfdUu0OyeuNkVc5JJG
         UUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032304; x=1772637104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qV5VAnGs37bBggq0q2cUNMLZwS44aCdCLNpUemn8G6Y=;
        b=eOLTTA34KiLWRWOOXBFdRO/XhgX/HZvajaXcys+9O+IS+sLpaZ8/dfzIICv1Y78Z/1
         n/pq9HiyzggshmEup/NcitNr5tlSzToOk3S8IwXYl+NHfE7S8Xvs4cSQca/mmhCkzNEE
         usrhVk8SMvwxc1NBqP0Zg56fptJ0+pV/lmP6JSKFyEb4x5ySA0z1wRBkQ/kCr+cCNcds
         ziA3u0LiLRZpuCvNwh+9uiDfn22TZU7Wm3Tqau9RkCzU0avSaoszjhR/i8LksPcRtToK
         mLSIxD+gnbkOvKx83QhOyP4MU5GY1ge32P1HCV72VXfmli0y4UCTGDVSVshKKw1OQiGH
         wCzw==
X-Forwarded-Encrypted: i=1; AJvYcCUNr4M/BypQhtUCUrDt9nvKGkiAbbBLAls5MxWD+BS3d8ikhOs64CZ19AAZczhoylSHhzaZFsBvSdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1xE71jirhiLBxelpYZc1PKxbKYb+rnX5bTcN0Yy0+QhLZUr8
	RGHmZGc+5sWk88nxptJyowM9T0dLnAph39mZ/PKwQw+BOeuYOUMvlnp9VU2bbT3nOuI=
X-Gm-Gg: ATEYQzyWF8mN54fmz7OSfcPjQkangR1IjEpChzxlK2qYzxd/5pXdMYRlSMcNMmIC6Wt
	1lAOMleVX7S1xQYS76w+V7YKox+FTgXGHAiBuGnyEh7xo56jU7UX07i00YgN/yvi1J6Em7SJN9s
	ppl2/+0IyoDepNRblRwksL4KUYmszsFdmyDqqKj1cdQ8IeenNM7VJkNUiSz9qpGq68UdK+Dh1Ba
	KTySQ0SWVFhCPkkNCSbJNIYPC1Zc60jCkIqUNh6WTlmxWH9w0mhoX8kIif89FeOTY74fJ2NTIZf
	pgK3wqfbsLRwoSSgBvNm7z47RnQHYo5Zm2/jAlqZa9XSScqnAnW1945X15Xgv1+Y76MqbE7smvm
	Ms80/e1hjCtUCR+ND8bAvfiMrHrGvkw5yFMJz6lg7YSjjbE6h+qdvV13y0MIvsg3p9I4nEZ/HHL
	L7cH8++lhmpQNpFPFbzo6KCROE7JY1UsYnpCQoVdB+N42SaYI21MtYrvdg5AtCfCm3
X-Received: by 2002:a05:600d:644d:20b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-483a9605b19mr190422745e9.34.1772032304192;
        Wed, 25 Feb 2026 07:11:44 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:43 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:28 +0000
Subject: [PATCH v8 11/18] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-11-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5854;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=GYfoI7T6mjDa/S+MCyCQqGHewuW6qEL6oggAmV3uB3A=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEbLamt0zkr8JsKdFUFQDtvY23asY6qtvvWo
 eFasakgn9GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 OlnPEADB/Xn9zC/o8EPBI0XQn5YKkLAU8MbOge8kp6gL0eKCU30zIU6QosopHz24GjbKNM8r4GU
 /C/Yg/W8teGZeq5wH7EODed0ghBI1eGkq6MWkqNsRtQTEy6eQjwfQZXDC/iOmPJvWsLDS9h+Gxy
 ewAjPiJ8uUK6+ryd5o7XGL8LLQBcKqCdL9EzHhhya7saBLf7n6EpFo6viH7pFtOaNDFX9ohqY97
 KNd7zclLFQzU1m4yaMqNnQLtXMeXLH0A6365kvv2MmYPvCwfPoJm2fczzbTJJASmLsjOnIwv/ID
 HU977idD6c8GgOeqlmPfTpX7PWZwvrto+sbcKnyXPo9ge5C3iQyQ3N2AzFzGGsZ5PNlAkWVO7ax
 lUs9eyMN+eKHnC3Zr2KA0XHFoJ7noO3lcQlIRfAkCYRNDP0+SN+iVXJSH3u2cDPciPoNoHYF3kj
 Pk1V06+7JIwi4JJaKSvrUGABBPuUIZfB/q6+8BnxJPbYQvONCV4CnyJInGIlhNeduQ7VhN5u+JA
 tFwAq7GEQQQQ72Gv9O6RO70WfzYwzIzWTRLHVUvjW3Z/TcGjmdFn7f4/Wg4QicPJ/dgJgxK9j0r
 EILe56qVX6TKUpj9cnoC/jewbleja/riLjsa2OHXyG95snm+mdQXZJP+5MLT2kBCMqKOW2NvBOr
 cn0zbVw1/VUL1Jg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
3 x TPG
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 171 ++++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 9c5ebe1b48ecd..5fac814ce0f6b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -5562,6 +5563,176 @@ cci1_i2c1: i2c-bus@1 {
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
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0x4000>,
+			      <0 0x0ac71000 0 0x4000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
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
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "cphy_rx_clk_src",
+				      "csid",
+				      "csid_csiphy_rx",
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
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
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
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x1860 0x60>,
+				 <&apps_smmu 0x18e0 0x00>,
+				 <&apps_smmu 0x19a0 0x20>;
+
+			phys = <&csiphy0 PHY_TYPE_DPHY>, <&csiphy1 PHY_TYPE_DPHY>,
+			       <&csiphy2 PHY_TYPE_DPHY>, <&csiphy4 PHY_TYPE_DPHY>;
+			phy-names = "csiphy0", "csiphy1",
+				    "csiphy2", "csiphy4";
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
+					camss_csiphy0_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy1_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy2_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy4_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+			};
+		};
+
 		csiphy0: csiphy@ace4000 {
 			compatible = "qcom,x1e80100-csi2-phy";
 			reg = <0 0x0ace4000 0 0x2000>;

-- 
2.52.0

