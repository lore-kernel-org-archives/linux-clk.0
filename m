Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Wed, 26 Jul 2017 09:18:08 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Sergej Sawazki <sergej@taudac.com>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, ce3a@gmx.de,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: Re: [PATCH] clk: si5351: Apply PLL soft reset before enabling the
 outputs
Message-ID: <20170726081807.GL31807@n2100.armlinux.org.uk>
References: <1501010261-7130-1-git-send-email-sergej@taudac.com>
 <20170726011112.GK2146@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170726011112.GK2146@codeaurora.org>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 25, 2017 at 06:11:12PM -0700, Stephen Boyd wrote:
> On 07/25, Sergej Sawazki wrote:
> > The "Si5351A/B/C Data Sheet" states to apply a PLLA and PLLB soft reset
> > before enabling the outputs [1]. This is required to get a deterministic
> > phase relationship between the output clocks.
> > 
> > Without the PLL reset, the phase offset beween the clocks is unpredictable.
> > 
> > References:
> > [1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
> >     Figure 12 ("I2C Programming Procedure")
> > 
> > Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> > Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> > Signed-off-by: Sergej Sawazki <sergej@taudac.com>
> > ---
> 
> This is similar to commit 6dc669a22c77 (clk: si5351: Add PLL soft
> reset, 2015-11-20)? But I think that commit was causing some
> problem for Russell King and there was going to be a patch to
> change it but nothing has materialized on the list. Unless this
> is that patch?

Did I not send that patch?  Sorry, I can't keep track of everything.

8<====
From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] clk: si5351: fix PLL reset

Changing the audio sample rate on the SolidRun Cubox disrupts the video
output.  The Si5351 provides both the video clock (using PLLA on output
0) and the audio clock (using PLLB on output 2).

When the rate of clock output 2 is changed, it reconfigures PLLB, which
results in both PLLA and PLLB being reset.  The reset of PLLA causes
clock output 0 to be disrupted, thereby causing a loss of sync by the
attached display device.

Hence, each time the audio sample rate changes (eg, when a video player
starts up, or when starting to play music) the video display momentarily
blanks while the Si5351 settles down.  Prior to the commit below, this
behaviour did not happen.

Fix this by only resetting only the PLL which has been changed.

Fixes: 6dc669a22c77 ("clk: si5351: Add PLL soft reset")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/clk/clk-si5351.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 412a1fb5b6aa..48961ac1ced5 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -520,6 +520,11 @@ static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		SI5351_CLK_INTEGER_MODE,
 		(hwdata->params.p2 == 0) ? SI5351_CLK_INTEGER_MODE : 0);
 
+	/* Do a pll soft reset on the affected pll */
+	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
+			 hwdata->num == 0 ? SI5351_PLL_RESET_A :
+					    SI5351_PLL_RESET_B);
+
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: p1 = %lu, p2 = %lu, p3 = %lu, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw),
@@ -1092,13 +1097,6 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_POWERDOWN, 0);
 
-	/*
-	 * Do a pll soft reset on both plls, needed in some cases to get
-	 * all outputs running.
-	 */
-	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
-			 SI5351_PLL_RESET_A | SI5351_PLL_RESET_B);
-
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), (1 << rdiv),
-- 
2.7.4

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
