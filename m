Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52BC6216B
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790302; cv=none; b=eytUtUzrOyll4i1u6KMm1WUqoMfrBBp6keQhyUHS6h3lZfv0EFrJ2D8RcXBpLO8GwjEuTz6fFvT3+sxKYFBWXMAwm8SD4u8Rd3sNL07CltRzBAKOII879KVF9EVfUDwRBrylAvubU1oeru/lbX4bCdPC7y1HUCBeJSl6bB3hg6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790302; c=relaxed/simple;
	bh=4B22GN08OXnVQ/Xxe7b+5vZHFWexoxE556bJQ6gwhgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HqV67Tpg1HcXGXRvVoihEA6Ojw91n5p4vUQqry0otXwj1qFFQAGYC8CKR3TrO1FVZiJLLXFWNLz50zxyfqpiXtDc3fLXlBM4eJqX4E4cI+tlcjDme35HkdSSsGwg5zEbNPgGLI0ykRlOuehiYI957M5dVtJsNyvEL9HqBjetb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by laurent.telenet-ops.be with bizsmtp
	id hoQy2B00Y4efzLr01oQy7k; Thu, 01 Feb 2024 13:24:59 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW6v-00Guz8-Ng;
	Thu, 01 Feb 2024 13:24:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW7m-00ARwE-MJ;
	Thu, 01 Feb 2024 13:24:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add I2C clocks
Date: Thu,  1 Feb 2024 13:24:56 +0100
Message-Id: <7a76dadbce24c81dd2bee68765a0b41beca2d565.1706790236.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clocks used by the I2C Bus Interfaces on the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 322db567d5f889d6..70d104393594091c 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -177,6 +177,10 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif3",	517,	R8A779H0_CLK_SASYNCPERD1),
+	DEF_MOD("i2c0",		518,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("i2c1",		519,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
-- 
2.34.1

