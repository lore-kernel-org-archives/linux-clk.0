Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F571288B5
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649046; cv=none; b=mTcndHnWLRx7J81r9SQ+k4IKUNwPwvkusBSB8oKa58/XCZGEdcykjG5nDQxR0udqhW55Jm40d/uDF/JzlwzuNES8jkgOcBDPUc/bu7QjI9auBqQhlczhfb/OTBEu3+4BgkyLyLxPZXbBOhTPfDNvc+2idG5HoxnQW2OVQgpAmlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649046; c=relaxed/simple;
	bh=z17gZ01wDDMdBg4K87TjRj6f7/4kfXUvn2XGiqCD1QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uwLJtxGnOEV4pTtrfHkZtnzW+qkU0n7AJ2kWqEjQJ97BT6KW91PijaVe+xSzGqvLQxDbSB4VFr6MaGnmP7XuuBloTWDPNj3SbAQqWSVSMP4a4Rda0OWTclwNDcu1DSWvDNhdPGX6TS616R/O8k0oBCp4TAehs2fhQrt+WlBAgh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by xavier.telenet-ops.be with bizsmtp
	id qbqd2C0021wvoRx01bqd6R; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zB3-E8;
	Mon, 22 Jul 2024 13:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020iS-Tf;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 13/15] clk: renesas: rcar-gen4: Remove unused variable PLL2 clock type
Date: Mon, 22 Jul 2024 13:50:33 +0200
Message-Id: <8e5564958002351f29435f63de1304fb3b51a725.1721648548.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721648548.git.geert+renesas@glider.be>
References: <cover.1721648548.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable PLL2 clock type was superseded by the more generic
variable fractional 8.25 PLL clock type, and its sole user was converted.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 9 ---------
 drivers/clk/renesas/rcar-gen4-cpg.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index d3db602d7c5ec617..2a0f520d56b5aa96 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -440,15 +440,6 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll1_div;
 		break;
 
-	case CLK_TYPE_GEN4_PLL2_VAR:
-		/*
-		 * PLL2 is implemented as a custom clock, to change the
-		 * multiplier when cpufreq changes between normal and boost
-		 * modes.
-		 */
-		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
-					    base, 2, &cpg_pll_v8_25_clk_ops);
-
 	case CLK_TYPE_GEN4_PLL2:
 		mult = cpg_pll_config->pll2_mult;
 		div = cpg_pll_config->pll2_div;
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 80a455e62cc1321e..2dadacacf3f911e2 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -13,7 +13,6 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
 	CLK_TYPE_GEN4_PLL1,
 	CLK_TYPE_GEN4_PLL2,
-	CLK_TYPE_GEN4_PLL2_VAR,
 	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
 	CLK_TYPE_GEN4_PLL3,
 	CLK_TYPE_GEN4_PLL4,
-- 
2.34.1

