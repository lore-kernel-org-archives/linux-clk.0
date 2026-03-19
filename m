Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AA03D3320
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924715; cv=none; b=Ot6nFYwyTv4uPK7iUu7kj0eW0KCnYqqfOS3yyzWQm3td5mfVgodEasvGiSKQOGJkK6/Q4gu7RnOPa9ehIq6BEq/xrBZeSmX6m45H/s8eSTPnZabGnxGfjb6O15aVGwvBPMVx6xFx56RUy4tZymNDy/wpnE53AyvIYMxJYSCXzuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924715; c=relaxed/simple;
	bh=yv5O6L9Osf92/NBhnnaAVjsGxqrRsiIBhDnkfv5ydsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uln9+eIjMliBFoVsl6JWUX5VuO/uVGl41LjSzMT5c4rREbY9XSBnyGvmqYrp68ZGjTu1frtFu+4yEylCLy12WA0kAhXsNXu4TXXBrZGX19itWa251qWQSbbiMwtzxtV2es/4T0BeuS7b6Ar+XoepiwpT8ZBcrHK97wghnlsokP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhnSYnwC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhnSYnwC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso19766875e9.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924710; x=1774529510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZNm9932r7RAgrKS/m/BnybmtJfLPaPBeO/K8gitoiQ=;
        b=XhnSYnwCDSnQkFPdCjLtqHuBrTBACsPWgKZOIkW+9LxaZ+FarCT+BQkmmYiunwmIIz
         n/8O8aGCaa52Qz6TFp6+ZEfEqVA9aBzb4OZ8EmHBKxLTDVBfK0pNtrKV8y4Pu5IcwndA
         znpNGmcimo1e0qqbMiteYc0XKg2mlcvoiKh9GCQiN9ZjzTf7O4Tuwr6i1TSbv7TGr0bN
         7NQt4SHmdPPjiuTQdooFW0nx6okkFT6YYSln378y9T9uPfvEZluIfoj6+vB+t5NNSDJ/
         fqfGS6P8qMJPwuRSZpJRLWs7DROD3hlsezBfl4DrPu7VKqZsTF6TeX6z43G9NhBUR2+a
         xPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924710; x=1774529510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZNm9932r7RAgrKS/m/BnybmtJfLPaPBeO/K8gitoiQ=;
        b=UN1env0JMtGcnrTTWbdLVVlAjlSN+YE8NfIM6FwWcdEAfaPAS/KYs57svWNJP9IlQ6
         F20rzhlNdeki5fZttzZDj84unSM0Ee3xDazAkMVdGeUD2O5LTtVgaIvy0gNLkeD0KZ4w
         e781q2pqS3Xrw2pVn921Cc0pV2X37Tj8Eh/3Htg2nCL5RSoFOdZnmT21HTbQZ08hHMZ/
         QPPQJymSwFhm1fbQfugtUaCNg1l+CeS4uRE7YVyzf+nAPG7P6kDU2Ar8/1qN1n+QenIX
         jynZ7JR///7i5D+uMeJt5lyoPDVl/UzfFVweGo12O4FCCznsle3hxz00uSM/B63AlWLE
         K3lw==
X-Forwarded-Encrypted: i=1; AJvYcCX4OS91R6ljW9sxgPHYboUfrNTbMzIt6sRV1zHlJu1slO0zd6wevT7pvM3mV4RrhhYClgiQ6OQZuvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVoEdqf0c7MnZ3Johoqut+Vk/bcmumiWlXIirlr0IjxOw1lw6E
	jxFlYL46uS1j9OL8OxqtRXOxijoVJHJck5FTCqsfrUT/7qZkIS/8QzyD
X-Gm-Gg: ATEYQzzFeGt9IQplaZfx/txptKf+6GiXdxYhzowxyOPi68eVrDy7vQG+jnDJlKuPZO6
	e6GULok0o592+PCJtd2BveCHGK4Kf6v8LCVM5K2z1DuExPjNq6k+trTAngMyps67mHmn5pygVcE
	yzZDQlYpYA4pzUbtId6qbEtRSKjVvhVj6hHscelSeigfA+Mg6UALQ0CvUO1FCbUaB1YVWwD8KIl
	v7PtFLHyS/l0Mqe2Qs8cidJcGCNXMuVbqhGYlxatgAe/ADzpsW7jB+Sd7blaxDo3t4x6RA3Uncg
	61s7yynYsk0EF3k27Uhaf0UQlEABWs2x6tsU6n+zT3qO9K89tl8RBTv1Tv1FShuyBndDkaxJw74
	hY+qMurOhBCHjRjkAYCGuBL5GBuv2q7Tp+d/IEcdmYpjrC9oroSTappuMtpbwbYbzijzYIq2lcy
	vaauNpaL+qO3M/TPyVAXidBNjgJBha2q4=
X-Received: by 2002:a05:600c:c493:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-486f8b32877mr58559885e9.8.1773924710251;
        Thu, 19 Mar 2026 05:51:50 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc96c6sm72382035e9.5.2026.03.19.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:51:49 -0700 (PDT)
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
Subject: [PATCH v6 05/10] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Thu, 19 Mar 2026 12:51:29 +0000
Message-ID: <20260319125143.230377-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
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
regular clocks. Add rzg2l_mod_enable_crit_clock_init_mstop() which walks
all module clocks on resume, re-enables any critical clock found disabled,
and then restores its MSTOP state via the existing helper. This replaces
the direct call to rzg2l_mod_clock_init_mstop() in rzg2l_cpg_resume(),
preserving the correct clock-before-MSTOP restore ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 drivers/clk/renesas/rzg2l-cpg.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b68b0312f0e3..7899c79734e1 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1600,6 +1600,23 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 	}
 }
 
+static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
+{
+	struct mod_clock *clk;
+	struct clk_hw *hw;
+
+	for_each_mod_clock(clk, hw, priv) {
+		if (!clk->mstop)
+			continue;
+
+		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
+		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
+			rzg2l_mod_clock_endisable(&clk->hw, true);
+
+		rzg2l_mod_clock_init_mstop_helper(priv, clk);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -2095,7 +2112,7 @@ static int rzg2l_cpg_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	rzg2l_mod_clock_init_mstop(priv);
+	rzg2l_mod_enable_crit_clock_init_mstop(priv);
 
 	return 0;
 }
-- 
2.43.0

