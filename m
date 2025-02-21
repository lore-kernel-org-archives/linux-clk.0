Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ADE20102D
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127499; cv=none; b=RXG7GfLFoC9/u2cbuq2PbhlYLXizz5AnPYkGvxpd5MGd6kubHdQzizTFEBJEjEk/H9UZSP8tO5ko/hT0z9cxD1DyBEfiXe2NvRf9U2lZhhRGP/3iCeUkzNgV8BkzwxdoVMDE2kO5VdBnJfgnnEmSZ9GEwyopZaIzNI5chitrY+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127499; c=relaxed/simple;
	bh=j/3PdtzWpWzBm2J9MQh8FH2EGJEGksBmZ1DN/D/ISNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KL11ueQkmalkTBtOlyuSH1BnGFh1QhL1oP3cYbMZ+cNnJneBoGDHSniKBe3wKe1FJ3SXQQORXEbhmqqs4WxkkfLGghTZdZjcv97wrbwHdiZynMrqrWJJBUwwffhD95Mr5Bz1ULDeSQNE4pM9v75VWgSbnkgsCCUW5s+ZZt2YIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by baptiste.telenet-ops.be with cmsmtp
	id G8kp2E0070y8aK5018kp1P; Fri, 21 Feb 2025 09:44:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOe4-0000000BKsb-2yMc;
	Fri, 21 Feb 2025 09:44:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOeP-0000000E5K1-0W1i;
	Fri, 21 Feb 2025 09:44:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] clk: renesas: cpg-mssr: Remove obsolete nullify check
Date: Fri, 21 Feb 2025 09:44:45 +0100
Message-ID: <59ef3eccde0b0b63626480f27e77d5c68948ca98.1740126560.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740126560.git.geert+renesas@glider.be>
References: <cover.1740126560.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All core clock nullify users and helpers were removed in commit
b1dec4e78599a2ce ("clk: renesas: rcar-gen3: Disable R-Car H3 ES1.*"),
but the CPG/MSSR driver still checks for nullified core clocks.
Remove the obsolete check.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index bf85501709f03b91..da021ee446ec8120 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -338,11 +338,6 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	WARN_DEBUG(id >= priv->num_core_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
-	if (!core->name) {
-		/* Skip NULLified clock */
-		return;
-	}
-
 	switch (core->type) {
 	case CLK_TYPE_IN:
 		clk = of_clk_get_by_name(priv->np, core->name);
-- 
2.43.0

