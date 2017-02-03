Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39835 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752238AbdBCDk2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2017 22:40:28 -0500
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@free-electrons.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: mvebu: Add mv98dx3236-soc-id
Date: Fri,  3 Feb 2017 16:40:11 +1300
Message-Id: <20170203034012.29399-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
References: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The DFX server on the 98dx3236 and compatible SoCs has an ID register
that provides revision information that the PCI based ID register
doesn't have. Use this if it's available.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/arm/marvell/mv98dx3236-soc-id.txt     | 14 +++++++
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |  5 +++
 arch/arm/mach-mvebu/mvebu-soc-id.c                 | 43 ++++++++++++++++++++--
 3 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/mv98dx3236-soc-id.txt

diff --git a/Documentation/devicetree/bindings/arm/marvell/mv98dx3236-soc-id.txt b/Documentation/devicetree/bindings/arm/marvell/mv98dx3236-soc-id.txt
new file mode 100644
index 000000000000..ed08cb126a83
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/mv98dx3236-soc-id.txt
@@ -0,0 +1,14 @@
+Marvell 98dx3236 SoC ID
+---------------------------------------------------------------
+
+Required properties:
+
+- compatible: Should be "marvell,mv98dx3236-soc-id".
+
+- reg: should be the register base and length as documented in the
+  datasheet for the Device ID Status
+
+soc-id@f8244 {
+	compatible = "marvell,mv98dx3236-soc-id";
+	reg = <0xf8244 0x4>;
+};
diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
index cbf5cd0c6429..e4baa97836e7 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -264,6 +264,11 @@
 			ranges = <0 MBUS_ID(0x08, 0x00) 0 0x100000>;
 			reg = <MBUS_ID(0x08, 0x00) 0 0x100000>;
 
+			soc-id@f8244 {
+				compatible = "marvell,mv98dx3236-soc-id";
+				reg = <0xf8244 0x4>;
+			};
+
 			dfx_coredivclk: corediv-clock@f8268 {
 				compatible = "marvell,mv98dx3236-corediv-clock";
 				reg = <0xf8268 0xc>;
diff --git a/arch/arm/mach-mvebu/mvebu-soc-id.c b/arch/arm/mach-mvebu/mvebu-soc-id.c
index a99434bcee84..b4c94a57f358 100644
--- a/arch/arm/mach-mvebu/mvebu-soc-id.c
+++ b/arch/arm/mach-mvebu/mvebu-soc-id.c
@@ -34,6 +34,9 @@
 #define SOC_ID_MASK	    0xFFFF0000
 #define SOC_REV_MASK	    0xFF
 
+#define MV98DX3236_DEV_ID_MASK	0xFF00
+#define MV98DX3236_REV_MASK	0xF
+
 static u32 soc_dev_id;
 static u32 soc_rev;
 static bool is_id_valid;
@@ -45,6 +48,11 @@ static const struct of_device_id mvebu_pcie_of_match_table[] = {
 	{},
 };
 
+static const struct of_device_id mvebu_mv98dx3236_of_match_table[] = {
+	{ .compatible = "marvell,mv98dx3236-soc-id", },
+	{},
+};
+
 int mvebu_get_soc_id(u32 *dev, u32 *rev)
 {
 	if (is_id_valid) {
@@ -131,15 +139,44 @@ static int __init get_soc_id_by_pci(void)
 	return ret;
 }
 
+static int __init mvebu_dfx_get_soc_id(u32 *dev, u32 *rev)
+{
+	struct device_node *np;
+	void __iomem *base;
+
+	np = of_find_matching_node(NULL, mvebu_mv98dx3236_of_match_table);
+	if (!np)
+		return -ENODEV;
+
+	base = of_iomap(np, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/* SoC ID */
+	*dev = (readl(base) >> 12) & MV98DX3236_DEV_ID_MASK;
+	/* SoC revision */
+	*rev = (readl(base) >> 28) & MV98DX3236_REV_MASK;
+
+	iounmap(base);
+	of_node_put(np);
+
+	return 0;
+}
+
 static int __init mvebu_soc_id_init(void)
 {
 
 	/*
-	 * First try to get the ID and the revision by the system
-	 * register and use PCI registers only if it is not possible
+	 * First try to get the ID and the revision by from system controller
+	 * register, then try the DFX register (if applicable), finally read it
+	 * from PCI registers.
 	 */
-	if (!mvebu_system_controller_get_soc_id(&soc_dev_id, &soc_rev)) {
+	if (!mvebu_system_controller_get_soc_id(&soc_dev_id, &soc_rev))
+		is_id_valid = true;
+	else if (!mvebu_dfx_get_soc_id(&soc_dev_id, &soc_rev))
 		is_id_valid = true;
+
+	if (is_id_valid) {
 		pr_info("MVEBU SoC ID=0x%X, Rev=0x%X\n", soc_dev_id, soc_rev);
 		return 0;
 	}
-- 
2.11.0.24.ge6920cf

