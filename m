Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308CE2D8786
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238693; cv=none; b=NEjlqGztSdVBTYkvDMw64TFwpwu4UGBB14mL6RYuxtbqOYwZnVAVl5ybccDaa2fcqzUIyZ+W5960srPCuRMHui+I+cO0XR+Mvg589qR3C1/jVtNdWCJhrE9k8/BJoi59LEoL9A/HpS70WzQ4zGDoSwTYAqTMe15yZJkq0mShLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238693; c=relaxed/simple;
	bh=Sk+XLN+fch0oWoINUVwniKgPhQoXp0xYBRIRNEdHrJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsEWP+7tCdC4M+q5ccShqKoRea8FO7VG0Mpp1cr7u1w9WaiHxyYKlpzxcRLkLiYNc6o8Eu+apL0I5M6sarMEJ21XrllDCwAnZi84Moc9ZPwR9hXt3bvmSErsKmRIhPxZtUlQvTuX3heZRKIUJbsC0qSwCmZ/YQayjFbzJfeDQH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5Mr7b+0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5Mr7b+0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-454f428038eso6550975e9.2
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238689; x=1752843489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0TSyovWiYo0zQThET59bsfsSUy3rPkQ2lfj8hcRygA=;
        b=l5Mr7b+0Oji4DJcT0E1aeP4Ki3WOMoLl6dVN4t5s3WQewvqVKEfSvQMaxmdx9ELVo/
         0YwGNGFzFGF1DLhXEjVNeiiLpwFV/Ierg1AKwFNIaghuyH87Gt/WV6wWvRw7hHJCSepg
         xJOcI+1oooPmsJ4tcUthMsz5Sszv+5iCbhweqTJBXOa12Xul7We6awWJFMQNeqhxBYzP
         kLciId5R+lOkEvvThkG3zG6t5Fv9i8wZAQCx8HkgM17rHpU8i8KMcIcgsgLsJmKAxarC
         qQIE77efGgy+WCB7rnl26EUD3Fmo1r1kttT5UJgRllcBNeawpIBpaXY0S6kcJQqzJgDV
         H2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238689; x=1752843489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0TSyovWiYo0zQThET59bsfsSUy3rPkQ2lfj8hcRygA=;
        b=LgJP72VJgMpSXZCibNUIIrj285+gkpZ4NvwiIYNVCJ83XrOvV7j9l0Q3+2m/eVp1j2
         OiD9wqTc/axu9NL4hPtbo7g8iUt1zt5hWVk1TMbeVN/5cr3c3b87Y3icO6Rgt8cKq7IW
         /X8OuUGkHy62iI+GbZDyPtsjyF1jCZr6a0s3AD6+OxVlIn+NtOpxNVhu4q4P1igjEsd6
         +7hzp0ZOzl4XyoJ0Xvj2d6ECuXGHDmIREIATk5uqxKtB2zcI0FFhhr6jxszvQnRWQUN4
         9Yy3jixv7WVKJ/KOJ8fHgwZgXspBVkM7Tc1hl1q9owOAzV11bPObbwDD8qm+uXtV072z
         B1aw==
X-Forwarded-Encrypted: i=1; AJvYcCWxgEQUwuySArs25LppZ7SoSo6rqa4yNaLEwLDo76IW7MGIrunsr/nLnwFZ7BL34KLTa56cisCg9ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGFb27iKo5QdduaAW+dmpZlebEQkqMzrRuBLTADSM2uVIZIPS
	qo1Gy2LleS/Wboh7SnKkzzVRxsUV3cnMTsCQwvZD0MaLBlk4b037pGHc5ISReGto2/E=
X-Gm-Gg: ASbGncurLCfzgYP+iCbgmdzJIAx+nui4ej/6NDEPsWLgLnaJrpag88NID47jIVUuwCm
	btO9b2hC6F+b7+h+GCN4JFW99TWD55skdpQqpvzzwy/TW+GFZUfyXqBC7WI4MWvwe0qpfY3Qwqi
	j4v1lfyJBd/b/QRp09IuycRq5f+adxPRo+uog1VNZY5lOVjCML2lWnfIfwD3Y/MKFRIDmmP1Yyo
	TNbH3OlqIoWo7cAz/Kme5Qo6jv8iN/mOUQXa4lOOK5ov1BmUjTtQnLq2Km0Ll4D0G/7+VoAjHNn
	oH2+ZAEj7Z9dZOAfrppjCeloJMLXOI3RG9H48VxZSuBN301vRP7F20IHnTNgqrptN5eOmdeuYET
	YPchYV+VzfxxnJrHNE5TGNlV0RtGd+SDX5398+6S8cZaDYq7P+2QifbqiVRQ62K43
X-Google-Smtp-Source: AGHT+IFw8QMth7RNEHRPxzNd8Lkx83ng6nvNC1bJ4o3fh7Hh8yer4bOnz+VGr7l+hp1XTzf7ZEiRcQ==
X-Received: by 2002:a05:600c:638e:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-454ec15ee55mr37137235e9.10.1752238689486;
        Fri, 11 Jul 2025 05:58:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:00 +0100
Subject: [PATCH v7 08/15] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-8-0bc5da82f526@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Sk+XLN+fch0oWoINUVwniKgPhQoXp0xYBRIRNEdHrJU=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpTQnI8GFdMlYF+BdvI6MSWYnrPVcz1ZMzNp
 nn8o0Apj3uJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUwAKCRAicTuzoY3I
 OqkyD/9cc5wBQgDeWieg156Wstei4KLNf4HtxNYf4TCZpkSaLTeXIa1o5ph6q+DoXlW8GtjO4fN
 TXzq7am0Ia+TI3rNVY+rJ6fESUFEr9v0SguWhS4rSOYJ7P1RM2OVZ4ylAtmcqloOG2jqIwCWne4
 a3I9lOaWwhHNBO+E+HBB6lvw6HO9dkcFiPTBdX6gcfaMg0Md+tmAHdlQDv3Tl0roJdCrH3IOcws
 ulnVsm2x97Mo2CMI9T4CgVXT/ItpsDssz8wtei+UzjRiCufz+dM2aHYpBdncxfQzc6li4v8f/7J
 wGxtrSVAOCO8AeMLwzP7ytJ1SeXLm8btVLhpT6Z549FkvjCHkDnHCl8P4uKMgmC0wDLFJmkmKbr
 3aIXBJIASWxxqov++QPyvLRLrqKaHIOvejrTXBkqqQ/1guTQ9IA7gQ/rD2W/Qv2DFa7aloGTD+F
 Tbob1qtO6C6dPGDmoSvdfKtUTWmVKGuZ+Oqp/7Kr+OPS9wRHyYKgD002ZzGkouEHJO+ZrjARi29
 HMOzm2WNDImoY375zg4vfQn0vvvCVfgd5bH3twqsb5MUz/wZO5fUSo5DRzm8KV1SjDkVce7cvvc
 Y9uRf9BTvr6NvPgytVHgCTxVAr1yQUn19DgoTYVrGhCdpC+LU+KcgRiPNakH8Tv9JOILVnTCnhX
 SqkB8oXNcutBwcA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add csiphy nodes for

- csiphy0
- csiphy1
- csiphy2
- csiphy4

The irregular naming of the PHYs comes directly from the hardware which for
whatever reason skipped csiphy3.

Separating the nodes from CAMSS as we have done with the sensor I2C bus aka
the CCI interface is justified since the CSIPHYs have their own pinouts and
voltage rails.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 41245e8592f78edf141141f2f5b7c5b841318f46..e385d6f329616360e089ba352be450c9eca6aab6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5244,6 +5244,94 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: csiphy@ace4000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0ace4000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		csiphy1: csiphy@ace6000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0ace6000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		csiphy2: csiphy@ace8000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0ace8000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		csiphy4: csiphy@acec000 {
+			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+			reg = <0 0x0acec000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy",
+				      "csiphy_timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.49.0

