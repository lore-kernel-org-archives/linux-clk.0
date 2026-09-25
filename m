Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77643D9DDF;
	Fri, 25 Sep 2026 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326586; cv=none; b=GSbqt7DTpCa+fOqnsX/RjSapPd+s2RHrhwj66Hmhhzr1Z0txct4c50vaV6/Trq8hYBlSqzy2LsArMIY6W0NEnran0dqAoe+dtSpOSK+dMC8iPt5AeYx3lLql5ZSPlq+qTMQMSDLvFrklH7dQ2MQTT9B9OrM3HAMrM31prnrs3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326586; c=relaxed/simple;
	bh=zlISlymVjfAiFGaKMJcWlDXI38cN69NpnzbCz/F4ytM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oiQDDHUkYZOODLxMhGsvtUSjzj4+O5fMoHnud2mIrxRCg8V0elESbhUNcNaCFjPFHA715R9g/8UB2U5JYhO9xGXS5nCjONlAs8kNKW8nzu+xbhuntlaO7wA886IAMGy7Ld5d4x6DzGz3z1rr5RJi7pPM1m9AO0d/D5blWq8xnjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBED31F000FF;
	Fri, 25 Sep 2026 08:56:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a78000: Add SGASYNCD8_PERW_BUS
Date: Fri, 25 Sep 2026 10:56:14 +0200
Message-ID: <8c4912ada9c3d6776ae64d3896ffc1f45a98c51a.1790326477.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Add support for the SGASYNCD8_PERW_BUS clock, which is a fixed 133 MHz
clock serving as the functional clock parent for I2C cores 1 to 8.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v7.4.

 drivers/clk/renesas/r8a78000-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 7946f9d0b423def1..b8024e76743ea53d 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -23,12 +23,14 @@ struct clk_map {
 
 enum fixed_clk {
 	FIXED_CLK_66M,
+	FIXED_CLK_133M,
 	FIXED_CLK_266M,
 	NUM_FIXED_CLKS
 };
 
 static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
 	[FIXED_CLK_66M] = 66666000,
+	[FIXED_CLK_133M] = 133330000,
 	[FIXED_CLK_266M] = 266660000,
 };
 
@@ -140,6 +142,7 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
 
 static const struct clk_map r8a78000_cpg_default[] = {
 	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
+	{ R8A78000_CPG_SGASYNCD8_PERW_BUS,	FIXED_CLK(133M) },
 	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
 	{ -1 }
 };
-- 
2.43.0

