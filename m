Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH 1/3] clk: meson: gxbb: remove HHI_GEN_CLK_CTNL duplicate
 definition
Date: Wed,  4 Jul 2018 18:54:56 +0200
Message-Id: <20180704165458.24149-2-jbrunet@baylibre.com>
In-Reply-To: <20180704165458.24149-1-jbrunet@baylibre.com>
References: <20180704165458.24149-1-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

HHI_GEN_CLK_CTNL is defined twice, just remove the duplicate definition

Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index ec1a812bf1fd..df6c21d368c6 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -66,7 +66,6 @@
 #define HHI_USB_CLK_CNTL		0x220 /* 0x88 offset in data sheet */
 #define HHI_32K_CLK_CNTL		0x224 /* 0x89 offset in data sheet */
 #define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
-#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
 
 #define HHI_PCM_CLK_CNTL		0x258 /* 0x96 offset in data sheet */
 #define HHI_NAND_CLK_CNTL		0x25C /* 0x97 offset in data sheet */
-- 
2.14.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
