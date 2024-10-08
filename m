Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589E16C854
	for <linux-clk@vger.kernel.org>; Tue,  8 Oct 2024 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728377970; cv=none; b=PYRjR712vaFfq7QEpdelJ3Ap6+GAq4DOC9mAdNuu6SBDCDd84ZHSYNQsGn+VccnuGXQujM6K8UzhBLJJd/NVe38ofqH6dNDVteTiB/1Al+CVZPXfOJ6r69ZRjeIu6Ap41IrnQblDtzmWpjTVKNciT46O25HoQ9nFWkbW80+hZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728377970; c=relaxed/simple;
	bh=24CJ/UOc9KNzJisZZSa4q/pwTaUJlPLKc8ycY+1UsDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U55WRxomEg1X5skjfa+6rBXhMmpyJX1B2MLH6lY5Xv773fiCBexKPoksHfYefzVdjCgUjgHhgyHwlR5J5VvXRMNjN7H3lwuo0RjU/IwETQpEythylS5CXQRsTgere2ch4quC38B5razYBXX7jv4XHG/XsWpWnmvmHcZOvRXMRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:af78:ce2e:2b4b:9f2a])
	by albert.telenet-ops.be with cmsmtp
	id MkzL2D00F0Eqs9l06kzLLs; Tue, 08 Oct 2024 10:59:21 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sy63i-003RXW-0h;
	Tue, 08 Oct 2024 10:59:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sy63s-00D27I-Dk;
	Tue, 08 Oct 2024 10:59:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks
Date: Tue,  8 Oct 2024 10:59:17 +0200
Message-Id: <0d2789cac2bf306145fe0bbf269c2da5942bb68f.1728377724.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Early revisions of the R-Car V4M Series Hardware User’s Manual
contained an incorrect formula for the CPU core clocks:

    ZCnφ = (PLL2VCO x 1/2) x mult/32

Dang-san fixed this by using CLK_PLL2_DIV2 instead of CLK_PLL2 as the
parent clock.

In Rev.0.70 of the documentation, the formula was corrected to:

    ZCnφ = (PLL2VCO x 1/4) x mult/32

As the CPG Block Diagram now shows a separate 1/4 post-divider for PLL2,
the use of CLK_PLL2_DIV2 is a recurring source of confusion.  Hence get
rid of CLK_PLL2_DIV2, and include the proper 1/4 post-divider in the
invocation of the DEF_GEN4_Z() macro, like is done on other R-Car Gen4
(and Gen3) SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.13.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index e20c048bfa9be142..9067e407cbc69f00 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -37,7 +37,6 @@ enum clk_ids {
 	CLK_PLL5,
 	CLK_PLL6,
 	CLK_PLL1_DIV2,
-	CLK_PLL2_DIV2,
 	CLK_PLL3_DIV2,
 	CLK_PLL4_DIV2,
 	CLK_PLL4_DIV5,
@@ -78,7 +77,6 @@ static const struct cpg_core_clk r8a779h0_core_clks[] __initconst = {
 	DEF_GEN4_PLL_V8_25(".pll6", 6,	CLK_PLL6,		CLK_MAIN),
 
 	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
-	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
 	DEF_FIXED(".pll3_div2",	CLK_PLL3_DIV2,	CLK_PLL3,	2, 1),
 	DEF_FIXED(".pll4_div2",	CLK_PLL4_DIV2,	CLK_PLL4,	2, 1),
 	DEF_FIXED(".pll4_div5",	CLK_PLL4_DIV5,	CLK_PLL4,	5, 1),
@@ -101,10 +99,10 @@ static const struct cpg_core_clk r8a779h0_core_clks[] __initconst = {
 	DEF_RATE(".oco",	CLK_OCO,	32768),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("zc0",	R8A779H0_CLK_ZC0,	CLK_TYPE_GEN4_Z,	CLK_PLL2_DIV2,	2, 0),
-	DEF_GEN4_Z("zc1",	R8A779H0_CLK_ZC1,	CLK_TYPE_GEN4_Z,	CLK_PLL2_DIV2,	2, 8),
-	DEF_GEN4_Z("zc2",	R8A779H0_CLK_ZC2,	CLK_TYPE_GEN4_Z,	CLK_PLL2_DIV2,	2, 32),
-	DEF_GEN4_Z("zc3",	R8A779H0_CLK_ZC3,	CLK_TYPE_GEN4_Z,	CLK_PLL2_DIV2,	2, 40),
+	DEF_GEN4_Z("zc0",	R8A779H0_CLK_ZC0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 0),
+	DEF_GEN4_Z("zc1",	R8A779H0_CLK_ZC1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 8),
+	DEF_GEN4_Z("zc2",	R8A779H0_CLK_ZC2,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 32),
+	DEF_GEN4_Z("zc3",	R8A779H0_CLK_ZC3,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 40),
 	DEF_FIXED("s0d2",	R8A779H0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779H0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779H0_CLK_S0D4,	CLK_S0,		4, 1),
-- 
2.34.1

