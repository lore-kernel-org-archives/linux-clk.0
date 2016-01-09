Return-Path: <kernel@martin.sperl.org>
From: kernel@martin.sperl.org
To: Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Remi Pommarel <repk@triplefau.lt>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Reichl <hias@horus.com>,
	lFlorian Meier <florian.meier@koalo.de>
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: [PATCH 1/5] ASoC: bcm2835: cleanup includes by ordering them alphabetically
Date: Sat,  9 Jan 2016 09:25:53 +0000
Message-Id: <1452331558-2520-2-git-send-email-kernel@martin.sperl.org>
In-Reply-To: <1452331558-2520-1-git-send-email-kernel@martin.sperl.org>
References: <1452331558-2520-1-git-send-email-kernel@martin.sperl.org>
List-ID: <linux-clk.vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Cleanup of includes so that they are ordered alphabetically.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 sound/soc/bcm/bcm2835-i2s.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 8c435be..3303d5f 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -31,20 +31,20 @@
  * General Public License for more details.
  */
 
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/module.h>
-#include <linux/device.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/clk.h>
 
 #include <sound/core.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-#include <sound/initval.h>
 #include <sound/soc.h>
-#include <sound/dmaengine_pcm.h>
 
 /* Clock registers */
 #define BCM2835_CLK_PCMCTL_REG  0x00
-- 
1.7.10.4
