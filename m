Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>,
 Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 06/10] clk: sunxi-ng: remove transitional headers for
 dt-bindings
Date: Sun, 29 Jan 2017 10:33:27 +0800
Message-Id: <20170129023331.62106-7-icenowy@aosc.xyz>
In-Reply-To: <20170129023331.62106-1-icenowy@aosc.xyz>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
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

As we have already changed the DTSI file, the trnasitional dt-bindings
header sun8i-h3-ccu.h will not be needed any more.

Remove them.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
It's a patch which intends to keep the bisectbility of the kernel source
tree introduced in v2.

 include/dt-bindings/clock/sun8i-h3-ccu.h | 1 -
 include/dt-bindings/reset/sun8i-h3-ccu.h | 1 -
 2 files changed, 2 deletions(-)
 delete mode 120000 include/dt-bindings/clock/sun8i-h3-ccu.h
 delete mode 120000 include/dt-bindings/reset/sun8i-h3-ccu.h

diff --git a/include/dt-bindings/clock/sun8i-h3-ccu.h b/include/dt-bindings/clock/sun8i-h3-ccu.h
deleted file mode 120000
index ef38232141e4..000000000000
--- a/include/dt-bindings/clock/sun8i-h3-ccu.h
+++ /dev/null
@@ -1 +0,0 @@
-sunxi-h3-h5-ccu.h
\ No newline at end of file
diff --git a/include/dt-bindings/reset/sun8i-h3-ccu.h b/include/dt-bindings/reset/sun8i-h3-ccu.h
deleted file mode 120000
index ef38232141e4..000000000000
--- a/include/dt-bindings/reset/sun8i-h3-ccu.h
+++ /dev/null
@@ -1 +0,0 @@
-sunxi-h3-h5-ccu.h
\ No newline at end of file
-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
