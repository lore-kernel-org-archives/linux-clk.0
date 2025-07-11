Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982E52E7F10
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238702; cv=none; b=RYY5PHnY+fQ7sIrzaHturZbHS7sHBJX/GR7kpvCSdOv0oXgmHPcFOEcSifnfSHV0fQXbQzqT3VeqEK9JtLVr2cpa07mxQj7I0kdpQAuqEesyJogRnHQ/UAu/qyGL0QtgDwGqrrSSnMWvO+QoG+9RznvT5sT2wdFpLtkPMtia1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238702; c=relaxed/simple;
	bh=C9vyDaOV5NYtX9bb7spylzRsGwk5yos/Ys1krrlhY08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUY+cEVqdTa97rEVYAZgxH+HNdKUzrjn2B3auqrp1ieScHGhGxVO8Q1Np6GxPCWO+xjR+UgBmLHUVL4vJitNkS7N2grJ6RvXLUzI4L0IpycmI81Mj6RlZzlHWIhcu2kEjgJNdnTftCNJmBP0ddgCXy2rH5BWgrCRYeaFtBcHSZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yj49IzKm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yj49IzKm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453643020bdso15837285e9.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238698; x=1752843498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTGaqV+0h7/0datJWGHGz6KZlpOcm5tykg8eDuHMHVU=;
        b=yj49IzKm96L3r0La/+GpZlVbrstv1OPw0L+AQ4ud/QbMwMeuuLvVV9DWPwttXv5TMn
         9Q771+sm4ttzjlZ5PQZPIKKeu++pydUJphB8Y9G/uJ8a2qtar0lZOdwxwZScPSlxjzGg
         ZCjYTzad57kIa1XSpKO8XhcyytMZy0C2yvx+7Gca/wpahv2OoxW1tmIXmqgj2ljCXQlD
         OMKhiXj9jt6rxnSJfySifeEjF7g2H/6nZcwDqc7rciY5yRr1PGV8VBQH++TfcIU8LH/7
         +2eZzu/MOzXFoiFsUdNDl+CI9JLDFC1x0oV0hqRnJvlh2aAISpP48+Fb8bCFg4BmYRmK
         TVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238698; x=1752843498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTGaqV+0h7/0datJWGHGz6KZlpOcm5tykg8eDuHMHVU=;
        b=eWb70DsBjqAh1lhaOulXypdmHt5TqySJyMmqXbf138pVJD917s7NoL2R+4yrhkh0Av
         5LGEZPBa1bJqKJka6Lx0FTnFOnyHo1tqx3Dh8LDwW3TkUFFqxeNonWc4WlOx0Vmo2diU
         urJju91clD/bNAEX4DMoh6Oxnq7rPepaSfmvCqv5+oub4kfNBUACY2Q3JE7+TxT6ZUic
         On40yekr9ROHDVKTeDWkPpsNsmCWioILpHbYsPRCogrQisAbfCv/t/IqNtNGVtJOX5py
         TiWYrnWGoZG42uY19ufLEG7AUvV9rQcyhFkRswziz8qmyckTYMopPKkTnpQ3meL4lcfj
         plgA==
X-Forwarded-Encrypted: i=1; AJvYcCUj7K3t1NFwU8cqDE5LzBQyIP2jGUJjJGr/xYoiMIvISZ+8IajSmMG5hVsW0lB95bERprNx9r7Ea64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRvvnmD2sCjOdonAwhjUK/spRtZtM1ekvlcAufL62onFgeHw6Z
	tlMx+ZbOsv04cqBOZnDnp//frKvcqzyTUhgHKYUFE+CVSre/U4QrBEUE2lRk74duNdc=
X-Gm-Gg: ASbGncsXWzIT4P2Z76bUomvd9aDzKENYfP3qXqCFRqwnmpYUEVS41DErsfDXYCl6QmV
	LHmbIQw7AcMYkxSk700N56QcHQ9JEjMU3md5F1vrTp8J7MVwPxyckXOKeGMdEs4cxHF1H8VrQwI
	e3tDrGe05hDGkJ85jhVp6+BFGdGpR8oLXOJB2h32zqDuva+M1eq/1bP+ih0qkcI3KiYqWJiOr/G
	0gvxhzlmU6ddL6Y3eq0/NMg3vN8MAaiWIzfldMWi/pHJGXnc7LG2BJAgWRJn4BttBkXjZLXdw5A
	uMSopCAvCILrXpAEfq6l0R0A/zINmhaetVvif9DuyP/6KagFFH4c+kD+Cv8BqcPPY8tSHEo46nv
	hjiMlyrMOSzcvWGbVuPcNi15fCw/9LqZaqL9TZ7Mt0+LqXugTls2LXh1ZQltylteuKguw5sJ8BT
	4=
X-Google-Smtp-Source: AGHT+IFCHpUoX/HdEVnfz+XU4F2soi1Yd/YGDDcREga/YCT29fq7TqkoWGu6imjg+HeOFqsPi2ntqg==
X-Received: by 2002:a05:600c:8b21:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-454f427c7a3mr30607115e9.8.1752238697970;
        Fri, 11 Jul 2025 05:58:17 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:07 +0100
Subject: [PATCH v7 15/15] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add OV02E10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-15-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=C9vyDaOV5NYtX9bb7spylzRsGwk5yos/Ys1krrlhY08=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpVKby93aooqqFZgIAkI0Zq70RwsUYqkwnKK
 PIEumEYlkWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKVQAKCRAicTuzoY3I
 OrxdD/9Gz98ieKZie8uzpC8roldjOvnRq+YZAN93WXuyq94RLFPCwJdIAXaqeakdB0XMwz+/LIg
 CEKMWnQyqGxJ1YQebwrxouOIsXRAx26CajH3I9TJo81Z2Wv9+4vAvQGHHoPdEyX7t83Z6qrzGBL
 OUSaOf8aef02eJTe/Z4JPPnHIo7FNlHDL2cSs2WBbmy83xIeuFedW0pcmfYi0oXLSsDn/uOzYPe
 6hX7v9lBeDcC9+a8yj2FwR1ns3ruoodWRB80qmXiZLnW+L+VW7/PCS/0XKg2Ljve1hO+YVoEACS
 svInO4NJ9uSfCra3yjXqh7Lng6pA4c1IBXUQlMqVuFZlr0o/K/dcOKiFPtsossJr4paWs0i/rGO
 c4S79Q/ymFOfJ7G5keTi9qliA4pRIH246WhGolriO6MhDVdShGfDpmgDGCyyvYuf3N5Kgz1UGAN
 tPFLU8cYmnIIxniInb3n/iVQT9mEeO2MxOwfREP92cmDRgenjcNZJb+MbnwHMbEi9BH/LYTxFrC
 RG2ZQrQ5KpqpqaxGoFvVpoRy3UmDG692A0azeyO2o2aWjgXz91C/DcxqwWnrij4o7wLcWfb80r+
 kXoRPnfryzCyQjScFQML1+MyZOZnHxvaTsEPwFqto2ozPSg8pN+CNv5iN+MdfUfgKLlzfAJsOb9
 p3yqqWnGvMxdqTw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index ce2625f8fe85287a16fc3c85cae5d58f99cc6fc2..6176e7e7299b471e2535a43b302d3e4871396462 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -754,6 +755,68 @@ zap-shader {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			csiphy4_ep: endpoint@4 {
+				reg = <4>;
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+	phy-type = <PHY_TYPE_DPHY>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1290,6 +1353,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.49.0

