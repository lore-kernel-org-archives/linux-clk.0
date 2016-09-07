Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>
Subject: [PATCH 3/7] clk: gxbb: expose spifc clock
Date: Wed,  7 Sep 2016 17:13:39 +0200
Message-Id: <1473261223-15412-4-git-send-email-jbrunet@baylibre.com>
In-Reply-To: <1473261223-15412-1-git-send-email-jbrunet@baylibre.com>
References: <1473261223-15412-1-git-send-email-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

SPI clock is needed for the spifc driver, expose to DT
(and comment out in the clk driver)

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.h              | 2 +-
 include/dt-bindings/clock/gxbb-clkc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index a2adf34..5abe266 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -202,7 +202,7 @@
 #define CLKID_ABUF		  31
 #define CLKID_HIU_IFACE		  32
 #define CLKID_ASSIST_MISC	  33
-#define CLKID_SPI		  34
+/* CLKID_SPI */
 #define CLKID_I2S_SPDIF		  35
 #define CLKID_ETH		  36
 #define CLKID_DEMUX		  37
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index f889d80..dcf3776 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -7,6 +7,7 @@
 
 #define CLKID_CPUCLK		1
 #define CLKID_CLK81		12
+#define CLKID_SPI		34
 #define CLKID_ETH		36
 
 #endif /* __GXBB_CLKC_H */
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
