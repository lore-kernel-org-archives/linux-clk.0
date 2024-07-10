Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EE192B82
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617060; cv=none; b=J9cReBXIabZts9O3ZOBIuKoogZlPisGimNLXZSWujR1KYQFRUzvJWLodHbVeo1D7Zr2rDNDHSWZK9yjLR3hXqb9d3EvfRId1PIXRj7gOkhqU8aQDHmM3S/0K8tnAldmw+Aw4NotomiSYk7PccZ5SAc/Fi5GvNiTCP+uwCUpmw6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617060; c=relaxed/simple;
	bh=cwCnnXG3OV/CZp7cxE1zFI9qdOerFoSHT5IZHay8uvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JkI4wGofAURx2HBMPBaRJx7mZkBQXx31wpuBNTrK0MExRsYwkeb3CRiUdqIA3PZ4vjZPGDajFZ2T7YvQ/6Bp2wvommq0FQCyuhqArQUtZmtIfpKmGGwOtd4U3A4F2Jp9jdazc2tYrBKMcyyU42xwVpeDtyyez7AhAhQMIS6ntYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by andre.telenet-ops.be with bizsmtp
	id lpAp2C00H4znMfS01pApt8; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5f-001cT2-PB;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQBd-Bq;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/14] clk: renesas: rcar-gen4: Removed unused SSMODE_* definitions
Date: Wed, 10 Jul 2024 15:10:35 +0200
Message-Id: <778a2ce4e538bcc95a79841ddbd9713d5fc99b46.1720616233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720616233.git.geert+renesas@glider.be>
References: <cover.1720616233.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All SSMODE operations are done using CPG_PLLxCR0_SSMODE*.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 77a4bb3e17f34848..72c740f18ac9b370 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -53,10 +53,6 @@ static u32 cpg_mode __initdata;
 #define CPG_PLLxCR0_SSFREQ	GENMASK(14, 8)	/* SSCG Modulation Frequency */
 #define CPG_PLLxCR0_SSDEPT	GENMASK(6, 0)	/* SSCG Modulation Depth */
 
-#define SSMODE_FM		BIT(2)	/* Fractional Multiplication */
-#define SSMODE_DITHER		BIT(1)	/* Frequency Dithering */
-#define SSMODE_CENTER		BIT(0)	/* Center (vs. Down) Spread Dithering */
-
 /* PLL Clocks */
 struct cpg_pll_clk {
 	struct clk_hw hw;
-- 
2.34.1

