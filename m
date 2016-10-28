Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>, Scott Wood
 <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [v13, 1/8] dt: bindings: update Freescale DCFG compatible
Date: Fri, 28 Oct 2016 11:32:27 +0800
Message-ID: <1477625554-46700-2-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1477625554-46700-1-git-send-email-yangbo.lu@nxp.com>
References: <1477625554-46700-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>, Minghuan Lian <minghuan.lian@nxp.com>,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 Qiang Zhao <qiang.zhao@nxp.com>, Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Jochen Friedrich <jochen@scram.de>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, devicetree@vger.kernel.org,
 Yangbo Lu <yangbo.lu@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Leo Li <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Update Freescale DCFG compatible with 'fsl,<chip>-dcfg' instead
of 'fsl,ls1021a-dcfg' to include more chips such as ls1021a,
ls1043a, and ls2080a.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Scott Wood <oss@buserror.net>
---
Changes for v8:
	- Added this patch
Changes for v9:
	- Added a list for the possible compatibles
Changes for v10:
	- None
Changes for v11:
	- Added 'Acked-by: Rob Herring'
	- Updated commit message by Scott
Changes for v12:
	- None
Changes for v13:
	- None
---
 Documentation/devicetree/bindings/arm/fsl.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index dbbc095..713c1ae 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -119,7 +119,11 @@ Freescale DCFG
 configuration and status for the device. Such as setting the secondary
 core start address and release the secondary core from holdoff and startup.
   Required properties:
-  - compatible: should be "fsl,ls1021a-dcfg"
+  - compatible: should be "fsl,<chip>-dcfg"
+    Possible compatibles:
+	"fsl,ls1021a-dcfg"
+	"fsl,ls1043a-dcfg"
+	"fsl,ls2080a-dcfg"
   - reg : should contain base address and length of DCFG memory-mapped registers
 
 Example:
-- 
2.1.0.27.g96db324


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
