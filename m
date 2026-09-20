Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C23290BA;
	Sun, 20 Sep 2026 03:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789875715; cv=none; b=BrE0VTE4+npUSoUot/EGGcD2VI60bCbGMlgRafJq8vPDxnwfi1shrMJkCxwCikZRcnw5G1K2v0jqvLyZAdqtsC6Dm5Ksl4UjXedlyAzDP4FReSjapt5Mr3A0ltFgQ57kzRSKw0AG84SLIqY24/SVxUwd1RQbsWGmMSxOBr3k/FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789875715; c=relaxed/simple;
	bh=uMl7IBhHiCU7WRhNPZqV8c4Rh+y0j4ofSSjlT2inKfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HPGtV2Uy6evJU+UBhs/7zFRI/l/EOcVLxXa9/VpD259JpZ0Y4jLNchm0bzqaqnWrEB/gt9SL9atbeW0oRU3ZH4Jrpm9GHL0rmKRIxbHPm/ou3N4OfLzLj9slwtRd6d1C3fjIjvX+DuDtDKXjYFwVPws0Rznv1LRFTpGYC3km7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kjL7sLxC; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kjL7sLxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Sf
	PlS0D1zxlDxgulMlJjztXs/42ET8MoGxltYIMTLwU=; b=kjL7sLxCOu4+y3hsoO
	5AAX8lt6ktGB/tNUlT7ni7MWs1ibdqz37EES0peWCRZcANAERLLsIYlxeHWWDuml
	R9mj6ZdXxjDnARlZcb+FOfQXNkoBD3a2Li2WBsVZjdn7IxDojVGxrvTwO3MBQcyt
	WTppqXmWvHm5rX47G9xGRwAXc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHjy_lVa9q46I6AQ--.6061S2;
	Sun, 20 Sep 2026 11:41:26 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	s.hauer@pengutronix.de,
	bmasney@redhat.com,
	hppiscas@163.com
Subject: [PATCH v2] clk: si5351: fail prepare when PLL reset times out
Date: Sun, 20 Sep 2026 11:41:24 +0800
Message-ID: <20260920034124.15700-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDHjy_lVa9q46I6AQ--.6061S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr4DGr18Gry8Cw1kWryfWFg_yoW5CF18pF
	ZrW3yYvr4DJr9FvrsIyFWq9a4avw1fta42gw10k3y09r1YqrWjgF4ftFy29Fn0yr95Grsx
	Jr4IyF1rCF1DtFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zil4ibUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgYV3WqvVeaUOQAA3T

The clock prepare path requests a PLL reset when the platform data
requires a deterministic output phase. The reset helper logs polling
errors but returns no status, so prepare still enables the output and
reports success when the reset did not complete.

Return the poll result to prepare, restore the output power-down bit on
failure, and leave the output disabled. XTAL and CLKIN inputs continue
to bypass PLL reset successfully.

The issue was found by our static-analysis tool.

Fixes: 5142cbcea324 ("clk: si5351: Wait for bit clear after PLL reset")
Reviewed-by: Brian Masney <bmasney@redhat.com>
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260623135625.49610-1-pengpeng@iscas.ac.cn/
Drop the unrelated alignment change requested by Brian; retain the
bounded prepare failure path.

 drivers/clk/clk-si5351.c |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 20b0c3c48b86..70daba62305c 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -907,7 +907,7 @@ static int _si5351_clkout_set_disable_state(
 	return 0;
 }
 
-static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
+static int _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
 {
 	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
 	u8 mask = val & SI5351_CLK_PLL_SELECT ? SI5351_PLL_RESET_B :
@@ -918,7 +918,7 @@ static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num
 	switch (val & SI5351_CLK_INPUT_MASK) {
 	case SI5351_CLK_INPUT_XTAL:
 	case SI5351_CLK_INPUT_CLKIN:
-		return;  /* pll not used, no need to reset */
+		return 0;  /* pll not used, no need to reset */
 	}
 
 	si5351_reg_write(drvdata, SI5351_PLL_RESET, mask);
@@ -931,6 +931,8 @@ static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num
 	dev_dbg(&drvdata->client->dev, "%s - %s: pll = %d\n",
 		__func__, clk_hw_get_name(&drvdata->clkout[num].hw),
 		(val & SI5351_CLK_PLL_SELECT) ? 1 : 0);
+
+	return err;
 }
 
 static int si5351_clkout_prepare(struct clk_hw *hw)
@@ -947,8 +949,18 @@ static int si5351_clkout_prepare(struct clk_hw *hw)
 	 * Do a pll soft reset on the parent pll -- needed to get a
 	 * deterministic phase relationship between the output clocks.
 	 */
-	if (pdata->clkout[hwdata->num].pll_reset)
-		_si5351_clkout_reset_pll(hwdata->drvdata, hwdata->num);
+	if (pdata->clkout[hwdata->num].pll_reset) {
+		int ret;
+
+		ret = _si5351_clkout_reset_pll(hwdata->drvdata, hwdata->num);
+		if (ret) {
+			si5351_set_bits(hwdata->drvdata,
+					SI5351_CLK0_CTRL + hwdata->num,
+					SI5351_CLK_POWERDOWN,
+					SI5351_CLK_POWERDOWN);
+			return ret;
+		}
+	}
 
 	si5351_set_bits(hwdata->drvdata, SI5351_OUTPUT_ENABLE_CTRL,
 			(1 << hwdata->num), 0);

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

