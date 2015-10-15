Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
 <linux-clk@vger.kernel.org>, <olof@lixom.net>
Subject: [PATCH v3 05/12] doc/bindings: Update Layerscape PCIe devicetree
 binding to be more flexible
Date: Thu, 15 Oct 2015 12:17:45 +0530
Message-ID: <1444891672-32117-6-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: LeoLi@freescale.com, bhupesh.sharma@freescale.com, Catalin.Marinas@arm.com,
 will.deacon@arm.com, stuart.yoder@freescale.com,
 Minghuan Lian <Minghuan.Lian@freescale.com>, scottwood@freescale.com,
 bhupesh.linux@gmail.com
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Update the definition of the Layerscape PCI compatible string to be more
flexible, using <soc-name>, so the same binding definition is applicable to
multiple SoCs.

Signed-off-by: Minghuan Lian <Minghuan.Lian@freescale.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 .../devicetree/bindings/pci/layerscape-pci.txt     |   15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index 6286f04..7d918ab 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -1,10 +1,21 @@
 Freescale Layerscape PCIe controller
 
-This PCIe host controller is based on the Synopsis Designware PCIe IP
+This PCIe host controller is based on the Synopsys Designware PCIe IP
 and thus inherits all the common properties defined in designware-pcie.txt.
 
+Note that since this controller derives its clocks from the Reset
+Configuration Word (RCW) which is used to describe the PLL settings at
+the time of chip-reset, the 'clocks' and 'clock-names' properties from
+'designware-pcie.txt' are optional for this controller.
+
+Also as per the available Reference Manuals, there is no specific 'version'
+register available in the Freescale PCIe controller register set,
+which can allow determining the underlying Designware PCIe controller version
+information.
+
 Required properties:
-- compatible: should contain the platform identifier such as "fsl,ls1021a-pcie"
+- compatible: should contain the platform identifier such as "fsl,<soc-name>-pcie",
+  "snps,dw-pcie".
 - reg: base addresses and lengths of the PCIe controller
 - interrupts: A list of interrupt outputs of the controller. Must contain an
   entry for each entry in the interrupt-names property.
-- 
1.7.9.5



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
