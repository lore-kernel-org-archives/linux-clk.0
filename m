Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D812BE8C
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068676; cv=none; b=Dco7tR6C9zRLhGdVZwlBiuA/LVg9bNOze64WfGReR3Ko+PhNjrDE+/vpykfr7Q5PyhmMSc6jTSbRn7zYWaYI8sXeLSFCflpUhL55KcheC8h/pkF/OfvUokwDPZg+j8HnAVkCyyQor2TCYGFEenjBRFQs3p6BbVsbU/h4NL7IJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068676; c=relaxed/simple;
	bh=bRBCTLEp98wnVwLznUJRCNoPp1mxWI1F+xHRtLnh7FM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVD3QumFsDgY7r22793RAdyfe9z1YXloqoobcggI4FSHOrhEUc2XchcXdgxg8VEE7f3uKRHLeeUNqrXaV7s0GMU+lK8fusdqhNfaz3W97mU2AXmn64KN7TC40C/V93gbM+KCQroR54DrJUrRTUM0teH6ZfrAQlZAY0wKqJugHiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id 6Edu2C0060SSLxL01EduRh; Tue, 02 Apr 2024 16:37:54 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfGQ-00GBit-Q4;
	Tue, 02 Apr 2024 16:37:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfGs-009rSU-4G;
	Tue, 02 Apr 2024 16:37:54 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add timer clocks
Date: Tue,  2 Apr 2024 16:37:52 +0200
Message-Id: <79a66e8ff84378d7f65d5f55cfb01b9b745edd12.1712068639.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thanh Quan <thanh.quan.xn@renesas.com>

Add the module clocks used by Timer (CMT/TMU) blocks on the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.

Changes compared to the BSP:
  - Use TABs instead of spaces.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 4bc35bc912547f07..a7d272285db04490 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -192,7 +192,16 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),
 	DEF_MOD("sydm1",	709,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("sydm2",	710,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("tmu0",		713,	R8A779H0_CLK_SASYNCRT),
+	DEF_MOD("tmu1",		714,	R8A779H0_CLK_SASYNCPERD2),
+	DEF_MOD("tmu2",		715,	R8A779H0_CLK_SASYNCPERD2),
+	DEF_MOD("tmu3",		716,	R8A779H0_CLK_SASYNCPERD2),
+	DEF_MOD("tmu4",		717,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
+	DEF_MOD("cmt0",		910,	R8A779H0_CLK_R),
+	DEF_MOD("cmt1",		911,	R8A779H0_CLK_R),
+	DEF_MOD("cmt2",		912,	R8A779H0_CLK_R),
+	DEF_MOD("cmt3",		913,	R8A779H0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
-- 
2.34.1

