Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77795401496;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767765; cv=none; b=e06wEOoQksy+qdJ+hAkVBvt4/VmZ163VHa1AbZ1sYGi9CU/WTOTeDxIBykjyxlOT0VZfdWq2inxKwT8SFqygLbSlReZRmSiQRXw5z8V+WQBV+2/TCVe/tWQGWwJvBMZ1WW64gh18MlIkaxnDhNx4o3ZSLLRptXK5/yWYV/vcFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767765; c=relaxed/simple;
	bh=H32RyrAYNn704sv/OiSnG1f5cuj33BcGs+Pg7BxLgMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJ2YD6h3msY+Q3tZ/UifO/cbV4yvdaBmjrkuYpPBQdP7AMjFYOAenKBNp0Bvu/KGoOUoXHh3i0yWi2cmmI/tJv3G3JsSQZSTtEgXc5clYzTchptXhABRyAnKymxXrRN9sKFQF2pxNmHsRRFnUa0W8J9ygduj4I/5xItzmsXSoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG/cnk/p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG/cnk/p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54A95C2BCF5;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767765;
	bh=H32RyrAYNn704sv/OiSnG1f5cuj33BcGs+Pg7BxLgMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oG/cnk/pReMb8ZuVHNxmkWEtHGApT7HilOSphqBUDXZsZ4EpiefQVR/9GJS/UJmAr
	 //mVbs6UrN0VUmy079m7RSqt/c7/RB0+mxygld/O+BJ4kosz3xeN6mXsD4SNquphrK
	 SlAK/GGmb7qCHSA1itwR4eFGDI2bZ01OuM/yJmtjzM1wubV4cqhoO//QFerEKxSK49
	 8piLQ5+doQWgVBDoV8+36Bu95VmAnI/zYaIYNYQuUCAW+/X8ukmzPhbFx4k0wRu85r
	 KS5WcDgg6NlRJPzsEzEuwait/Y9XxETKjNA5lWvefBegRcNkPV0lFztq6LO9ZxMaih
	 jaYiKVc6I8eEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF3ECD4F3D;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:34 +0700
Subject: [PATCH v2 05/10] ARM: dts: qcom: msm8960: add RPM clock controller
 and fix USB clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-5-7cbae45dab5e@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=2427;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=OqzAg6ZwPwD/+WIxsduY++izYopFU+h8fuvvy+0YmiA=;
 b=2yFb6ilolHs2wJZqiUAws2yOSo6RlkJbWrKycebt2Ak8riqqMqmBHv3en7H9Kf12XJzRQqGwz
 oTu3UJg3TEGCs469AiMGxPd3fWzH55ZqWbTEjH3MDXfnNjZelJCGIKR
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

The RPM clock controller manages clocks shared between the application
processor and the RPM firmware, including fabric and bus clocks required
by several peripherals.

With the RPM clock controller now available in the device tree, the USB
controller must explicitly declare its dependency on
RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
would consider it unused and disable it, breaking USB functionality.

This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
clock. The XCVR clock is in fact used for PHY/reset handling rather than
as the main core clock.

A similar issue has been observed on APQ8064, where missing the RPM
fabric clock dependency leads to broken USB.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fd28401cebb5..0601680cd8dd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,lcc-msm8960.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
 
@@ -98,6 +99,17 @@ rpm: rpm@108000 {
 			interrupt-names = "ack",
 					  "err",
 					  "wakeup";
+
+			rpmcc: clock-controller {
+				compatible = "qcom,rpmcc-msm8960",
+					     "qcom,rpmcc-apq8064",
+					     "qcom,rpmcc";
+				#clock-cells = <1>;
+				clocks = <&pxo_board>,
+					 <&cxo_board>;
+				clock-names = "pxo",
+					      "cxo";
+			};
 		};
 
 		ssbi: ssbi@500000 {
@@ -507,8 +519,12 @@ usb1: usb@12500000 {
 			reg = <0x12500000 0x200>,
 			      <0x12500200 0x200>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS1_H_CLK>,
+				 <&gcc USB_HS1_XCVR_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "fs";
 			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS1_RESET>;

-- 
2.34.1


