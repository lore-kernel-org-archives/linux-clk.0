Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E27B396B8C;
	Wed, 21 Jan 2026 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993398; cv=none; b=qMbzlPT5Lh5EI7YfWE1oUeJVK7pOGvHgt/Tkx9peuNiw5rajqn7GqBmSOoA46NakiJquD8DUyphNwDumck+sGwpvZHNLviygRpwqw1otNGLHBbhDaHotoYEYD5Tp611MtTwN2SZtIR2JOpNz+Ql0UN5ZtMx0dz5Zcceb4+xLcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993398; c=relaxed/simple;
	bh=99V2KEzM5M/6j9u/iDcwCKzEKyoaom7t9aOwjdEiDzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RiXcHLmL/Q0cmcNvYVtL83oVp4seQeojVm86bD9JuKip6KdN/b+rjx3etep2DefmPIirzgo6YJpUZEliIkkq0WHzQjJCY/cRBA+OsyaB3+8EYD+jSG6FttuiAy2br2tNSykgUevhWitYkzC19cgCw2rEiZ7gTiMPhgTyJ9sIQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFCCC116D0;
	Wed, 21 Jan 2026 11:03:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed, 21 Jan 2026 12:03:11 +0100
Message-ID: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas 9-series PCIe clock generator driver from
SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk-renesas-pcie.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 6650e3440c7492cf..b9bee616afe8d4ef 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -359,7 +359,7 @@ static int rs9_probe(struct i2c_client *client)
 	return ret;
 }
 
-static int __maybe_unused rs9_suspend(struct device *dev)
+static int rs9_suspend(struct device *dev)
 {
 	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
 
@@ -369,7 +369,7 @@ static int __maybe_unused rs9_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rs9_resume(struct device *dev)
+static int rs9_resume(struct device *dev)
 {
 	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
 	int ret;
@@ -415,12 +415,12 @@ static const struct of_device_id clk_rs9_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
 
-static SIMPLE_DEV_PM_OPS(rs9_pm_ops, rs9_suspend, rs9_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rs9_pm_ops, rs9_suspend, rs9_resume);
 
 static struct i2c_driver rs9_driver = {
 	.driver = {
 		.name = "clk-renesas-pcie-9series",
-		.pm	= &rs9_pm_ops,
+		.pm	= pm_sleep_ptr(&rs9_pm_ops),
 		.of_match_table = clk_rs9_of_match,
 	},
 	.probe		= rs9_probe,
-- 
2.43.0

