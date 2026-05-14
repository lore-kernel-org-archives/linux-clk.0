Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7E40DFD1;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767766; cv=none; b=YgW4pfbcu3L3oEU7fbzQoGxoM8UmDb4TQB0CZCbpcr2Z0K479L1Wm+0FzdiFeJ67ecOgWWeDdMC8Y70so+PEDErOjtCBxqsqgp9rdDssaKyTB8o5dnYyV6Vg/Ydf203VR5ENm0wA1z3D1EzkHk/UQ+qxKgP5XfLLfED/iYRPALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767766; c=relaxed/simple;
	bh=NhVLviqMkDYbtGDymlF/G9R50yyzlfYfTIw5XBES5Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZbmj+Iqywsi51vjlVHsogU0P7noAYODjbcGgVz9MUSEyWdlzmVezgpsuScNZT9rwGLQwLOv0Zxg/vyvKkv6LULRLGHYAamQtNNxJN0bgRPgr4H6f6Ecv+o99vQBHq+rTTDWFetKU2uwq24T62rOpPl/qrQNBQFCGHGtqKRiKzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmcidO5+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmcidO5+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36A26C2BCFF;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767766;
	bh=NhVLviqMkDYbtGDymlF/G9R50yyzlfYfTIw5XBES5Y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KmcidO5+lwvMx7QAqRl/aIJYqAUNiAKSdnY29fwmepB8g9ouPkKFX3fT7K0SaE2rX
	 Vyj61kr9VfI7qKU5ErzbkLcJLWY4oQAKkfyXF7NKlJPy8ZNLuxRAWYijHoAwXHlrtV
	 rwSxuh39ODd0k5/biOCz4sQ+8Cmir/chlfpKlg1JmMJB7P8YWocVunpYNP87xFCFm6
	 9uPME2V4rzXS5hbJAQC8k5jQUElOmr16iVOvfZircKBpzoAjRfxLC8U1tiRP8+JN/W
	 T8dcmOKNw0QjDAER3PSjjIKI8C8J+tYVHFRpSRv+Pch/UARus63KxUSyl+r2T9dKy3
	 YEwoBUhu1v2Yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24309CD4F25;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:39 +0700
Subject: [PATCH v2 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi
 and Bluetooth
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-10-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
In-Reply-To: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=1040;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=SLa77ZNp7lfbDqaVc3OTTZcPOotiwNceDTW3KD4D7DQ=;
 b=wenOAgoSYUbFmEFqpoDXTncdQcdFpkHhnzibnktdaM3GvNB6AGKz2bc5M63fs3bDrT6o+scuJ
 dTpr8VSPUFTBkiyXBE/OUo1S/YQH4ROqu9QmvQoVMoSG4nFIjVMqhGu
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add Wi-Fi and Bluetooth support for Sony Xperia SP.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
index 591dc837e600..7d54ced3641f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
@@ -95,6 +95,21 @@ MATRIX_KEY(1, 1, KEY_CAMERA)
 	status = "okay";
 };
 
+&riva {
+	vddcx-supply = <&pm8921_s3>;
+	vddmx-supply = <&pm8921_l24>;
+	vddpx-supply = <&pm8921_s4>;
+
+	status = "okay";
+
+	iris {
+		vdddig-supply = <&pm8921_lvs2>;
+		vddpa-supply = <&pm8921_l10>;
+		vddrfa-supply = <&pm8921_s2>;
+		vddxo-supply = <&pm8921_l4>;
+	};
+};
+
 &rpm {
 	regulators {
 		compatible = "qcom,rpm-pm8921-regulators";

-- 
2.34.1


