Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9A524CF
	for <linux-clk@vger.kernel.org>; Wed, 14 Feb 2024 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915747; cv=none; b=rnF+e73X00ShDcsnUd2CXs0GNv8mg/ivu0nedAydg/DMjzYlKaOWwY+4ljrp4FDdLFgl2HygciHoWMRAxBmF3alAUF+1X2Xkg98TcKAR6ETOmsBbR4y7V+3hyt1Q30RLhwy/K0WqQ4eOCfWXD6jJLjaKgvlRlCm+IGkR1Kw5c0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915747; c=relaxed/simple;
	bh=d9xeI5LNTXjT9kpWeASsdMiGKm8rnK3nzCytDCXPzFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uGO0/1P2acO8IscppxKLCY9VgSzsKoB9j5XjdP6/QqA5TwD3kvo2g9MiMg17ybYh4MA2g6GMhkbtrqoBOVR8QxVi4mFkzDir4FT2VH5uiRzSB1TAi6rgcNYuir3FBjHu2a9wLVceUpmV0OUx6iwXUKUe19hB4F/vxRriWfZOwrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by baptiste.telenet-ops.be with bizsmtp
	id n12H2B00J0LVNSS0112HG3; Wed, 14 Feb 2024 14:02:17 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raEtu-000d4d-IU;
	Wed, 14 Feb 2024 14:02:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raEu1-00Gpad-7G;
	Wed, 14 Feb 2024 14:02:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add SYS-DMAC clocks
Date: Wed, 14 Feb 2024 14:02:16 +0100
Message-Id: <0285ef5d0c0c9d232e196559c9130ab46733d7f7.1707915706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clocks used by the Direct Memory Access Controllers for
System (SYS-DMAC) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

Changes compared to the BSP:
  - Rename "sydm[01]" to "sydm[12]" to match documentation.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index b95f1e5e6d470a0c..92359306dc0df544 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -185,6 +185,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),
+	DEF_MOD("sydm1",	709,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("sydm2",	710,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
-- 
2.34.1

