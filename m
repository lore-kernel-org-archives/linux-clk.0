Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A420102E
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127500; cv=none; b=emhgqMh5VgMPEw5mvgfOhRznLsqlWDRyuxfXuERvJ9zp55qfdu+shghZ3B7aUQcHhi4E9SywFDo6XttwOxRdIW9PxNQ1Zb64xMIjxTY/a1BN4LQSzIOa4IOvG3WjEL0UqERcRe0zpFvRbruH0EIHY8Qplnbo90DcGXV3DnS31RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127500; c=relaxed/simple;
	bh=ErKt/IX3ty7Ak0Cdt/zKYdEi7M2ihahZ7kTQA445DEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkmCuPQ0BANDHAMd3VjLZ8LjTkGyMimrvUBrqZbsgI+pFXyhQX42Xx67T3mYYTxFwvmNyClzkQJuEYFAo+f1niRmao+Uia1nDx9CUMDOpOQ/g3vaNcqlKR5mUPK1oaovy4xIWuUj62fc/iZlDpwaPaMlNqSCnrYS/oOnP/yRu2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by baptiste.telenet-ops.be with cmsmtp
	id G8kp2E0090y8aK5018kp1S; Fri, 21 Feb 2025 09:44:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOe4-0000000BKsg-38xd;
	Fri, 21 Feb 2025 09:44:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOeP-0000000E5K9-0kmb;
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
Subject: [PATCH 3/3] clk: renesas: r7s9210: Distinguish clocks by clock type
Date: Fri, 21 Feb 2025 09:44:47 +0100
Message-ID: <7e61ea78e9919148e73867088ccbc3509364952e.1740126560.git.geert+renesas@glider.be>
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

When registering a clock, its type should be devised from the clock's
type member, not from its id member.
Merge the two checks for the main clock, to improve readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index a85227c248f31cb2..e1812867a6da4ea9 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -170,11 +170,12 @@ static struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
-	switch (core->id) {
-	case CLK_MAIN:
+	switch (core->type) {
+	case CLK_TYPE_RZA_MAIN:
+		r7s9210_update_clk_table(parent, base);
 		break;
 
-	case CLK_PLL:
+	case CLK_TYPE_RZA_PLL:
 		if (cpg_mode)
 			mult = 44;	/* Divider 1 is 1/2 */
 		else
@@ -185,9 +186,6 @@ static struct clk * __init rza2_cpg_clk_register(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (core->id == CLK_MAIN)
-		r7s9210_update_clk_table(parent, base);
-
 	return clk_register_fixed_factor(NULL, core->name,
 					 __clk_get_name(parent), 0, mult, div);
 }
-- 
2.43.0

