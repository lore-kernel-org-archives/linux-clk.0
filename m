Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC83826AF;
	Wed,  6 Dec 2023 03:52:22 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3F79C24E311;
	Wed,  6 Dec 2023 19:52:21 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 19:52:21 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 6 Dec 2023 19:52:14 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<emil.renner.berthing@canonical.com>, <hal.feng@starfivetech.com>,
	<xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
Date: Wed, 6 Dec 2023 19:50:00 +0800
Message-ID: <20231206115000.295825-17-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
nodes for JH8100 RISC-V SoC.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi | 180 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh8100.dtsi     | 115 ++++++++++++
 2 files changed, 295 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi b/arch/riscv/bo=
ot/dts/starfive/jh8100-clk.dtsi
new file mode 100644
index 000000000000..27ba249f523e
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+/ {
+	clk_osc: clk_osc {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <24000000>;
+	};
+
+	clk_i2srx_bclk_ext: clk_i2srx_bclk_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <12288000>;
+	};
+
+	clk_i2srx_lrck_ext: clk_i2srx_lrck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <192000>;
+	};
+
+	clk_mclk_ext: clk_mclk_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <49152000>;
+	};
+	/* sys-ne */
+	clk_usb3_tap_tck_ext: clk_usb3_tap_tck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_glb_ext_clk: clk_glb_ext_clk {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <30000000>;
+	};
+
+	clk_usb1_tap_tck_ext: clk_usb1_tap_tck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_usb2_tap_tck_ext: clk_usb2_tap_tck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_i2s_tscko: clk_i2s_tscko {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <12800000>;
+	};
+
+	clk_typec_tap_tck_ext: clk_typec_tap_tck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_spi_in0_ext: clk_spi_in0_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_spi_in1_ext: clk_spi_in1_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_spi_in2_ext: clk_spi_in2_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_i2stx_bclk_ext: clk_i2stx_bclk_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <12288000>;
+	};
+
+	clk_i2stx_lrck_ext: clk_i2stx_lrck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <192000>;
+	};
+	/* sys-nw */
+	clk_dvp_ext: clk_dvp_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <150000000>;
+	};
+
+	clk_isp_dphy_tap_tck_ext: clk_isp_dphy_tap_tck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_vout_mipi_dphy_tap_tck_ext: clk_vout_mipi_dphy_tap_tck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_vout_edp_tap_tck_ext: clk_vout_edp_tap_tck_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <100000000>;
+	};
+
+	clk_rtc: clk_rtc {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <32768>;
+	};
+	/* aon */
+	clk_gmac0_rmii_func: clk_gmac0_rmii_func {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <50000000>;
+	};
+
+	clk_gmac0_rgmii_func: clk_gmac0_rgmii_func {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <125000000>;
+	};
+
+	clk_aon50: clk_aon50 {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <50000000>;
+	};
+
+	clk_aon125: clk_aon125 {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <125000000>;
+	};
+
+	clk_aon2000: clk_aon2000 {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <2000000000>;
+	};
+
+	clk_aon200: clk_aon200 {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <200000000>;
+	};
+
+	clk_aon667: clk_isp_aon667 {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <667000000>;
+	};
+
+	clk_i3c_ext: clk_i3c_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <12500000>;
+	};
+
+	clk_espi_ext: clk_espi_ext {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <60000000>;
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/d=
ts/starfive/jh8100.dtsi
index f26aff5c1ddf..9863c61324a0 100644
--- a/arch/riscv/boot/dts/starfive/jh8100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
@@ -4,6 +4,9 @@
  */
=20
 /dts-v1/;
+#include <dt-bindings/clock/starfive,jh8100-crg.h>
+#include <dt-bindings/reset/starfive,jh8100-crg.h>
+#include "jh8100-clk.dtsi"
=20
 / {
 	compatible =3D "starfive,jh8100";
@@ -357,6 +360,104 @@ uart4: serial@121a0000  {
 			status =3D "disabled";
 		};
=20
+		syscrg_ne: syscrg_ne@12320000 {
+			compatible =3D "starfive,jh8100-syscrg-ne";
+			reg =3D <0x0 0x12320000 0x0 0x10000>;
+			clocks =3D <&clk_osc>, <&syscrg SYSCRG_CLK_AXI_400>,
+				 <&syscrg SYSCRG_CLK_VOUT_ROOT0>,
+				 <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
+				 <&syscrg SYSCRG_CLK_USB_WRAP_480>,
+				 <&syscrg SYSCRG_CLK_USB_WRAP_625>,
+				 <&syscrg SYSCRG_CLK_USB_WRAP_240>,
+				 <&syscrg SYSCRG_CLK_USB_WRAP_60>,
+				 <&syscrg SYSCRG_CLK_USB_WRAP_156P25>,
+				 <&syscrg SYSCRG_CLK_USB_WRAP_312P5>,
+				 <&syscrg SYSCRG_CLK_USB_125M>,
+				 <&syscrg_nw SYSCRG_NW_CLK_GPIO_100>,
+				 <&syscrg SYSCRG_CLK_PERH_ROOT>, <&syscrg SYSCRG_CLK_MCLK>,
+				 <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
+				 <&syscrg SYSCRG_CLK_AHB0>,
+				 <&syscrg SYSCRG_CLK_APB_BUS_PER1>,
+				 <&syscrg SYSCRG_CLK_APB_BUS_PER2>,
+				 <&syscrg SYSCRG_CLK_APB_BUS_PER3>,
+				 <&syscrg SYSCRG_CLK_APB_BUS_PER5>,
+				 <&syscrg SYSCRG_CLK_VENC_ROOT>,
+				 <&syscrg SYSCRG_CLK_SPI_CORE_100>,
+				 <&clk_glb_ext_clk>, <&clk_usb3_tap_tck_ext>,
+				 <&clk_usb1_tap_tck_ext>, <&clk_usb2_tap_tck_ext>,
+				 <&clk_typec_tap_tck_ext>, <&clk_spi_in0_ext>,
+				 <&clk_spi_in1_ext>, <&clk_i2stx_bclk_ext>, <&clk_i2stx_lrck_ext>;
+			clock-names =3D "clk_osc", "sys_clk_axi_400",
+				      "sys_clk_vout_root0", "sys_clk_vout_root1",
+				      "sys_clk_usb_wrap_480", "sys_clk_usb_wrap_625",
+				      "sys_clk_usb_wrap_240", "sys_clk_usb_wrap_60",
+				      "sys_clk_usb_wrap_156p25", "sys_clk_usb_wrap_312p5",
+				      "sys_clk_usb_125m", "sys_nw_clk_gpio_100",
+				      "sys_clk_perh_root", "sys_clk_mclk",
+				      "sys_clk_perh_root_preosc", "sys_clk_ahb0",
+				      "sys_clk_apb_bus_per1", "sys_clk_apb_bus_per2",
+				      "sys_clk_apb_bus_per3", "sys_clk_apb_bus_per5",
+				      "sys_clk_venc_root", "sys_clk_spi_core_100",
+				      "clk_glb_ext_clk", "clk_usb3_tap_tck_ext",
+				      "clk_usb1_tap_tck_ext", "clk_usb2_tap_tck_ext",
+				      "clk_typec_tap_tck_ext", "clk_spi_in0_ext",
+				      "clk_spi_in1_ext", "clk_i2stx_bclk_ext",
+				      "clk_i2stx_lrck_ext";
+			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
+		};
+
+		syscrg_nw: syscrg_nw@123c0000 {
+			compatible =3D "starfive,jh8100-syscrg-nw";
+			reg =3D <0x0 0x123c0000 0x0 0x10000>;
+			clocks =3D <&clk_osc>, <&syscrg SYSCRG_CLK_APB_BUS>,
+				 <&syscrg SYSCRG_CLK_ISP_2X>, <&syscrg SYSCRG_CLK_ISP_AXI>,
+				 <&syscrg SYSCRG_CLK_VOUT_ROOT0>, <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
+				 <&syscrg SYSCRG_CLK_VOUT_SCAN_ATS>,
+				 <&syscrg SYSCRG_CLK_VOUT_DC_CORE>, <&syscrg SYSCRG_CLK_VOUT_AXI>,
+				 <&syscrg SYSCRG_CLK_AXI_400>, <&syscrg SYSCRG_CLK_AXI_200>,
+				 <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
+				 <&clk_dvp_ext>, <&clk_isp_dphy_tap_tck_ext>,
+				 <&clk_glb_ext_clk>, <&clk_i2s_tscko>,
+				 <&clk_vout_mipi_dphy_tap_tck_ext>, <&clk_vout_edp_tap_tck_ext>,
+				 <&clk_spi_in2_ext>;
+			clock-names =3D "clk_osc", "sys_clk_apb_bus",
+				      "sys_clk_isp_2x", "sys_clk_isp_axi",
+				      "sys_clk_vout_root0", "sys_clk_vout_root1",
+				      "sys_clk_vout_scan_ats", "sys_clk_vout_dc_core",
+				      "sys_clk_vout_axi", "sys_clk_axi_400",
+				      "sys_clk_axi_200", "sys_clk_perh_root_preosc", "clk_dvp_ext",
+				      "clk_isp_dphy_tap_tck_ext", "clk_glb_ext_clk",
+				      "clk_i2s_tscko", "clk_vout_mipi_dphy_tap_tck_ext",
+				      "clk_vout_edp_tap_tck_ext", "clk_spi_in2_ext";
+			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
+		};
+
+		syscrg: syscrg@126d0000 {
+			compatible =3D "starfive,jh8100-syscrg";
+			reg =3D <0x0 0x126d0000 0x0 0x10000>;
+			clocks =3D <&clk_osc>, <&clk_i2srx_bclk_ext>,
+				 <&clk_i2srx_lrck_ext>, <&clk_mclk_ext>;
+			clock-names =3D "clk_osc", "clk_i2srx_bclk_ext",
+				      "clk_i2srx_lrck_ext", "clk_mclk_ext";
+			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
+		};
+
+		syscrg_sw: syscrg_sw@12720000 {
+			compatible =3D "starfive,jh8100-syscrg-sw";
+			reg =3D <0x0 0x12720000 0x0 0x10000>;
+			clocks =3D <&syscrg SYSCRG_CLK_APB_BUS>,
+				 <&syscrg SYSCRG_CLK_VDEC_ROOT>,
+				 <&syscrg SYSCRG_CLK_FLEXNOC1>;
+			clock-names =3D "sys_clk_apb_bus",
+				      "sys_clk_vdec_root",
+				      "sys_clk_flexnoc1";
+			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
+		};
+
 		uart5: serial@127d0000  {
 			compatible =3D "starfive,jh8100-uart", "cdns,uart-r1p8";
 			reg =3D <0x0 0x127d0000 0x0 0x10000>;
@@ -374,5 +475,19 @@ uart6: serial@127e0000  {
 			interrupts =3D <73>;
 			status =3D "disabled";
 		};
+
+		aoncrg: aoncrg@1f310000 {
+			compatible =3D "starfive,jh8100-aoncrg";
+			reg =3D <0x0 0x1f310000 0x0 0x10000>;
+			clocks =3D <&clk_osc>, <&clk_gmac0_rmii_func>,
+				 <&clk_gmac0_rgmii_func>, <&clk_aon125>,
+				 <&clk_aon2000>, <&clk_aon200>,
+				 <&clk_aon667>, <&clk_rtc>;
+			clock-names =3D "clk_osc", "clk_gmac0_rmii_func", "clk_gmac0_rgmii_fu=
nc",
+				      "clk_aon125", "clk_aon2000", "clk_aon200",
+				      "clk_aon667", "clk_rtc";
+			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
+		};
 	};
 };
--=20
2.34.1

