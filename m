Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836C5B5C5
	for <linux-clk@vger.kernel.org>; Sun, 11 Feb 2024 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661389; cv=none; b=Ezc6XKipy2xuQMOHlWxvMWmXQwJ3PKuFmpiRjsyJHMH1TBPAt4q9lZtuDQ5GKmC2Jn2OUEfGuKgk2hSKBcyPZ/3PsS3ajKZ+ry1qiGCfPjf+fOmDVhSTgyj+gj+fXY4JPkwrbunX03PqHnVAGTDo6JvRpJFTqV83CudvkNttMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661389; c=relaxed/simple;
	bh=nrxTaYyayeEAbX7cZFDXgV3HkCaKcBBZ3cXv2UpBXOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uw8+fiNqB1g56KEqTyJTMgqdRjlYIWvwd6W4UJ4EwPHq31qyA7CDbNJWldcz2DW/1v14NHynt2rwYG3XK3q5N1r+oAZKlOBkfVi0/kES+7AamZlKCFo5ZHauuuuIJythhXofjicIKhmiNNn0lZNbGZA7BUh9N4ImELUlLa1G5tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TXqYv2lstz4x0WZ
	for <linux-clk@vger.kernel.org>; Sun, 11 Feb 2024 15:22:59 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5c16:aeff:e73f:ad67])
	by xavier.telenet-ops.be with bizsmtp
	id lqNs2B003493aJM01qNs30; Sun, 11 Feb 2024 15:22:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAjH-000QhI-2k;
	Sun, 11 Feb 2024 15:22:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAjL-006Wof-Vw;
	Sun, 11 Feb 2024 15:22:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779h0: Add EtherAVB clocks
Date: Sun, 11 Feb 2024 15:22:46 +0100
Message-Id: <a5b4252d9822ded3fd523bc35417306cae2ec2bd.1707661303.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clocks used by the Ethernet AVB (EtherAVB-IF) blocks on
the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.9.

Changes compared to the BSP:
  - Rename "avbN-rgmiiN" to "avbN:rgmiiN",
  - Drop blank line.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 70d104393594091c..46202e367d713d41 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -173,6 +173,9 @@ static const struct cpg_core_clk r8a779h0_core_clks[] = {
 };
 
 static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
+	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
-- 
2.34.1

