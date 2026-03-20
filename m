Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879438AC63
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003799; cv=none; b=NHePhxESBnPz7OIVqukiIey8Jit6p1Rl9OdS4LaqwnCSgzdsIplRp3cm/wJ9zebWrsR9CHPlJkMbflJUr6K7sNCaO0UFsOYyB888fvaL8RMecW2kvw2AYWfyz/fh5rgnuLU6g2wJdfBTVkuf9NIAs5z9guApnualfPNieWc3vD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003799; c=relaxed/simple;
	bh=PqdtBxyERndEosPDHbmI+GUBTlW7xb/TJgdAmt5315U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuY7jjAUea0u1PGHlgA7gwQfZl+/jCahHR/E10QHsRZ5iT3yKI8H5X1PSIqnV3HgfvYiY5ywbeumN2DkE5uMEbJmTz2e5c/988Qo6x38EHpFSIiBJCE5d6P945GkE9oJ/dZRY+qFOlOiua/Y9bfzbEkYUMdwHbIVuXjIJ+rQx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5bgaBFX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5bgaBFX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b49819938so244402f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003795; x=1774608595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKbe+TyX+B1VS7SJjwxdTR+wYHiyWXqHq9Z2tzEU/jk=;
        b=i5bgaBFXMp2eOUgrOECULRD2bDP5PqXyy5SD+BvHjCIq+XRPiz/htJHvzAO15gqslF
         77RHptLZedmsFCgiNdzx1QZ8y/+5cRWs+K2uP+cC30p0vq/hP/fqWYkaK/troFfKhGvQ
         nw2fEWu8LSG545vHqMycnfF3QhJkn9Gw5IFIDMEGLLH3H/95CnV1EGm4AdIL/OV743vh
         b+uYWvu71rNT2TK1xVTXw/sxrSykd2usPlVEsVdvAxeO3wlwLh9se4Qj0EUALS6iK+BM
         K+NwtzutluRfH/649VgEbj46GY+FrZS8NGBfoLpcxQgK+vP1Wdb1RkFimhytAufkXIp9
         KRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003795; x=1774608595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZKbe+TyX+B1VS7SJjwxdTR+wYHiyWXqHq9Z2tzEU/jk=;
        b=aWMaeT68GYdwbG7Rep/Hr01id5rH5M+o+W6bP8Z8pzb74mVuHtpAS5ZVA5X620xhYe
         YSMC8eka+dadGHtB7fELmBZn/1dYRshFPNazchO7PbbbdMhRhOZ8z9CgHN5GvbkcoELr
         tA/Ar2J5tn230IXfIMtq7BbceC9ELppGBCPxbJPKkYzjRA9SVZ14XiuVwI/FAWnt186D
         no15BZWzVmJv+21TNELc0zj0BnYK/Mo6CUZLpxVuK9GjaQ4S/zclfa8shgcyKs3btYKz
         Agk6UHtPxcXpsFpO3c25q+uZQTV4Oeo9fkNVjL9htwEeHEpE0rEiPqCwFWOE7qSUji0Z
         tTNw==
X-Forwarded-Encrypted: i=1; AJvYcCXmqq39GNyIkVYlyhYaFcgYYuBO3P8DOrBj1FcqdlcqC6ngVVnVDT03FqbM6nJt7EhTyrWdmPO8Nwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHm6L59ZQn8ylVEI7UMyyfAvvl4S2tl601j5+t00y2F3qK6XM
	dlrg7+fyqy0IfInEjPNZZoxBrVrUcjUFQGr/RdQRfuKzzqceBUjcbkwO
X-Gm-Gg: ATEYQzz03NcXvdC4hPuKdM7koZHspiFdoc6aRSv4hYn7sqguOmZh/kClIWyNasVQsZ4
	d0bgyeMRGP+1yNdmVWq0a8iCg59kbxomKr3PJjBQMCzGS8SnnbaCFuEgH9XYzOweHEsDadL6PuM
	1gtCBX5rykACCyD4jkZPVxxK+LbU0h2OLZDWvTmcHUJ6p9J8ZkyPqYtj5R4W1fETC7gR/Y/N7U0
	xibGuWBxVlggwV5xrdAUP+rbsTfwRB1GmFlhu30XDL3y5jPCYFfvKDlD5erVGscSmYNmfOYP0u7
	wAlPGBHVLGLoq5TBEy8GQtWwEayD+sQbBm++F07SpfBId0O/FDspxp1+T005id2oKwSqIrmERVY
	R3CFp7EZytX2XaJrIWAe2KTRy9zMnu16MqamcIHiKRKEXDT7dQJBtQSEcMiAtfPJ2tRQoRLOU6c
	f51m/x0IXioZgJTm6zKY6DWSTZl4CvF6E=
X-Received: by 2002:a5d:588f:0:b0:439:b3a3:7239 with SMTP id ffacd0b85a97d-43b6423fb3dmr4617157f8f.5.1774003794609;
        Fri, 20 Mar 2026 03:49:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 04/10] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
Date: Fri, 20 Mar 2026 10:49:38 +0000
Message-ID: <20260320104950.42220-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
decouples the logic for setting module stop state on disabled clocks from
the iteration loop, allowing it to be reused during resume to re-enable
critical clocks.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Collected tag
v6:
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f9e4af7f49d0..b68b0312f0e3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1586,6 +1586,20 @@ static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32
 	return NULL;
 }
 
+static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
+					      struct mod_clock *clk)
+{
+	/*
+	 * Out of reset all modules are enabled. Set module state
+	 * in case associated clocks are disabled at probe. Otherwise
+	 * module is in invalid HW state.
+	 */
+	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
+		if (!rzg2l_mod_clock_is_enabled(&clk->hw))
+			rzg2l_mod_clock_module_set_state(clk, true);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -1595,15 +1609,7 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 		if (!clk->mstop)
 			continue;
 
-		/*
-		 * Out of reset all modules are enabled. Set module state
-		 * in case associated clocks are disabled at probe. Otherwise
-		 * module is in invalid HW state.
-		 */
-		scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
-			if (!rzg2l_mod_clock_is_enabled(&clk->hw))
-				rzg2l_mod_clock_module_set_state(clk, true);
-		}
+		rzg2l_mod_clock_init_mstop_helper(priv, clk);
 	}
 }
 
-- 
2.43.0

