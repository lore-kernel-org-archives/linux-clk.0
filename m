Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6B171675
	for <linux-clk@vger.kernel.org>; Fri, 12 Jul 2024 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794418; cv=none; b=iuU+BlYwhLStaUXzEPmH5hMIODZRVWZ6ioAdSLa4Alz2S2ApgGXyV3kw8VtXZAmDT9xPFwvFnWF3Tv6d84c2Jas8upCSU108OVYj/u1Cin6eRAxmb7rT+SdRWJQkeI1lk1Co4AqyjVNqmz2anWmxakpjnHfa64oWNUuj0BwfjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794418; c=relaxed/simple;
	bh=ZXoSJ2+yCjy+D6I7Iv9XvYmGgnwl1AQE1rdRBMiyQlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FdEmakVvQeAModjaNJrGoQLodxlEqPD5BSz/+sQteU+u0np/MD8nXrpqW74/4lk/0WrBlKmRTZoUBCv+JwCymE1x8mf2f7J1tIBIptCne6EwyCUH/LDzxSS/g2ar/V+MpQTH1c07cFea8CET4oCiKFb7KkrCwUnrhgcUTkManIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9b6b:6da0:997b:7165])
	by xavier.telenet-ops.be with bizsmtp
	id meSn2C00346XLxg01eSnEY; Fri, 12 Jul 2024 16:26:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEG-001qJ1-7I;
	Fri, 12 Jul 2024 16:26:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEU-000W9X-Rc;
	Fri, 12 Jul 2024 16:26:46 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Cong Dang <cong.dang.xn@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] clk: renesas: r8a779a0: cpg_pll_configs should be __initconst
Date: Fri, 12 Jul 2024 16:26:43 +0200
Message-Id: <a9819625329b188c298481402e1c55ac46093518.1720794214.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720794214.git.geert+renesas@glider.be>
References: <cover.1720794214.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpg_pll_configs[] is only used during initialization.  Hence make it
__initconst, so it will be freed later.

Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V3U")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index ff3f85e906fe17e1..d75d01b4c554a9e0 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -253,7 +253,7 @@ static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
-static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
+static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
 	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
 	{ 1,		128,	1,	0,	0,	0,	0,	144,	1,	192,	1,	0,	0,	16,	},
 	{ 1,		106,	1,	0,	0,	0,	0,	120,	1,	160,	1,	0,	0,	19,	},
-- 
2.34.1

