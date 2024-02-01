Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAED15D5B5
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790127; cv=none; b=tGgCMpKIbcMZJgM3c67aNwIup47Ft7xd2vgSMYKKbrNuUjLnvKbrxaxmqyYMVZAIGzdxmWtpGFfzA8IO7hUBYJ+2gSzZoiRGtYbmUEjTo6p2gMJxD7P9aQoyvpaFJv/zj74M8iaHL6yAtp5igbgZegIHpaDLCLkk5NkLiJ3oucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790127; c=relaxed/simple;
	bh=E59gvsiaDeWyRIZv9XVTeh3SEuFP6dWv2HYQRTt7UEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MW26OINn7S4+FPpLLmy5ZtiFfoRntAgyYIgdevPH3bsWgZd1B8QJGB7ffuPV7VqEzdiK8vhxH/Z4d3Bg/kA9fHRVfrwY9E2TTQ1sUaRLAtP3wUxTyhZCP1rd7kcJ6k4h9bvOMvGu1CAh0Y+x/VV4VE9CM5lr4Q7X2MVlVxZz1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by michel.telenet-ops.be with bizsmtp
	id hoMw2B00D4efzLr06oMwwP; Thu, 01 Feb 2024 13:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW3z-00Guz3-KW;
	Thu, 01 Feb 2024 13:21:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW4q-00ARtC-Jh;
	Thu, 01 Feb 2024 13:21:56 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add watchdog clock
Date: Thu,  1 Feb 2024 13:21:55 +0100
Message-Id: <f1dbf0f3f484015f2e629d78b746cf377d6f6746.1706790015.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clock used by the RCLK Watchdog Timer on the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 219941047291d34d..322db567d5f889d6 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -177,6 +177,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif3",	517,	R8A779H0_CLK_SASYNCPERD1),
+	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
-- 
2.34.1

