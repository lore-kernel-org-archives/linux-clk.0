Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD437EFF1;
	Tue, 23 Jun 2026 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782222992; cv=none; b=orVXM5W5uNjGbpDkI6DfDyNEkX/lX2N6enGAi74yaE8M5PXGYcqtqI5sb0SAfirJ+bwS9QULOyh3BCx5RWGh1/rCNRScbKqVpmehOEFnYbyclw3c/8R8mgIRSBNL25KoSK8WZXXosLl4X57YWge82An7Gt2oPkHRXIk2gGO/NDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782222992; c=relaxed/simple;
	bh=wR/vCPc90t0pPiifGEXVfQyIHyrFoXe6b0sujnNM1Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCrzFMIVQsM3A4nlGB9vdPrAZbVLsIXH8f9aRVeA1p0HYk8wFcd0YVAUtZPmGywYZx/iGvU1XJ8JyvVz0h95cMEmY2BLry7YZjNUB6j/VPGFcfMpG5xBFpaHgoZllfdRifVtpIFUoZg5Nl3Q1tbGHrrW1kM8HxcYTZ4QSAsSwww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowADXYQWJkDpqyTnYFA--.30817S2;
	Tue, 23 Jun 2026 21:56:25 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: si5351: fail prepare when PLL reset times out
Date: Tue, 23 Jun 2026 21:56:25 +0800
Message-ID: <20260623135625.49610-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADXYQWJkDpqyTnYFA--.30817S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFy7AF17Wr1fGFW3ZF1UJrb_yoW5Gw15pF
	W2gayYvr4Utryq9rsIyFWq9a4Syw1ftayjgw40kay09r15trWjgF4ftFyq93Z0kr95Jw43
	Jr4IyFyrCF1DtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

si5351_clkout_prepare() clears the output powerdown bit and, when
requested, resets the parent PLL before enabling the output. The PLL
reset helper logs when the reset bit does not clear, but returns void,
so prepare still enables the output and reports success.

Make the reset helper return the poll error and propagate it from
.prepare. If the reset fails, restore the output powerdown bit before
returning the error.

Fixes: 5142cbcea324 ("clk: si5351: Wait for bit clear after PLL reset")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/clk/clk-si5351.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index e755db545..4e60261da 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -907,18 +907,18 @@ static int _si5351_clkout_set_disable_state(
 	return 0;
 }
 
-static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
+static int _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
 {
 	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
 	u8 mask = val & SI5351_CLK_PLL_SELECT ? SI5351_PLL_RESET_B :
-						       SI5351_PLL_RESET_A;
+							       SI5351_PLL_RESET_A;
 	unsigned int v;
 	int err;
 
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
-- 
2.50.1 (Apple Git-155)

