Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42E23E1204;
	Mon, 10 Aug 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364166; cv=none; b=Szlshy4btmce5kzshawv8RnXGdxjCcPom/TLTPjyz2KyuRbPnQJX7MRd9ztW55ljw4rtw9Eoq+LdP8JAKMuNlfxROGusiXicDI1g3va2kpwX9tuA0QDbdNh5x17/YZQzY23s65DrBahDVkGZxJkKQuuBg+D9Ur63s9U/G8saqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364166; c=relaxed/simple;
	bh=27Dy8S0A0xEFr+M0asXkwaHrlOHrD5IjSfrmKSDKhWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNQazia5VVy8g5wxEXKcLi73jTZDV2Iz3D3F+f7yc1285F6FHdJHhHL9MR7ia6y75uBvF5fxmCytigMeQQMnWA53Re+KxLFMNhhZ6R/SrU/VJwDnJHo5QSs9FpvWwMaiclplFncvSA1bEeWh96NFHQ1AvJ29+gJAf+2mIpfVcfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=hmCIc8Vy; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="hmCIc8Vy"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A87B2C0516;
	Mon, 10 Aug 2026 15:16:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364162; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BzpzWg1RUAwQmycNuzrv0GryxIk9OCzfL2FG5/H+8bQ=;
	b=hmCIc8VyewX65zNXEnQc9R+YNR9iwvyDg8Q3h9nb5IiNtN2DZeK4Ke5ikInUEOvoy1qMvW
	zqUvDCLNwWkIwy0ZVIym/3eTbZHYgOvBnVIcRCjFZLExGV41ehjeAX/W9NgfbuRFLEppKT
	Od7zqgHUKettwyfBVj59gPU9qf5ZHSvxDasS6uD0xDMpk2Qah3P/7WZPomichYc2h9UIzo
	4LwaNN76yddbVUQhGadfxY4DZZDgYYEDO24jj04b/RGX4SJNny9+wyRKJHaxODQzT9ZZzK
	8sBZqCDDmpPIBkDyo689VwEHp19c04Yatl+/iIeDnlBDIya2S1Zh8s4Sl8nl7A==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 10/25] ARM: dts: rockchip: Add USB2 PHY and USB3-OTG (DWC3) nodes for RV1106
Date: Mon, 10 Aug 2026 15:11:01 +0300
Message-ID: <20260810121121.210040-11-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the u2phy node with its otg-port child, using the disconnect
interrupt in addition to otg-bvalid/otg-id/linestate.

Also add the usbdrd/usbdrd_dwc3 nodes for the DWC3 controller behind
the PHY, reusing the "rockchip,rk3399-dwc3" glue compatible and the
snps quirks already used by other Rockchip DWC3 platforms, since
RV1106 does not need a dedicated glue driver.

Both nodes default to status = "disabled" and are enabled per-board.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 71dd3dcc386c..43db3b1dd4b8 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -180,6 +180,30 @@ saradc: adc@ff3c0000 {
 			status = "disabled";
 		};
 
+		u2phy: usb2-phy@ff3e0000 {
+			compatible = "rockchip,rv1106-usb2phy";
+			reg = <0xff3e0000 0x8000>;
+			clocks = <&cru CLK_REF_USBPHY>, <&cru PCLK_USBPHY>;
+			clock-names = "phyclk", "pclk";
+			resets = <&cru SRST_USBPHY_POR>, <&cru SRST_P_USBPHY>;
+			reset-names = "phy", "apb";
+			rockchip,usbgrf = <&grf>;
+			#clock-cells = <0>;
+			clock-output-names = "usb480m_phy";
+			status = "disabled";
+
+			u2phy_otg: otg-port {
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						"linestate", "disconnect";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		uart0: serial@ff4a0000 {
 			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
 			reg = <0xff4a0000 0x100>;
@@ -378,6 +402,30 @@ sfc: spi@ffac0000 {
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		usbdrd_dwc3: usb@ffb00000 {
+			compatible = "rockchip,rv1106-dwc3", "snps,dwc3";
+			reg = <0xffb00000 0x100000>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru CLK_REF_USBOTG>, <&cru ACLK_USBOTG>,
+				<&cru CLK_UTMI_USBOTG>;
+			clock-names = "ref_clk", "bus_clk", "utmi";
+			resets = <&cru SRST_A_USBOTG>;
+			dr_mode = "otg";
+			maximum-speed = "high-speed";
+			phys = <&u2phy_otg>;
+			phy-names = "usb2-phy";
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,usb2-gadget-lpm-disable;
+			snps,usb2-lpm-disable;
+			snps,parkmode-disable-hs-quirk;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.47.3

