Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5B12F393
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279512; cv=none; b=Mvy1qZye+27WbQ1aTpxUg5XjLETHQmILGtZdO96wOUG3BZ6IHFW7jf7hluGhuwRBX+8PTdFtxU0mkJSBN4VrsL+l7WmjHknA2KF6yE4gy1E/Mf+2t01zZaR8r5H7EAmRxwHh0JYHUgOc/KAd+FjtDmS0Rxpi4MRxFPAaoCOAlp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279512; c=relaxed/simple;
	bh=hZ4wWBexGKADSTthGk1PKGyvJ5cBHj6BGIhAnjAUWiE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d/TwwwsFddaqh8asY5nUx0fgMjHYLipsSADIMmxQgDELGimDIyaFd9692A2+wo3B7ERZW69DwpDileVYlVPc5Fvv9+P2b7Ki5ZE636wvni/fV5Prd0irEo9RCgOaJ+ZT4a/ecm6oDGG9AeDzt4ujjYiTH8ysepRKqxtJ7/tPSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id BqyM2C00H0SSLxL06qyMdG; Tue, 16 Apr 2024 16:58:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkFm-008CrG-2F;
	Tue, 16 Apr 2024 16:58:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkGL-00Eb6Y-FY;
	Tue, 16 Apr 2024 16:58:21 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add INTC-EX clock
Date: Tue, 16 Apr 2024 16:58:19 +0200
Message-Id: <e260fd8eac0187c690ac6c62673b29f97e2ad5a4.1713279470.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clock used by the Interrupt Controller for External
Devices (INTC-EX) aka IRQC on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index b9ecf909120924c5..079b55b30b23bd50 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -184,6 +184,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("i2c1",		519,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c2",		520,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("i2c3",		521,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("irqc",		611,	R8A779H0_CLK_CL16M),
 	DEF_MOD("msi0",		618,	R8A779H0_CLK_MSO),
 	DEF_MOD("msi1",		619,	R8A779H0_CLK_MSO),
 	DEF_MOD("msi2",		620,	R8A779H0_CLK_MSO),
-- 
2.34.1

