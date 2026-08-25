Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C003A4F50;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635098; cv=none; b=X207gAJ58Z5HY9xTwTAPcsk2ttiQe4FKqMiGQp3C40MhrrazEeidp87Jwr9cyhU2fewHMVLHHzSZWk5gmRouHOIebQ0/qTNi//vLT1kbeaduWThga8nR3tZeQZ1IeptukTjOdxAVP1dcoX1YbwUaFK1+xohogqnXuxK0n5f6uKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635098; c=relaxed/simple;
	bh=BneTF6Xp5rmyFqyxHB08Ui4BQSkX5TS6o9LZKizGA58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+6JbMxJq8jBligKkPhzBt6NrKcEmLw91/XOIYxiwtFiam/N+PUfpMlYPCzR42vcKpP07+mk9RDexJ+zsVEdJzKKCD4xZDaS/XxbSGqeYhaDHtFgSzbBdenwcXV4mVOxPTUxw9pZcLBqxba6WsvsKWI/3NAkSBf8M4K/E7ypbv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xo47GiyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xo47GiyG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 869E5C2BCF4;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787635097;
	bh=BneTF6Xp5rmyFqyxHB08Ui4BQSkX5TS6o9LZKizGA58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xo47GiyGhMkdCipCKnOTrjdRaYBT1T/wWO/QvSfALphPWrzex6DcYWTs+Vt2nOjq9
	 Xa2vtj02c3W107E3vmCbJNAVf5auPLa1ADwTrSdNRuH/svFJA+YptsFejhMrV2sf5O
	 pUOHLEplU3aq5jIAu8WwodeXKpGSIQbBMHR+AfpNMX1HToAJX/B0YOLrF+ZIwiLv4t
	 XPtw7YkbPHu6igsNd5XmpFHQeXnaHhICbthZ7FOm4CIfLu7I4OKPAZmFJHelL2fQjO
	 dVKYcpiL1BQOQPTt58iaQCVla/a1656cCHyQY+M6DgHKS0PSMB0BzDme/Z9ylJEHTv
	 kjSMHQQFsEdwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741ECC5DF94;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Aug 2026 22:18:16 -0700
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Enable the EG25-G modem on
 the Pinephone Pro
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-ppp_connectivity-v2-1-a4b0e11cd62c@gmail.com>
References: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
In-Reply-To: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, linux-clk@vger.kernel.org, 
 mfd@lists.linux.dev, Martijn Braam <martijn@brixit.nl>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787635096; l=3686;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=BKJ8ewE7fSzmNjTVUblEb/3+hReBdcpXwAlKzQmJ6A0=;
 b=JfLuqZDAAFi4RexAkel6rjPxl7Ab5EWlSrS/LXNb9jOehBe8iOvV5AQVjfdUL7x/lasiDV5iu
 R8unLNmd0Z6D/Or9z5ISDXintJ2aTYSBlEXJcMEiUDgmot8YG/DQ+xQ
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Martijn Braam <martijn@brixit.nl>

The Quectel EG25-G modem is soldered to the board. It sits on the USB 2.0
host controller behind u2phy1, with uart3 as its AT command port, and
draws from two switched rails: vcc_4g_5v off the RK818 boost, and vcc_4g
off vcc_sys.

Neither rail supplies anything but the modem, which has to stay powered
for the board to work as a phone, so both are always-on.

The modem itself has no binding and no in-kernel driver, so it is not
described here; its control lines are driven from userspace.

Based on work by Martijn Braam, Kamil Trzciński, Ondrej Jirman and Dang
Huynh.

Signed-off-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 8d26bd9b7500..8d2b6a46b39d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -134,6 +134,32 @@ vcca1v8_s3: regulator-vcc1v8-s3 {
 		regulator-boot-on;
 	};
 
+	vcc_4g: regulator-vcc-4g {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_4g_en>;
+		regulator-name = "vcc_4g";
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		vin-supply = <&vcc_sys>;
+		regulator-always-on;
+	};
+
+	vcc_4g_5v: regulator-vcc-4g-5v {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_4g_5v_en>;
+		regulator-name = "vcc_4g_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+		regulator-always-on;
+	};
+
 	vcc1v8_codec: regulator-vcc1v8-codec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -264,6 +290,7 @@ rk818: pmic@1c {
 		system-power-controller;
 		wakeup-source;
 
+		boost-supply = <&vcc_sys>;
 		vcc1-supply = <&vcc_sys>;
 		vcc2-supply = <&vcc_sys>;
 		vcc3-supply = <&vcc_sys>;
@@ -318,6 +345,17 @@ regulator-state-mem {
 				};
 			};
 
+			vcc5v0_sys: DCDC_BOOST {
+				regulator-name = "vcc5v0_sys";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
 			vcca3v0_codec: LDO_REG1 {
 				regulator-name = "vcca3v0_codec";
 				regulator-min-microvolt = <3000000>;
@@ -702,6 +740,16 @@ blue_led_pin: blue-led-pin {
 		};
 	};
 
+	modem {
+		vcc_4g_5v_en: vcc-4g-5v-en-pin {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc_4g_en: vcc-4g-en-pin {
+			rockchip,pins = <4 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -827,6 +875,15 @@ &tsadc {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_host {
+	phy-supply = <&vcc5v0_sys>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
@@ -852,6 +909,18 @@ &uart2 {
 	status = "okay";
 };
 
+&uart3 {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
 &vopb {
 	status = "okay";
 	assigned-clocks = <&cru DCLK_VOP0_DIV>, <&cru DCLK_VOP0>,

-- 
2.55.0


