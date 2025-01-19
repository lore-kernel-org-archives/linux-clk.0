Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E73CF58
	for <linux-clk@vger.kernel.org>; Sun, 19 Jan 2025 00:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737248109; cv=none; b=TNPMjYK1LlE5Jw04xAGfiAlALvcatAFKu9GpCEtlqCgAtu2ZA3Vk4cCHGSKl5XOIcCWC1zXNV8m8XNvUvULTeb0JdtpjE9Tlm+t8fEAQj5OjFAQhThaAHncJsb5W+6XDnNnEQ3JZXkonEUucGg8SbxG54NfkNlk+ZNUqnHJPE68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737248109; c=relaxed/simple;
	bh=Jt7iU9R/14awdjNK9JMo4MwrlaoC+0oxLw4O0ywlGWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhCDGSZ1Ch6V+asLZbY2v8PVole2KIOiesyHFMbaQXoteE9//Y3WeUW7mCfDXIpgPo41jlENpnhuVkdQ46fr7h96CyPjLYVOBcTO3Ud3hMHPuaW8ZzNclMcUO3oXD4X9Vd32fzWL7IXftpP3YtV727LjwVJezDQCGwQVDTWIM3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiVzVkpe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiVzVkpe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so5248345e9.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 16:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737248105; x=1737852905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw/Wz7StcVhxVlxFDNy4PKSt/7FBnuzUywBL8DaaXQQ=;
        b=ZiVzVkpem6R72yPGgXwI8I2He3X2Joi7+xApSgpR63F20ppIP+8fo4oxJtzcUSIrWh
         txleYPl0g1cqI7VOAJfm1H7W9LpXrRocL5+taAlfTLFR1NO34iuIJooi7pHClzae3edf
         9jFq2c/gd3wWqmWaAW33PRGicDRaLXxwCDEZq1qm6NgU49FRZiyeDjS4gPc2hGe/iDOL
         eQwKgvcPHK8l0ljgUWErYkR3FkMiTDTaAs/FgQfxtFaDG69HkNFMGPLM26r6/rhkKj20
         trv/rDRaVkQtBMTDq/xZs6YU+uyTHLfDHzEivaMmT9JP6pLGB27/PF50Rs4Vm5BRzpTd
         1H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737248105; x=1737852905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw/Wz7StcVhxVlxFDNy4PKSt/7FBnuzUywBL8DaaXQQ=;
        b=UL6sGbicYtUC88Pu8tg6UnOY4BS3d08tnHb0pe4zmzDZzP1tuxxCtChP/RLnaL6g2W
         gLmu6VEV52PDXuc/y9d2+s/mIgET3Si8Mz3B4ssjdHuRtyqZusjhQR+4i3hvRdo4oiRn
         OIGLk/4YhXlhBfV4BzrAh+LinFV1jxNZ01/vUBrQIx3Ljdf3lhLprampyl8yX6SaTIV0
         RDO6okNmWfTbV8iArC0PQXuod8PwPH4dSbi8qfG7SCSqQ/vq8k+xijZEukQWqGHFVcvh
         0Nh5VQXnChkIybXu9D26wJ2DI6amv0r30Q/EtJDejmEo0okD33Jb+/9mCRRDOk8x+XJ7
         vx4A==
X-Forwarded-Encrypted: i=1; AJvYcCUJkJM/96WoOyOumxJQotGxXHUBZ3QFxCSOPOKPlws9L2Vcunq2gidrGXNwXc+9gY1Q4dvR1dSNlpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRP/5rOHRQEMMyr+NZR74pCBp2GdfPFwRhcgcXTTjrsdIIm40G
	Hy5w6GQVyitpGT8ZWGUJ8SoVQCF5gg5DG7igvwLl3YLivkjdJ7gfzkHPHvwnbsE=
X-Gm-Gg: ASbGncsdXZhsjkffKwFK3NNhpHvEFar6RCLkJ3xrnWPBViK0N8qY1SgsCLlkjLFu5dZ
	plIZDz6J9Htbdl/1IH52ZqwuDwzCNHEHpPeQCoH5VVeXMcR2HXt0T3wxgEi28AJy6sRO/k2pLFW
	Q0VQ57V/qB+vnl6trfb0wgRYRG8N23QkaD7/wUSB1t8VGRyyt1rxiN42xl747ImebVmSiCOHH9h
	uiVRgf5Y1FZa7B30/I9wncZH0/ZBHvU0PkOA3f8nd8xlPzkzu6v3fzQLzUDvpQMPfZguulz0rrm
	9co=
X-Google-Smtp-Source: AGHT+IHKmONsm3SlRRcGVXVT9gNit/w6OCBM8BV9iVHiDtkCuyzo8seH5y3X+tYi5hTFHFQLR/zFmQ==
X-Received: by 2002:a05:6000:1947:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38bf58e8b7fmr6208274f8f.44.1737248105098;
        Sat, 18 Jan 2025 16:55:05 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa40sm6339241f8f.45.2025.01.18.16.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 16:55:04 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 19 Jan 2025 00:54:55 +0000
Subject: [PATCH v4 3/4] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-3-c2964504131c@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-33ea6

Add in two CCI busses.

One bus has two CCI bus master pinouts:
cci_i2c_scl0 = gpio102
cci_i2c_sda0 = gpio101
cci_i2c_scl1 = gpio104
cci_i2c_sda1 = gpio103

The second bus has two CCI bus master pinouts:
cci_i2c_scl2 = gpio106
cci_i2c_sda2 = gpio105
aon_cci_i2c_scl3 = gpio236
aon_cci_i2c_sda3 = gpio235

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 10035bcfa89bb..de05916e6f295 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5110,6 +5110,84 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -5733,6 +5811,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.47.1

