Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91A1FFC53
	for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958057; cv=none; b=q75JdTVQwymTdYgcIZ8RBc1VFMjsuV1NRF7z7yd2m/Y4u8nt/fNDsoKSuc5GdxAP3dKkA9V5zqMl+hi2atq0vyjKxaghSDucXPUWzBATQG2v043JO0tkUVE5sQDYQbBsPy7AdBj1KhJbL3xiJZ5SMxvxKIExy+Y2cv8WbD9bqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958057; c=relaxed/simple;
	bh=a3wrzpVCaYNuMwQuNJHx7mKyoFe02+zkw63lLomddaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BxLF9QGUms90xCz7dG6OkulJlvLH5AtYp67Ybs1k+Nw68jcy7ZzyhlR0BF424wWztYn/B0XiU70FAZe8pyw2O4V9lQanw6ZRek2L6J/A0d/HmwwTZ5iWpISj0ba/Z64kgDhpqxh04OisfUJVg9rDhwVtvOhCzEvSWJ1hDzC/4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY5hNM4z; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY5hNM4z"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbd96bef64so357279766b.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741958054; x=1742562854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZMmcHfeB4rBHuWqkNhUsUagbSg6bNeQKDj5E5I8kNM=;
        b=fY5hNM4zt9X6a0s0O5KbSQLRAgoXNKlQ7s8EXbPS7ilzOFQngCFYTfQJNdFxa/90c3
         dKFlCXvcpAauqriQNaI/twwOS23u4ms3tULd5GDIPWR0b1s98bEFpK4Jjw2R2bwWmS+M
         oMAqDudUG/UPhm9JeGcOlrexbpYru9u7AszuimdEAV8ZPyWtIVhc9w6ljvBunf5SVDMs
         Pg2AxvZT25jewVOwF4glhmVkgc/uoj+mNGUCDcMWp5bKmnWG+uuQK+xZ1wYG4v0aCMgU
         uN092a0SIrlemMGfEmD5k7YYdX9jKXQu0J55rytUSB06h5N+uh1CYjHcBLNDWeZ+4Xxx
         cuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958054; x=1742562854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZMmcHfeB4rBHuWqkNhUsUagbSg6bNeQKDj5E5I8kNM=;
        b=CIxpafAqyygxSqVTIDs8q8mEyUss3JsA5cMyzAu7A/q/DMD6l8gwYChMtZURy1f8GC
         11TI38vD+tF/c37nn/7Ps9TSBOzSHiGOdipjZ7FeRz82e/moIU829aHgcd1lyQeHqLGw
         C/ynwdybDuiM8nGm51Vj32frPqRAPj9p3by4ULcOQIig/SAxCHu5RYsVu6BlNcs1UEHf
         IIjiHJ3F62RWZF7L0c2nKHx3hjJxFI6DC4ERvimlAgJbiPtvv/IwIUlRIHfJHuviqGLp
         4bQJ9j53rqOLDgJ0o0e8lz82PsnrMHkjXiJZQqOkyKy2lPsXXKmzLBZoLmSKuvCTgM63
         6jHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWogqaz/vI50C3a40APdjyDDf1okbOgomuQ0M7Z7mHDeO+hB9Ok8faDrj7bkL9uDyCtIjjZ02Z8364=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3tywGeGGvT6Um0anmtS98wwEZLsak46NgCJ7zHPvOrVKijTH
	8Q+qCumtXbsrPnIcQkoybB2/42TpV4emGR3TKQ2mH/30nTQuMKJqYGUviprUVhU=
X-Gm-Gg: ASbGncvd0yEr93HRXPixE5DSr/HpasJVRUURRT66KOgCaBbp9WXImtgh+bvzmkdziQj
	aeLVNJ7F1yf0egv8GOpG0ODAUp/g6mzZsT+ugSO7JYHAx7ck3SO1QHGx9dnvovQ99yvpbCG/d3K
	hOKJRrKUO9k5ksTj7wI93WfDjYwLjdEgev3xeh4jpuqUByj5nc2k+BwGaLwO/FBj0xtvDrEzENO
	JftyDgpXJw3a/lHbTgMuldVEPRwodJ+3As9cC+zx5SzoyzapigF4QjuiVXXB0hd30GnmIDQi7lo
	wENSrkaVWVGbXj+lr0yCSOVbokKmtddWpMbODJsrOY0ylDM/s01vM4WhatMz0Pgi5t5IIxE/eGb
	KQxWclNEns6GRQ+YpwCcrncVp1drlxtKsExbd7faN86LOupettiowO9nTzTErVMw9GLcD
X-Google-Smtp-Source: AGHT+IHM/2Y575LeRf35z5pqXiuMnYAr5nddY2/FkROok6rDEl4Tb2gOnvYWC7W2WHLeZnU4sOw0FQ==
X-Received: by 2002:a17:907:6ea9:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac330181a8amr272744166b.14.1741958053896;
        Fri, 14 Mar 2025 06:14:13 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm226008566b.137.2025.03.14.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 06:14:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 13:14:02 +0000
Subject: [PATCH v6 4/5] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-4-edcb2cfc3122@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Add in two CCI busses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 065a219e69c632eca288c9ade001949e37b92173..4ae0f67a634a982143df7aa933ec4de697f357a5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5117,6 +5117,84 @@ usb_1_ss1_dwc3_ss: endpoint {
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
@@ -5741,6 +5819,78 @@ tlmm: pinctrl@f100000 {
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
2.48.1

