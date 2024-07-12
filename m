Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69211171E40
	for <linux-clk@vger.kernel.org>; Fri, 12 Jul 2024 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794417; cv=none; b=tLDKbPzbXXi3KTl+ccf5UTOVvqDueRqVMWvNFMe1ycukly7uwkTqYk76ON1Z3kbfkGhl9+zvuGbnTPKRqAOLsoMS/8Dato7R4fo1sFsrtCo8SHjkzsArtfm+4k1g3pXH3oEx5JMT5DWc7o6/bDNBKBPFjzooZURJhFphwXT7jcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794417; c=relaxed/simple;
	bh=Ew9ul4QX+Ed1bCKg/2+jzoS3pMNlMsXQNVLL4SjjyMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OF77iszusdDYbu5Wmoxd/wkhV1GRGW07ifDBGGrcFIaY4CXEGSKQ0apQqr3DGKgwfV+FZKnFFlZ4WC7I19ucOdHZrKF8souu0mcWsLIVbAF/xq7e/+6mpruOB+Ak5gcjMJih1kajHD5LVCkhmS6uece2VoQHwitDZeSbDnX/75E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9b6b:6da0:997b:7165])
	by baptiste.telenet-ops.be with bizsmtp
	id meSn2C00446XLxg01eSnYf; Fri, 12 Jul 2024 16:26:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEG-001qJ4-7j;
	Fri, 12 Jul 2024 16:26:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEU-000W9a-SO;
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
Subject: [PATCH 2/4] clk: renesas: r8a779f0: cpg_pll_configs should be __initconst
Date: Fri, 12 Jul 2024 16:26:44 +0200
Message-Id: <2261fc8291099445e1b319812dfd4f79c90296d2.1720794214.git.geert+renesas@glider.be>
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

Fixes: 24aaff6a6ce4c4de ("clk: renesas: cpg-mssr: Add support for R-Car S4-8")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index cc06127406ab5737..0a14f34105d0fadd 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -187,7 +187,7 @@ static const unsigned int r8a779f0_crit_mod_clks[] __initconst = {
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
 
-static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
+static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
 	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
 	{ 1,		200,	1,	150,	1,	200,	1,	0,	0,	200,	1,	134,	1,	15,	},
 	{ 1,		160,	1,	120,	1,	160,	1,	0,	0,	160,	1,	106,	1,	19,	},
-- 
2.34.1

