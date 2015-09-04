Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
 <linux-clk@vger.kernel.org>
Subject: [PATCH v2 10/10] dts/Makefile: Add build support for LS2080a QDS &
 RDB board DTS
Date: Fri, 4 Sep 2015 12:35:22 +0530
Message-ID: <1441350322-4671-4-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1441350322-4671-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1441350322-4671-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: bhupesh.sharma@freescale.com, Catalin.Marinas@arm.com,
 bhupesh.linux@gmail.com, will.deacon@arm.com, olof@lixom.net
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

This patch adds build support for LS2080a QDS & RDB board DTS files
in the arm64 DTS Makefile.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 arch/arm64/boot/dts/freescale/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 932001a..57b41c7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -1,4 +1,4 @@
-dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb fsl-ls2080a-rdb.dtb fsl-ls2080a-simu.dtb
  
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
-- 
1.7.9.5



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
