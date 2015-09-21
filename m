Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Zhiqiang Hou <B48286@freescale.com>
To: <linux-arm-kernel@lists.infradead.org>, <catalin.marinas@arm.com>,
 <will.deacon@arm.com>, <linux-i2c@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
Subject: [PATCH 1/6] i2c: Add i2c support to Freescale Layerscape platforms
Date: Mon, 21 Sep 2015 20:22:33 +0800
Message-ID: <1442838158-2964-2-git-send-email-B48286@freescale.com>
In-Reply-To: <1442838158-2964-1-git-send-email-B48286@freescale.com>
References: <1442838158-2964-1-git-send-email-B48286@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Hou Zhiqiang <B48286@freescale.com>, Shaohui.Xie@freescale.com,
 corbet@lwn.net, bhupesh.sharma@freescale.com, mturquette@baylibre.com,
 wsa@the-dreams.de, sboyd@codeaurora.org, wim@iguana.be,
 Wenbin.Song@freescale.com, scottwood@freescale.com, Mingkai.Hu@freescale.com,
 leoli@freescale.com
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Shaohui Xie <Shaohui.Xie@freescale.com>

Modify the I2C_IMX config to support to Layerscape platforms.

Signed-off-by: Mingkai Hu <Mingkai.Hu@freescale.com>
Signed-off-by: Wenbin Song <Wenbin.Song@freescale.com>
Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
---
 drivers/i2c/busses/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 08b8617..14147ec 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -582,10 +582,10 @@ config I2C_IMG
 
 config I2C_IMX
 	tristate "IMX I2C interface"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || ARCH_LAYERSCAPE
 	help
 	  Say Y here if you want to use the IIC bus controller on
-	  the Freescale i.MX/MXC processors.
+	  the Freescale i.MX/MXC or Layerscape processors.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-imx.
-- 
2.1.0.27.g96db324


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
