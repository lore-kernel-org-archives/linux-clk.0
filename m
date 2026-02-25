Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1FC3E8C41
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032306; cv=none; b=OAA+nqJ3qZcEtm51qpqzE371mAavto8zaCdbXuf8omNiWLyPDhf+HiTrRFxkmUSMzLUF3cMtt5u1snaCLRKAgho6JLsPxy7BkBV7HxYiYcyojvIV0rStzvnaPHvzJyqb7uCN36WQ9QKGXtMLYmuqwj3djXdTiSZgvpnBwVQpv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032306; c=relaxed/simple;
	bh=JroXwqsdd03273iY3I0FAgKY/sEgdngvDFJfFyhLp1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eg3fZuaASt2sMBhntWFV45axYEEHmzdhFINRYFFO7LHDttDk/54XvcY7ggzaB+000nWepNdr6OM9PFR5uGltxt0qIitHzgBj9ujWvMCo7O/10n17jc3ocSD2TH1HmbAIYjNrgBOuFx4OZsp0P/JEwhvp9ejDktbH66eAoFzE/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MnWlSRGo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnWlSRGo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837907f535so61920505e9.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032302; x=1772637102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foH4txHEALAU3mMg443JiOclx0ShfjeOi2oTBlBmPCs=;
        b=MnWlSRGoh94TlBYuSlLuyn8a+lZbi09ANJLzeHkeAXT+jeL4ctQKKQOSAU/Z/U36/w
         aEeRJYw6yp93F+VjzyhhEpSJGGTeDBNTQrqPMbn0AHtjIcQHep1ubUQCqS47X9rEFon4
         55/3p0arqsP5rcO+gezXs+ws8D8wonx6lGaFWS/OYQBuGpfRgB5FLAnVVRf1MZQi9Q4x
         5YHAYG68frqD9bTVRLuycPd0JJ/O+XS63mYRGaSBSc+dWm/MfHLFnD0vxAxcCb7bS6D/
         Lli+B8M/aVKbI/j9Sb63dVA+AJ1MaEA6KlPI5LpdyfhA76toIkSPRdTtGARa1tfo84ky
         SENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032302; x=1772637102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=foH4txHEALAU3mMg443JiOclx0ShfjeOi2oTBlBmPCs=;
        b=PeIDE0QF4iPYoMuQDbwppG/YxavWWG925Ex07hPG9zmywzwGv53pfpPBroyUUNgRSN
         qBokS0p+o4+kd0RSAWJ6nLjgtuFVTvqWb9D2GPsVcvs2Fc0BdC11GERUcpD4r/zTJYpJ
         5GoF0WjL7R0lXNycsMAMTL84sb9RKHCO5t2pT2ZtOTNl3BkDCiXUYieah7gvaG8tdH0u
         tLJ0EWlUBiG/oZKKxNn+TfkUGIGJBEGdsc1lVcLIqcC1COKicRI8dj3UMBHoOJI29ywF
         I6QllThDGkxhB4nVKwTjouOxUjj1sYmmdbrNRBqpBcVZgBeZygjyk4Omtihk9POkesD+
         wASg==
X-Forwarded-Encrypted: i=1; AJvYcCUY+BIG2YLL88CZTm3GaAsUj/N0GC+EorY62PHs8wcXfSi46rmvqLsBbxGdmxSwdh37uzEt6uLNIMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwPUQ3ngO5Kgf7EBzroVgnNJb4hfEWPmFZhdxL1Ror0ZNnFA1I
	/+GdWLK2yUwajB9bmLCtUAkZqAc2H42KUT0wjIwJ4kCwoqJD5ozNlnC3mhBdodINY6Q=
X-Gm-Gg: ATEYQzzCWSR8kYpO3yMHsKypTXOg0W/optl9CemBc5O5OqxCmWKaB1CLnkPu6VoXBxO
	t+hRQU71neiJob4PVmYEOZEgAoOwgbX/OaWy8SOdJAfqd8p9qput1ZccGntAkUk/DCndCYvxHqg
	czgpSnVzTQP3C4IjlI/W+C0MBuL0ytLZIYFZQBVhvVDTJdvSUGYUc26Y32T4Wku9XNeCahTcH81
	iosT+uNOKza/zdm0dFjwn4ctUHEhx6poa3TvM85HrV0ea+xEJF4MJOEBSzfJa0rP9nQpfxczsPB
	MWsWcV35sP8oo9Jj5jbXdTd8wIU03IKDTzJ0jQurbmmlWbPZoNnMy6b1LVUaYUTk/tnpZFHMa9v
	bhV8hjYVsnts64hNV4wHEdnZFyNZNPpYUYhSCKWgo6D3sxk8WguNBaVh9ee+IssBa6PRnnWFf9p
	2F2smdUHkU6+6UXhsdAVvdaMNK94AkxmgTnm3IgmNq/O3eBzpyEEbQaEEf+leU8kUuOThKK28Xr
	8A=
X-Received: by 2002:a05:600c:5253:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-483c21691e0mr11420395e9.6.1772032302484;
        Wed, 25 Feb 2026 07:11:42 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:41 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:27 +0000
Subject: [PATCH v8 10/18] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3982;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=JroXwqsdd03273iY3I0FAgKY/sEgdngvDFJfFyhLp1g=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEbPEwyxMvvCsMnuCGcpN7mYct85R012PVie
 SuYMEcjqrmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 OtLkEACm2VPBCXpq58fhwYV5aLMEaDvts5TS88xFELE/QC5Hdb973kDPeJg8evMFxBJRYsRCv/h
 lFQRCvAIaNHV+oD0rlXSLwLeYp0AZxQqCPd00uF6e251gM8qVNTrsn9l7olXFG3RJhs4uw2oAx9
 aq/lK35GJp9rjvvTSojh1c/be3/B+kqgEP3RyETrofGMOCorX4GjlPwdwEfsCCupz8YOUglW+Iw
 on6reCys0UujGKoMufx0xlH2x/NtcikStQg2lSskwerDtk0OrnpgctCLZ5M6LI5cXOQMyOUH/7d
 is4tjf66OjZkPC3tA5qDnTI7Bk5DTOQiZCAtS7RhDYZjIgujcz6U7CEKu7lVKhtdHSxC53KgoVz
 hB0Fne+63teFuSK0PO08c6NSjM3vORikhMQP8rDzA60w/zZDNIhQI8staFliW9UNJU75XhW6dLn
 e3aaB+fio9wpCDbcGGSBJ/KZkjUY75I9Ukvlk4SrRNYXcK+RFnv4M0vZGijMZOKef4iy548WGEH
 Skv4KfTMjqziWY+mptv4FV3KXiE4IfirnE2E+sv8FtiCzK9ZTMNitsPtb1LNL/aAfSg7cuzmurW
 GrscyOK42scuQBEHsBLdrHwacMG/4C1int0eVccvuoozrKOIfrjyhdzdO7vxF7TX78W817apFpJ
 Cf8tcC5/HRaS5xA==
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
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 115 ++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 38f9da6ad9ca5..9c5ebe1b48ecd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -707,6 +707,25 @@ smem_mem: smem@ffe00000 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	qup_opp_table_100mhz: opp-table-qup100mhz {
 		compatible = "operating-points-v2";
 
@@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: csiphy@ace4000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace4000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy1: csiphy@ace6000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace6000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy2: csiphy@ace8000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace8000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy4: csiphy@acec000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0acec000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.52.0

