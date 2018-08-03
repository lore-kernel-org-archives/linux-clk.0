Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:33400 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726413AbeHCE6U (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Aug 2018 00:58:20 -0400
From: Songjun Wu <songjun.wu@linux.intel.com>
To: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Songjun Wu <songjun.wu@linux.intel.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/18] MIPS: lantiq: Unselect SWAP_IO_SPACE when LANTIQ is selected
Date: Fri,  3 Aug 2018 11:02:29 +0800
Message-Id: <20180803030237.3366-11-songjun.wu@linux.intel.com>
In-Reply-To: <20180803030237.3366-1-songjun.wu@linux.intel.com>
References: <20180803030237.3366-1-songjun.wu@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

SWAP_IO_SPACE macro prevents serial driver /drivers/tty/serial/lantiq.c
to use readl/writel to replace ltq_r32/w32 which are SoC or platform
specific APIs.

readl/writel are used for this serial driver to support multiple
platforms and multiple architectures. The legacy lantiq platform(Danube)
enables SWAP_IO_SPACE for supporting PCI due to some hardware bugs.

It's a little-endian bus plus PCI TX/RX swap enable impacted both data
and control path for MIPS based platforms. But it is better to let PCI
device driver to do endian swap since SWAP_IO_SPACE is a global wide macro
which potentially impacts other peripheral like USB.
ltq_r32/ltq_w32 is not impacted in other device drivers based on MIPS when
SWAP_IO_SPACE is not selected as they use non-byte swapping OS API
(__raw_read/__raw_writel).

Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>
---

Changes in v2: None

 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2d34f17f3e24..2e7e0b538e52 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -400,7 +400,6 @@ config LANTIQ
 	select SYS_SUPPORTS_VPE_LOADER
 	select SYS_HAS_EARLY_PRINTK
 	select GPIOLIB
-	select SWAP_IO_SPACE
 	select BOOT_RAW
 	select CLKDEV_LOOKUP
 	select USE_OF
-- 
2.11.0

