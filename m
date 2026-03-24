Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE323F074F
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352627; cv=none; b=KIYp+E7HQWqrCDqK6Zy4iqamSg5Eze4qipHODQu+klqg0ySD/mFGqNAetSpd2mwyAQ948e6hyZdpe+xpxktzOY4U1LTOKI2OP0kPaTIRojT+8oRPkKtef1VZU/8EP9sjpgEoHrVKju+nj7th6B4CkZdb/NIFr/Ego/EFTR65qrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352627; c=relaxed/simple;
	bh=H2fEHpybBLkHHbMdo005jZoF83+21eGUWFFuQTrSrhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDbCD7qNKvsjZI7lwP9tTXAUlHCNIiW4CZAA7T5biNdPZQGe5sZX6dohmtU5XvFH0ybNKaN7lbjbDh5+xrsQu/dfebEgej/lE3IaeqiWIfefS7TT6z5VVmSDQiMUyLMtdc/1ZPsp4f+TxQOHjmK3ID1Nr/FgJ2XQ24Sip0WUt5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/otXvN2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/otXvN2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so41180455e9.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352619; x=1774957419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxpLZewpBHQBH30KhBV9xXPz16M7OH2igp4cA1rTclg=;
        b=O/otXvN2YZ/ULA1ZCnHq/ngBHImRn7DaknCszOj0HpJtE0R9XsuZbZp9kE6SZJDCAQ
         nMkS2CCTMBrbXQDXPW+1guB37Q9S4oMjm0pUevgba32hY0ttvG49mwTPNyrZVksg4WGR
         N9tEwkAJqSvN9Bxom6ABB34BI4Uz+pP7BAegwNBlF4jW8vqJfBzn7VY58CKLgx6RPY1k
         Cmlutr2vC7BQGj6BKB25Ut52BN9FW0Ol0y6LhLURPqYYVSQeENWUTxg+fm3HcpjCYRRU
         J6K+HU3866KGQrWYPiDPyQPFHQlhLhgr7eMgQ5swF+HQjhBrMCNX5vBc2yliv3N+loo+
         OHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352619; x=1774957419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZxpLZewpBHQBH30KhBV9xXPz16M7OH2igp4cA1rTclg=;
        b=c5wU1y96+sx2ypL520lRnnqD6vsGSJM9sLblNMqTkZ3QzuIXEqeC6v10ChDc+W5KN7
         XxFEoq8AA16pt+Nk3g3zi2fYdUDKtp2WDrdOM8cLqbfb2M5Q1zvRDo8vAzWFbpX2DWvX
         QLsCGGhFUTdQBIwrAgi9XWQryj54Dt8DyQuImR0ZchjGivvjkZfPnTgsGm+dtPt9fHgr
         g5d0LBjCxlCxR+KzOkGLYS3wUg5up0BjzEP0QrYNMp7fQ7fSqIiSezEIx7FyCR/nxEZD
         VJnF9ZCnev/+CFcMsemXG188wEIcErZwqwrYau7uYfVKjyB+Bef9AgTS7EdJW1D4yMWh
         BggA==
X-Forwarded-Encrypted: i=1; AJvYcCX+hZ1i2GL30WhnzWHBwPJL7NKYOk3ZawhQfWJpswYRNJoWVSPNxgY5bzOXsvEogTLY+XigIg0qddc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywV2qO9Ba/VbAV+8GPdYarYqOyfoR4fepgV+wuIxzTtGrVaawV
	daJqIdajqAoj//k3GNBA5jtZAZ7A6mqB5PEWI2Vpt9rIROXyu8CzhIvG
X-Gm-Gg: ATEYQzzWsP4vkyZbVlbAyk7uTZgxJ5UE1V69rRioKH1wDLIEbFWJ6j6vuvjn75W+BsQ
	QQrsar9h1iN4y8GjTYjJnvNb9ocpiIdHO5V5RaYgsaKX+OXcFxGdppkWme6GHHub0zD+MBlihGR
	yxar3ln0qKkI+HkFD8r9Hh6vC0SsG5cBuphu+ABoNW1/A/8hkw9DTyAyoEhjtZcrHnKScIMBqo2
	2aBGQakv3mbPcjvvVeK9V3xdRUvSF+m1AnZbrNFRB1/Tm95ca5Yl9YvKlzFyQkHM4rcY5/9wl86
	37gijgtDJO26RJpctdx4d6dD+NFrJQVGe46DOdxDN8CLEwBVGu+c8kaTVQC9XgnmlJd+tf7B2S/
	2o3jQk2ZhHohU7BxwbKgLUC0UvsKn379zNKcJnOju1iEDMwvAAVdEUH7cvalSFFzo+aEMddovjd
	0XeGTG9qxRBrIg6lYT95aHm8GotXF916KweE/ES0DIWv6T/YIS
X-Received: by 2002:a05:600c:a59b:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-486ffa30b26mr120244995e9.28.1774352619155;
        Tue, 24 Mar 2026 04:43:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 06/11] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Tue, 24 Mar 2026 11:43:11 +0000
Message-ID: <20260324114329.268249-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
be left disabled as there is no owning driver to restore them, unlike
regular clocks.
Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module clocks
on resume, re-enables any critical clock found disabled, and then restores
the MSTOP state for clocks that have one via the existing helper. This
replaces the direct call to rzg2l_mod_clock_init_mstop() in
rzg2l_cpg_resume(), preserving the correct clock-before-MSTOP restore
ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Updated comment in rzg2l_mod_clock_init_mstop_helper() as resume()
   calls this function.
 * To avoid setting module state twice and also not to update the initial
   mstop state for the critical clocks state during probe, replaced
   rzg2l_mod_clock_endisable()->rzg2l_mod_clock_endisable_helper().
v6->v7:
 * Updated commit description
 * RZ/V2M has critical clocks but no mstop, so move the mstop check after
   enabling critical clocks. After this, we need to restore only mstop for
   module clocks, so remove the inverted logic and continue statement and
   directly call rzg2l_mod_clock_init_mstop_helper() if the clock has
   mstop.
v5->v6:
 * Updated commit description
 * Dropped the list implementation.
 * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init_mstop() 
   for enabling critical clks and restoring mstop state during resume.
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 738a4b182f27..70228d8a2ef3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1599,8 +1599,8 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 {
 	/*
 	 * Out of reset all modules are enabled. Set module state in case
-	 * associated clocks are disabled at probe. Otherwise module is in
-	 * invalid HW state.
+	 * associated clocks are disabled at probe/resume. Otherwise module
+	 * is in invalid HW state.
 	 */
 	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
 		if (!rzg2l_mod_clock_is_enabled(&clk->hw))
@@ -1608,6 +1608,21 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 	}
 }
 
+static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
+{
+	struct mod_clock *clk;
+	struct clk_hw *hw;
+
+	for_each_mod_clock(clk, hw, priv) {
+		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
+		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
+			rzg2l_mod_clock_endisable_helper(&clk->hw, true, false);
+
+		if (clk->mstop)
+			rzg2l_mod_clock_init_mstop_helper(priv, clk);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -2103,7 +2118,7 @@ static int rzg2l_cpg_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	rzg2l_mod_clock_init_mstop(priv);
+	rzg2l_mod_enable_crit_clock_init_mstop(priv);
 
 	return 0;
 }
-- 
2.43.0

