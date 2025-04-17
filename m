Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897B23E220
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889231; cv=none; b=e50H/qtDY337sgZu3wOIk6VbKVdx6YTjgs+U++ngbhmOsx/JhDYgelcehAYV0/NZu0ArAHo+7QzAwVMhlfMdxVJoGwW0oCNAvQkFbjf597cHW1ev1Cu5w/06CNwjeuRkh8ARFeLzS7lMqc5qkIHJYQkDS/JgwCiOvyiv9aatklI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889231; c=relaxed/simple;
	bh=yHkoD2LLNVtOlp4+3CahP5h/AR17CZ0yLXBiSRySPsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UECsSiABDGxW1PwfgV/bL2RtyRrgW0S0b458mzfDTOSxDbfQ5tVLHgplUUJy2rZBD4q+1eiPynn+g6VKE71IH/Mt5nZMgWQiNzYT+a2z7X8wrsyULvxadIn4tNO1aT+O7jOq1ejG7fTbCzagRH7nJeaZhjvAQ38RxZMF17L4b38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cND32fRM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cND32fRM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ede096d73so4393945e9.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889228; x=1745494028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+yrwEk3Nrka0pmkGJr3BxDshhuy89tcK7yEvs60tYQ=;
        b=cND32fRMxkVUt5dt7qt0NJWyFb90BKfkKoTirRj1EsLJJSnyclk/oaUcXVVoXTVkXu
         o+DANo4P16jrnkpQ+b4j3Q3Zg4qEtlpjoaiucHo8dxyjlSO5kBy16l4kgwrB8qsdRMM1
         OWRzH+KTGIkQoVTZcuuU2MzSf6gIH6Hgr05I8TfhEsyOiO8MdftZeINFzkYBPafQA647
         a3JJzNYhtLKDRBq6REuV134tyy5caSSfS80uISetF2jPW0/97X+vKUPuEidK/Q70P901
         +JpxesLUCjWHQcLkazeOGlwQGj+GLI9bAWGfIbSjYxK0DMMV43MNFeUKOXM92KrG8X+H
         0o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889228; x=1745494028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+yrwEk3Nrka0pmkGJr3BxDshhuy89tcK7yEvs60tYQ=;
        b=p0G+pq3FExiAtnoMtsnZ27Tp4zupll5sMrQmRCda3uweekB+OxPdZ78Jb1BOqEvdpG
         HCkHL7jBJioCiv1oJ4upTrouxc/ieSi5Alzljdl0waDh4wxcOx5dZ8JiAxsjj249TIW2
         m1XhZND3UZsVdHIm3eh7j5vqO0upG6MWlwdcbLrbvaVbwIPxSKb3F1Oxa74xyQVN1L8g
         vBCEEW7ORT8RXdqCf5t4QCWC0aJIbGLCKTOlooSlp9o3fcusj0yFL2ZHFvVdw05kiPiI
         hB7sGYCNtomRBh2yvGDCrYbE7r2L739jr7yXc2KQVScEYyeHsRX7fWdd9LbOKBTsLw6r
         Y9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHnmxV0zzqz+4T8tTCyl0wSP0SaebaBvcFysan+L6Rfnmad5GLmNIHwWYHPmUbIfkNboKRh8ZeKMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxRlZFP0sH4DF4y8Sq3Zd7kc9UuKHveB8ADAG3vJ1yV4yhHHQ
	LeW7AqciIt8DJVpP8s+RVGuO4kxBOF7nejTwDCtgmPjsubjCrlH9XUCHv1rqLYk=
X-Gm-Gg: ASbGncv1rWqBmxNvY3HjTUqUTEWzpHPltCbfoWxcEoo2CioedkJlX0nuIDmFb8+gFqn
	kvAWzZLBh3A5AUpn0fnoGdsdeAWTo8zSHArrMw7j8aeYV+6sxq/tatXBTH1tCpVMhPg2aelOLIT
	uNSiS752Fs8G8r3Tq8d6vnAqIIFjIgCG9pNotBjK8oeBzA3+wkPUKjbcgpZz7E2L2Xtn4th9WSi
	12iZDbinB+d9H0gxOg11n9aXnCKiBmaepTTX8yDlGhoE2WCETaK3csedUDnjsKD8Gu0Ups7FXeX
	ozqBtLyVzpqekkrLAI2AUWppDDqQAW654mUQ3yg88MlzJTLWPFSUb9bjscBjnUhDKY5cSGuAgNN
	9/1cZ0A==
X-Google-Smtp-Source: AGHT+IHUQ5BLdAA2VHGA+nSpSqiLYvZyhqSsq+Y/9zmdY8Lr9fjXisyMa0PSuafwlHLT6YWAdJn6Ug==
X-Received: by 2002:a05:6000:40da:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-39ee5b993a4mr5186891f8f.39.1744889227797;
        Thu, 17 Apr 2025 04:27:07 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:03 +0100
Subject: [PATCH v7 2/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
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
index 17e044dbb3b6de278d446eaf448561333e407843..3ef3ebde4b2476c1da1fe11383718fba5ff87f85 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5117,6 +5117,84 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
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
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
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
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
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
2.49.0

