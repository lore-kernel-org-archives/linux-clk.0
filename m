Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14C192490
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617054; cv=none; b=E+A5psNpxPf4o0oOg70W5q7/xeNZFbJ1TQO+fN+28nmU/LIBmc9Gi7AvYjf2ueK46kHbXZoAa7XDYkSTbqFgoMAdz8kaDG3uXVE7LIZN4OPDlqXU9P9wHzC3s9BJtOfs9VRjHfnv3dMh2tITvUoFNavyT9qzB+4vCUI7E5yCwFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617054; c=relaxed/simple;
	bh=2zaL63BasDX6Cc1M1ENcL5Tg9TJHWj4bAbNE170bn+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I70XSrOF3jvIrSxUWMc5LrbzSVyNY3FrH/FCZ7WkmncG8dQXWMRSYTKta+n1C+HDoueAZizZxiXVyDlm1287remZT8Hc+lTH3EvtZnHh9rAInovcej9JFQ3ZyN/Se6xlmK5J7zi2j8e8LYZKnudf6RhzP96bGj8yUjdM8s53uSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by xavier.telenet-ops.be with bizsmtp
	id lpAp2C00P4znMfS01pApdy; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5g-001cTb-0j;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQCE-Is;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/14] clk: renesas: r8a779a0: Use defines for PLL control registers
Date: Wed, 10 Jul 2024 15:10:43 +0200
Message-Id: <baff62509ec185713380c2f306ae37061b5a467a.1720616233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720616233.git.geert+renesas@glider.be>
References: <cover.1720616233.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add symbolic definitions for the various PLL control registers.
Replace hardcoded register offsets by the new definitions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 291e08ae7321670c..caa7e0ff2ed3efdb 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -61,6 +61,11 @@ enum clk_ids {
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
+#define CPG_PLL20CR	0x0834	/* PLL20 Control Register */
+#define CPG_PLL21CR	0x0838	/* PLL21 Control Register */
+#define CPG_PLL30CR	0x083c	/* PLL30 Control Register */
+#define CPG_PLL31CR	0x0840	/* PLL31 Control Register */
+
 static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",  CLK_EXTAL),
@@ -70,10 +75,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
 	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
 	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5, CLK_MAIN),
-	DEF_PLL(".pll20", CLK_PLL20,	0x0834),
-	DEF_PLL(".pll21", CLK_PLL21,	0x0838),
-	DEF_PLL(".pll30", CLK_PLL30,	0x083c),
-	DEF_PLL(".pll31", CLK_PLL31,	0x0840),
+	DEF_PLL(".pll20", CLK_PLL20,	CPG_PLL20CR),
+	DEF_PLL(".pll21", CLK_PLL21,	CPG_PLL21CR),
+	DEF_PLL(".pll30", CLK_PLL30,	CPG_PLL30CR),
+	DEF_PLL(".pll31", CLK_PLL31,	CPG_PLL31CR),
 
 	DEF_FIXED(".pll1_div2",		CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll20_div2",	CLK_PLL20_DIV2,	CLK_PLL20,	2, 1),
-- 
2.34.1

