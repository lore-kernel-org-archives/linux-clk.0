Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69616C85F
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649048; cv=none; b=AYtNWO2fUIM07Tf/mRqyyMdEtHuX9hKIfeh36AjUac6xfIJ8eR5ygIDBKF+/3IbvEUrsh8/wFdSfCQFaHUkTAxnCREpYcny+/EIt8QKgt/tDo9u+J9jfK4vQUTkuk1tAfrmrMM9Hhkwdmhg1qYn1qfbr3nMZycg4MX+J0xUj1ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649048; c=relaxed/simple;
	bh=2M8FpqNIfNn9DrciS1yaH5u7m71jg+Z/8C0CTidtaJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZM7ZdTw34agwbccW6wORYykX4CGDKah2BKR1pEi8l5lJAvu5zPZbEJlJyasorokhOfJsa5fbgrIT9aLppP6hMZ0gUj5+9yOl5GJtgQZbVZlyOZMu/TROPI7Rzkv7b6qq3oapuhG6Y+iGF8aLMup4CFvEcgcLiBO678ZugVhfkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by xavier.telenet-ops.be with bizsmtp
	id qbqd2C0011wvoRx01bqd6Q; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAy-Cs;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020iM-S9;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 12/15] clk: renesas: r8a779h0: Model PLL1/2/3/4/6 as fractional PLLs
Date: Mon, 22 Jul 2024 13:50:32 +0200
Message-Id: <3beac7c44534ed153ce7cea5c31f4b0bb7b16ab0.1721648548.git.geert+renesas@glider.be>
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

Currently, all PLLs are modelled as fixed divider clocks, based on the
state of the mode pins.  However, the boot loader stack may have changed
the actual PLL configuration from the default, leading to incorrect
clock frequencies.

Describe PLL1 as a fixed fractional PLL instead, and PLL2, PLL3, PLL4,
and PLL6 as variable fractional PLLs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index ae21e442a7a26d6e..389d4054a514e00d 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -70,12 +70,12 @@ static const struct cpg_core_clk r8a779h0_core_clks[] __initconst = {
 
 	/* Internal Core Clocks */
 	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN,	CLK_EXTAL),
-	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1,	CLK_MAIN),
-	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2,	CLK_MAIN),
-	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3,	CLK_MAIN),
-	DEF_BASE(".pll4", CLK_PLL4,	CLK_TYPE_GEN4_PLL4,	CLK_MAIN),
+	DEF_GEN4_PLL_F8_25(".pll1", 1,	CLK_PLL1,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll2", 2,	CLK_PLL2,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll3", 3,	CLK_PLL3,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll4", 4,	CLK_PLL4,		CLK_MAIN),
 	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5,	CLK_MAIN),
-	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6,	CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll6", 6,	CLK_PLL6,		CLK_MAIN),
 
 	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
-- 
2.34.1

