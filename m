Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129D018E04C
	for <linux-clk@vger.kernel.org>; Thu,  1 Aug 2024 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519575; cv=none; b=HNlcWPyy3HdBhtf6sim7hV1OYfm4nnlrfU4r+xC0VrH2j1zh78TO9mJHKEJVvIv+kUG4HnSfrfCuSV99J317dugipfhsLrfh4RHhal8RslCVykQEw/RfnD0arX7KKAnrfxYK2/+x5VRJ/4VqzSunzVoPFKbQ2JhMV4VszkrVTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519575; c=relaxed/simple;
	bh=hD9NGKKlejKeSt1pJ9c5vgFtPNhg4g13vqr2KB/HHLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lbfZ9/picF+Q5EWOPx6GDQBiBPx+Vq1rdMIllWFiNDCU7ycx+7rSFxnPVaTPamJaFq11jNAhG3v5Iq78ciamPWvDSibptTn2U3qNrdj4fOeETMBCoOXYXiksPWaa4bmEBqnpRPB9VbogB9pyl9mFCdqAxdJAZKVEyLZ+gvliVmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fff7:d11a:41d8:a195])
	by michel.telenet-ops.be with bizsmtp
	id udfQ2C00B5XJrhx06dfQiN; Thu, 01 Aug 2024 15:39:24 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZW1D-004S6P-WB;
	Thu, 01 Aug 2024 15:39:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZW1c-00HO5x-4L;
	Thu, 01 Aug 2024 15:39:24 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: renesas: r8a779h0: Add CANFD clock
Date: Thu,  1 Aug 2024 15:39:19 +0200
Message-Id: <9bf71bfda338ee5411751174b03b9e870cc818e3.1722519424.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the CANFD module clock on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v6.12.

v2:
  - Drop RFC state now it works.

Changes compared to the BSP:
  - Change clock name from can-fd to canfd0,
  - Change parent clock from CANFD to SASYNCPERD2.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index ef707dce840090ee..e20c048bfa9be142 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -176,6 +176,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
+	DEF_MOD("canfd0",	328,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("csi40",	331,	R8A779H0_CLK_CSI),
 	DEF_MOD("csi41",	400,	R8A779H0_CLK_CSI),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
-- 
2.34.1

