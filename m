Return-Path: <peron.clem@gmail.com>
Return-Path: <peron.clem@gmail.com>
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Colin Didier <colin.dider@devialet.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>
Subject: [PATCH 1/5] ARM: imx: remove inexistant EPIT timer init
Date: Mon, 28 May 2018 19:34:08 +0200
Message-Id: <20180528173412.10000-2-peron.clem@gmail.com>
In-Reply-To: <20180528173412.10000-1-peron.clem@gmail.com>
References: <20180528173412.10000-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Clément Peron <clement.peron@devialet.com>

i.MX EPIT timer has been removed but not the init function declaration.

Signed-off-by: Clément Peron <clement.peron@devialet.com>
---
 arch/arm/mach-imx/common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index c8d68e918b2f..18aae76fa2da 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -38,7 +38,6 @@ void imx21_soc_init(void);
 void imx27_soc_init(void);
 void imx31_soc_init(void);
 void imx35_soc_init(void);
-void epit_timer_init(void __iomem *base, int irq);
 int mx21_clocks_init(unsigned long lref, unsigned long fref);
 int mx27_clocks_init(unsigned long fref);
 int mx31_clocks_init(unsigned long fref);
-- 
2.17.0
