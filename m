Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995637DEBF
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472859; cv=none; b=p6ysV+JXDyF4v6ZrsU7dzkdQMfllPfxIndLk009AZCvLIO0ghbdSFBbKP2alD8JHPMV1f0dpn727LT+FT0EoLB+ysXuOyIrGGaOR+FGv9dO31aUFAp3nVxs/ADGeL2Z9Kp2aSyQgvkKjg3UtJp5eY1dvyiNnV+xvkdk7Ces2ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472859; c=relaxed/simple;
	bh=YmnkkOj0FX1imszRkVWlvDSao3IvwbWV726bp/NMHxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulcrnNENO61GkxoCocBsoQet4kyOo6YpXq4EcnTFOva7ou2cd1QSY1mdMACRcwt40r7m8v3I5a7yqdOV1Z9/8qeE/W7Wto/O6A8NsUuDcI93AMgCzJ5EDgtMxVo+cqrUw2PHBDO1oiY89uThh53zMIzkYq38pBxN2QfgGLb1tD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YS7kFhxJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YS7kFhxJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49954b88fffso1185625e9.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472856; x=1787077656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRTEN3IeDpp9Qx7jdQKauoliv9vikyj1XdpWLGJJq6U=;
        b=YS7kFhxJExFD/lQEN8XTotOLFCadZxMn3N8WEfscyyVgbLV+2BYoBTsHvUt+dAQnlI
         /szYFbGwyQnBd6qihb6IMndjwJ+0AMtaatQwVwW55X4dUOh9evM2n3FEOUynz1e/3/R2
         F+AF8xAsli3zrc0UX3mWZo6+Wzv2gRcS+yjOslVwmq+2SKw0jnTqpXgLgcbCialpYDpA
         DuCUAJ8QHAgETfmXF68gZ7kxu12HoJ19Q9AoIRHXhbo4Kf/vF1d7YCBw8bz3ob+4RG+H
         i6QtH9lnEClMHDIjQKfbCXBx9dcmTrJfalweL9zqnqRHx3FiY36hiCTPzLzbaJYeKb7T
         lG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472856; x=1787077656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRTEN3IeDpp9Qx7jdQKauoliv9vikyj1XdpWLGJJq6U=;
        b=CjhARnHsjo3094eOWJLO+0iy29tKcMMd9KUDc6EeKU9mTO7EF1ZuUD83D9/UAFnAa9
         X2hHvtpdFApugH/C5TLj6VTkMJucB5yHkxyhAMPNN88oQvmHKHukSA1+r4IYmg1ujf8M
         j276OM6+Se5XJtehWGJVHxCcN20CkRLsmZf1mpPkJxR3cbNt75DrX+sIqzdudUwSGGGQ
         Doz7RpJm3Nl2zis8KjTU+y93Gy0EYnsPeWpimbBiVgJdsUFBR6vISYLPpkys5OJh9FF0
         yZGOZ996aZsi+dB4snrTXUu998qbXeA+jkB7pHwoxUGzmXghbwCk1iL9ZpTFrDVi1cgz
         doiw==
X-Forwarded-Encrypted: i=1; AHgh+RrLLMI8UHqbBE5ZiSy7ZsJG+ChBuUWgp7NyzHtaBM/hWqG7fgDeASIq4KR+uXiAcV/HAXmLNixDMkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkN5UWdJUP9GEEpj2ShZ+GcRir2AqJM5Y62Kc75IOolmSlCjMN
	t9UMU2YVe82pNMuKF8zNBL6DRWukzxbWg1089Tybw37LCh81UxlyDK0E6vOgNw==
X-Gm-Gg: AR+sD107KiR0NbNzpCoO9xb7FrbY3BLaxsg313LcOwodBVJfsbPOahNNB7hWG9AeHKn
	iqQbpj52PlymzrWhv9nRm22rT4ndywav77yr3gSCNDdv3P1vi64GIQj10DDq4XiaidzvZy4gEVy
	+ypScwZEJOM+Nlj3n1xArBADOO3wkYWv23mgF+CBcjx86cmXAOTxOU/mYcu7qAShHh5WWKsaHiJ
	0oxiIIBVgJdhfvvzTAe2bspxCqgAfFyjlfQxLR/+kS236VUQGHkrQjbe/IZ7KlJ21aNlKJZc+nf
	AAgyAJ1ec6c2SIlTAsZ7vYx7K6Cu1hHoJB3ntp2CkSykfkA4bwtEJH+qznTFeo78MPBdxjlxVb+
	yszgW7wt7l2YkrW0pCN3d3DPmLITKWEloI75Y/80Kwu7RZpeweG78veC7F85Ma+s0YBK07ZPEE5
	YnpJym4OJeAojrFObrBTTQN2iePmmJaD100cHyPPXHDE1iwy4Paxf/f8Va0wFMnVI0oIzcz+bTq
	wDxjAyerP2Q
X-Received: by 2002:a05:600c:4f52:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997847121fmr75553765e9.18.1786472855510;
        Tue, 11 Aug 2026 11:27:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/9] clk: renesas: rzg2l: Rename cpg_core_clk::flag to core_flags
Date: Tue, 11 Aug 2026 19:27:16 +0100
Message-ID: <20260811182729.360959-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Rename the 'flag' member of struct cpg_core_clk to 'core_flags' for
clarity and to better distinguish it from mux_flags. Update all
users and DEF_* macros accordingly. No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/clk/renesas/rzg2l-cpg.c | 10 +++++-----
 drivers/clk/renesas/rzg2l-cpg.h | 20 ++++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 9730ef67fbc6..07b78cbc4531 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -433,7 +433,7 @@ rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct rzg2l_cpg_pri
 		return ERR_PTR(-ENOMEM);
 
 	init.name = core->name;
-	init.flags = core->flag;
+	init.flags = core->core_flags;
 	init.ops = &rzg3s_div_clk_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -491,7 +491,7 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 						       base + GET_REG_OFFSET(core->conf),
 						       GET_SHIFT(core->conf),
 						       GET_WIDTH(core->conf),
-						       core->flag,
+						       core->core_flags,
 						       core->dtable,
 						       &priv->rmw_lock);
 	else
@@ -500,7 +500,7 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 						 base + GET_REG_OFFSET(core->conf),
 						 GET_SHIFT(core->conf),
 						 GET_WIDTH(core->conf),
-						 core->flag, &priv->rmw_lock);
+						 core->core_flags, &priv->rmw_lock);
 
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
@@ -516,7 +516,7 @@ rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
 
 	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
 					  core->parent_names, core->num_parents,
-					  core->flag,
+					  core->core_flags,
 					  priv->base + GET_REG_OFFSET(core->conf),
 					  GET_SHIFT(core->conf),
 					  GET_WIDTH(core->conf),
@@ -595,7 +595,7 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 
 	init.name = core->name;
 	init.ops = &rzg2l_cpg_sd_clk_mux_ops;
-	init.flags = core->flag;
+	init.flags = core->core_flags;
 	init.num_parents = core->num_parents;
 	init.parent_names = core->parent_names;
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 41e8f389c566..38db209aabf9 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -110,7 +110,7 @@ struct cpg_core_clk {
 	};
 	const char * const *parent_names;
 	notifier_fn_t notifier;
-	u32 flag;
+	u32 core_flags;
 	u32 mux_flags;
 	int num_parents;
 };
@@ -168,24 +168,24 @@ enum clk_types {
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .flag = CLK_DIVIDER_HIWORD_MASK)
+		 .core_flags = CLK_DIVIDER_HIWORD_MASK)
 #define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .flag = CLK_DIVIDER_READ_ONLY)
+		 .core_flags = CLK_DIVIDER_READ_ONLY)
 #define DEF_G3S_DIV(_name, _id, _parent, _conf, _sconf, _dtable, _invalid_rate, \
 		    _max_rate, _clk_flags, _notif) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3S_DIV, .conf = _conf, .sconf = _sconf, \
 		 .parent = _parent, .dtable = _dtable, \
 		 .invalid_rate = _invalid_rate, \
-		 .max_rate = _max_rate, .flag = (_clk_flags), \
+		 .max_rate = _max_rate, .core_flags = (_clk_flags), \
 		 .notifier = _notif)
-#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flag) \
+#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .mux_flags = CLK_MUX_HIWORD_MASK, \
-		 .flag = _flag)
+		 .core_flags = _flags)
 #define DEF_MUX(_name, _id, _conf, _parent_names) \
 	DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, 0)
 #define DEF_MUX_RO(_name, _id, _conf, _parent_names) \
@@ -197,18 +197,18 @@ enum clk_types {
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, .sconf = _sconf, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
-		 .mtable = _mtable, .flag = _clk_flags, .notifier = _notifier)
+		 .mtable = _mtable, .core_flags = _clk_flags, .notifier = _notifier)
 #define DEF_PLL5_FOUTPOSTDIV(_name, _id, _parent) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SIPLL5, .parent = _parent)
 #define DEF_PLL5_4_MUX(_name, _id, _conf, _parent_names) \
 	DEF_TYPE(_name, _id, CLK_TYPE_PLL5_4_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names))
-#define DEF_DSI_DIV(_name, _id, _parent, _flag) \
-	DEF_TYPE(_name, _id, CLK_TYPE_DSI_DIV, .parent = _parent, .flag = _flag)
+#define DEF_DSI_DIV(_name, _id, _parent, _flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DSI_DIV, .parent = _parent, .core_flags = _flags)
 #define DEF_G3L_DSI_DIV(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_DIV, .parent = _parent, .conf = _conf, \
-		 .flag = CLK_SET_RATE_PARENT)
+		 .core_flags = CLK_SET_RATE_PARENT)
 #define DEF_G3L_PLLDSI(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLLDSI, .parent = _parent, .conf = _conf)
 
-- 
2.43.0

