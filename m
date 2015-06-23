Return-Path: <gabriel.fernandez@linaro.org>
Return-Path: <gabriel.fernandez@linaro.org>
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	 Pawel Moll <pawel.moll@arm.com>,
	 Mark Rutland <mark.rutland@arm.com>,
	 Ian Campbell <ijc+devicetree@hellion.org.uk>,
	 Kumar Gala <galak@codeaurora.org>,
	 Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	 Maxime Coquelin <maxime.coquelin@st.com>,
	 Patrice Chotard <patrice.chotard@st.com>,
	 Russell King <linux@arm.linux.org.uk>,
	 Michael Turquette <mturquette@baylibre.com>,
	 Stephen Boyd <sboyd@codeaurora.org>,
	 Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	 Peter Griffin <peter.griffin@linaro.org>,
	 Pankaj Dev <pankaj.dev@st.com>,
	 Olivier Bideau <olivier.bideau@st.com>,
	 Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	 Geert Uytterhoeven <geert+renesas@glider.be>,
	 Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 kernel@stlinux.com,
	 linux-clk@vger.kernel.org
Subject: [PATCH 4/9] drivers: clk: st: Fix FSYN channel values
Date: Tue, 23 Jun 2015 16:09:22 +0200
Message-Id: <1435068567-30995-5-git-send-email-gabriel.fernandez@linaro.org>
In-Reply-To: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch fixes the value for disabling the FSYN channel clock.
The 'is_enabled' returned value is also fixed.

Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 drivers/clk/st/clkgen-fsyn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index e7e6782..9e26099 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -489,7 +489,7 @@ static int quadfs_pll_is_enabled(struct clk_hw *hw)
 	struct st_clk_quadfs_pll *pll = to_quadfs_pll(hw);
 	u32 npda = CLKGEN_READ(pll, npda);
 
-	return !!npda;
+	return pll->data->powerup_polarity ? !npda : !!npda;
 }
 
 static int clk_fs660c32_vco_get_rate(unsigned long input, struct stm_fs *fs,
@@ -774,7 +774,7 @@ static void quadfs_fsynth_disable(struct clk_hw *hw)
 	if (fs->lock)
 		spin_lock_irqsave(fs->lock, flags);
 
-	CLKGEN_WRITE(fs, nsb[fs->chan], !fs->data->standby_polarity);
+	CLKGEN_WRITE(fs, nsb[fs->chan], fs->data->standby_polarity);
 
 	if (fs->lock)
 		spin_unlock_irqrestore(fs->lock, flags);
-- 
1.9.1
