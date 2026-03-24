Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8AA3C7E0A;
	Tue, 24 Mar 2026 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393084; cv=none; b=SGNre0FUErDkLNpPw6mjULxZX80z+3HWRnR7clZkPSnF7RauO0j3uBewQk/1yL4pL8M+uIQY6i/dOkfjrJprjXEyakyw84LwZ2khuW/nlIeboAYWbCiEZiVLILzs2SY1ovRWoWn6HIvYrQvaKPnNYawfyLzQcJ50q1fV6a81ctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393084; c=relaxed/simple;
	bh=kDkMpF4f/zShZoQyS2bVy28n8MEDtIPPndBchULuPlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJed7pHPHyr61+QgkKlzwsmRbgU1Pa/A70oTY/QhooczLH9htM+CimFtkOfTp5A3fCkdSg7mqaiAe5WNB+zDkzhhbBTmWIU0FXX3i0MvqH2JdCjQz5eqS3qas87eLIi/EXxdeaDCBNqix0xLr1xko+rMgM1q37DrX9F/5uU4TF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Ew6y+YbdQC+GBjNUvfcnNA==
X-CSE-MsgGUID: fmLzuA7PQN2jb+9HdRWPSw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2026 07:52:59 +0900
Received: from mind-2s.example.org (unknown [10.24.0.35])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 48D2E400B54B;
	Wed, 25 Mar 2026 07:52:55 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}
Date: Tue, 24 Mar 2026 22:52:35 +0000
Message-ID: <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com>
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 watchdogs.

As it turns out, it only makes sense for Linux to have access to
WDT1.

Remove the clock and reset entries for WDT{0,2,3} to prevent
interfering with the CM33 core.

This change is harmless as only WDT1 is currently used in Linux,
there are no users for the WDT{0,2,3} IPs.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 549c882f9a18..2ff2935aeb0d 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -273,22 +273,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(11, BIT(15))),
 	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10,
 						BUS_MSTOP(12, BIT(0))),
-	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11,
-						BUS_MSTOP(3, BIT(10))),
-	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12,
-						BUS_MSTOP(3, BIT(10))),
 	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
 						BUS_MSTOP(1, BIT(0))),
 	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14,
 						BUS_MSTOP(1, BIT(0))),
-	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15,
-						BUS_MSTOP(5, BIT(12))),
-	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16,
-						BUS_MSTOP(5, BIT(12))),
-	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17,
-						BUS_MSTOP(5, BIT(13))),
-	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
-						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("rtc_0_clk_rtc",		CLK_PLLCM33_DIV16, 5, 3, 2, 19,
 						BUS_MSTOP(3, BIT(11) | BIT(12))),
 	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
@@ -571,10 +559,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(7, 2, 3, 3),		/* GTM_5_PRESETZ */
 	DEF_RST(7, 3, 3, 4),		/* GTM_6_PRESETZ */
 	DEF_RST(7, 4, 3, 5),		/* GTM_7_PRESETZ */
-	DEF_RST(7, 5, 3, 6),		/* WDT_0_RESET */
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
-	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
-	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
 	DEF_RST(8, 1, 3, 18),		/* RSCI0_PRESETN */
 	DEF_RST(8, 2, 3, 19),		/* RSCI0_TRESETN */
 	DEF_RST(8, 3, 3, 20),		/* RSCI1_PRESETN */
-- 
2.43.0

