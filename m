Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4603655C5;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304029; cv=none; b=kke0EK4/vxYHnqwaRbtrJTNsN4Krjz2CvIzly3QRTGDWMe3Q6iJ8PHnVyPZJWuAmxCBKyZ5ohm4oERyNGcmusegiX6bn39clF0Ldsb1ZFG6d8/ArkGbFi6YHdUcL/0IhJvFmV60FWx+qfCP2rVNaxNATSbYvDw44h6Pn5eGs3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304029; c=relaxed/simple;
	bh=S1t1aDimE+JWzf1oT3Kpg6rqZBPx37NB1FjdHUaCOE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=InOpReMfVLoraKdJdGgKR+8mMk9arx08/BQabC8mSl6pTXA60UUyk9LfArfqMnTHSMJgOyXJNTmh3Ec3HdaEK7IJzqZwHEKc2SEVSAE/C5boYFmW9531P5pUsByeNOUQw1W1hAV69EdXvp0NIK/AjD0dw+jKqsGpdMk/Jhi+qlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELJTkuX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELJTkuX5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6633AC32782;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780304029;
	bh=S1t1aDimE+JWzf1oT3Kpg6rqZBPx37NB1FjdHUaCOE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ELJTkuX5ju1Gf7jRyAir+KOq7k5ULbKFrmTJgwmBvq+w3iA2rDAYMVTgrZ6xLAucc
	 Q1bkGYct5cZoAekxUeGRetfSQzpJYHEqaVQ3NdVocpq3+AC3LSouP7FIHmhSulQpO/
	 AhiyURLr6vuCLhE7gQcHjGx/AJ4IrCD0xcBwZUIzHbAaBQGxbV70AoFZ87lpCgL3Iy
	 AzHxypGNXtRseb3+P5R7i3nz3/oFsi4BWQomLQ8s0632RpcYaFnJ6pSapBZVRfYlPU
	 xheRr4CNmFUUgb0EJU1CNZTl4VlQ2S8bjjMsuRCp6T1/pE01PokepAo15CT7b2tnN3
	 ES2zYa9lKmU4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF2ECD6E56;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 01 Jun 2026 15:51:18 +0700
Subject: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock controller
 and fix USB clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
In-Reply-To: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780304027; l=2427;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=3t3zXcDC8mnNGWLFZsUXWHKDdsAWbw8nUD9i4nAnJTE=;
 b=qCu2d/2kg/aD8sddu/mpZCNzBEX+mdkQI89MmO6u5nJJVtN8u8MvA3ORKeTH4ckBWN0NEDdei
 3aCmKh9ZJuIDboMDrmvaDp/mW0NlzQScPyrsn/fve8HnEnwXCJklUxR
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
index fd28401cebb5..1ae399c5a81f 100644
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
+			clocks = <&gcc USB_HS1_H_CLK>,
+				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS1_XCVR_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "fs";
 			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS1_RESET>;

-- 
2.34.1


