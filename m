Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982B3DB64D;
	Mon, 10 Aug 2026 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364154; cv=none; b=a0tA3UM8+61Pwqpy3dv5b39MJANcac8foxvKnptniB10P+PtJehLaQF02wLbvJT/tsu3sezP1JirP9JmhNvEKG40hftTTHYynE1I2raYLqe8rsfevrmT106Y7U4SFPt91E5+Il8HIcADzlnAqBCPD6rF0XAXQIYZLQekuA6b0ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364154; c=relaxed/simple;
	bh=4Awjjf/du7R9fcJrkoKbpT1I7fR1jX8vL8nrj3muPpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmuAReQ3YA9oEGedM8U4Ui1G5zt7Ey7P/Cg+Iz9XdAexylSTaGUlCXvNYU671dZNQdXDULpzrSwVGbD8bpOzD88vVf3pETntDiT1gzBQyOGCMoYEgAZYwx6yFwOLpvidJEJY8ITyXCqJ4M2Npetj8eRt3ECeM5043JSGyTg8794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=GmwWXZvW; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="GmwWXZvW"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EDBDC0516;
	Mon, 10 Aug 2026 15:15:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364151; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=aUtZrsjC3vglTeNLq8+cauC4JI68XDzlA8yNJ7+9MYA=;
	b=GmwWXZvWIVElYjcS897Vd4n2aK5EH6DTVsk6T6F6FVblshSJnhnBZgCNCzTWB042R9hJ7c
	sJeZk6DUMxFmIK390lHlCctnYe5q1zyDKau+BFtjQnpEPtzy40qiCrFjwfbDzJ+m7ZIBXb
	wnfxLoo3Lhai4WEqi1D1T8Cm4M4iqPkHeYbx2KwSUl5u+qEh/O42V16E8qP+JY5dX1Re4/
	i9nHG+dSM4Nmqfmdy653ArubspI/FSsT7wAiU/mMNyS4TxVTitvqRlfJ78t1/RGDAH4tHo
	KSFktaA07aQVVCnMCZvDAhgxntfFobsvC6f1eLJB7EY38FXb5catkHDaeQi5tw==
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
Subject: [PATCH 06/25] ARM: dts: rockchip: Add Ethernet GMAC node for RV1106
Date: Mon, 10 Aug 2026 15:10:57 +0300
Message-ID: <20260810121121.210040-7-vlad@zlab.su>
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

Rockchip RV1106 has GMAC 10/100 ethernet controller.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index fa5d0d7f4dcb..71dd3dcc386c 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -19,6 +19,7 @@ / {
 	interrupt-parent = <&gic>;
 
 	aliases {
+		ethernet0 = &gmac;
 		gpio0 = &gpio0;
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
@@ -282,6 +283,67 @@ system_sram: sram@ff6c0000 {
 			ranges = <0 0xff6c0000 0x40000>;
 		};
 
+		gmac: ethernet@ffa80000 {
+			compatible = "rockchip,rv1106-gmac", "snps,dwmac-4.20a";
+			reg = <0xffa80000 0x10000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			rockchip,grf = <&grf>;
+			clocks = <&cru CLK_GMAC0_TX_50M_O>, <&cru CLK_GMAC0_REF_50M>,
+				<&cru ACLK_MAC>, <&cru PCLK_MAC>;
+			clock-names = "stmmaceth", "clk_mac_ref",
+					"aclk_mac", "pclk_mac";
+			resets = <&cru SRST_A_MAC>;
+			reset-names = "stmmaceth";
+
+			snps,mixed-burst;
+			snps,tso;
+
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup>;
+			snps,mtl-tx-config = <&mtl_tx_setup>;
+
+			phy-mode = "rmii";
+			clock_in_out = "input";
+			phy-handle = <&rmii_phy>;
+
+			status = "disabled";
+
+			mdio: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <0x1>;
+				#size-cells = <0x0>;
+				rmii_phy: ethernet-phy@2 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <2>;
+					clocks = <&cru CLK_MACPHY>;
+					resets = <&cru SRST_MACPHY>;
+					phy-is-integrated;
+				};
+			};
+
+			stmmac_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <4>;
+				snps,rd_osr_lmt = <8>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {
+					status = "okay";
+				};
+			};
+
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {
+					status = "okay";
+				};
+			};
+		};
+
 		emmc: mmc@ffa90000 {
 			compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
 			reg = <0xffa90000 0x4000>;
-- 
2.47.3

