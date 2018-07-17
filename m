Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga18.intel.com ([134.134.136.126]:64772 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729708AbeGQT1b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Jul 2018 15:27:31 -0400
Date: Wed, 18 Jul 2018 02:52:49 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: kbuild-all@01.org, Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: [RFC PATCH] clk: mediatek: cksys_base can be static
Message-ID: <20180717185249.GA144124@lkp-hsx02>
References: <1531817552-17221-11-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1531817552-17221-11-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Fixes: 3cff52bad99d ("clk: mediatek: Add MT6765 clock support")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 clk-mt6765.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index 7b360b9..2f90511 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -33,8 +33,8 @@
 static DEFINE_SPINLOCK(mt6765_clk_lock);
 
 /* Total 12 subsys */
-void __iomem *cksys_base;
-void __iomem *apmixed_base;
+static void __iomem *cksys_base;
+static void __iomem *apmixed_base;
 
 /* CKSYS */
 #define CLK_SCP_CFG_0		(cksys_base + 0x200)
