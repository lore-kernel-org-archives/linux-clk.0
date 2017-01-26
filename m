Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>,
 Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/9] arm64: allwinner: Kconfig: add essential pinctrl
 driver for H5
Date: Thu, 26 Jan 2017 23:48:52 +0800
Message-Id: <20170126154859.55855-3-icenowy@aosc.xyz>
In-Reply-To: <20170126154859.55855-1-icenowy@aosc.xyz>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

H5 SoC has two pin controllers, one (in user manual called "CPUx") needs
a slightly advanced driver, and the other (called "CPUs") is just equal
to the on in H3, and the H3 driver can be just reused.

Select the two necessary pinctrl drivers when building kernel for
Allwinner SoCs.

Also add H5 in the option's description.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 arch/arm64/Kconfig.platforms | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 715ef1256838..e11523d204b5 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -5,8 +5,11 @@ config ARCH_SUNXI
 	select GENERIC_IRQ_CHIP
 	select PINCTRL
 	select PINCTRL_SUN50I_A64
+	select PINCTRL_SUN50I_H5
+	select PINCTRL_SUN8I_H3_R
 	help
-	  This enables support for Allwinner sunxi based SoCs like the A64.
+	  This enables support for Allwinner sunxi based SoCs like the A64
+	  and H5.
 
 config ARCH_ALPINE
 	bool "Annapurna Labs Alpine platform"
-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
