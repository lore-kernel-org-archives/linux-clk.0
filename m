Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AA37B036
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472860; cv=none; b=kICkKgVuJbrWiGV7kRubFccpbBCdT0/naOr13nnOAO4dUSrtTYVhmUPf341k8TFJvaMHYIO3MGKN696AvzcdtCStswa+Opar9BdPHIsaHw6t0IUNLKW8H7aIEQpDs7+A/g9Jf/3nL3xjYNHgCVivJpvwjZIGY+dCQevjToO7ymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472860; c=relaxed/simple;
	bh=PEKHeL9rXvFYW9RpaGeQfOkT2OTMHzNKBGWIMKWDxWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lhw7eZS6iW0jcFnLZ5RUAtjb8FtvCGCWPa+Aea0upssnnpucQdVqY/X1OG1enfVJ5G+sT9fi1L5msXyDleO/pPFCD4JB2YkcUFiMoL0TUntBeuuYAQcetNNVULx9DOpg+FyCA9Fgt6VNev8xF/FFxOLSiSEyRZChWM7UwFkVINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoeHS8zs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoeHS8zs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49558ce01afso724515e9.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472856; x=1787077656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoBrIu71ZNwcJ7ynDv9vbZU1MnMNwwNUPz9FrjCuwMg=;
        b=KoeHS8zsgxDOEYQztuAmQj6iCnku8cTkQzBYgUu3pB+poso0d4ZjNs/kqwNsurnyoX
         lHl7Ildf3vOLqR/W3vVvOvQhqk3i+PAG9ryhFkjCSKcYqKr9WQdaEaeM8hyhKSSm9HWe
         zQrnVJ6k0nl6XaPCmwSoSKOBPyg3gdx37CPndfnsyzM3UGOFM4cDflFWglfnIKsbkCBj
         vlSCEJpTYs0QLNQnJtX3GQFB4xYa7TRa9CrzUg+DV1ov/9rUoXL1w11qKMn2/A+sRGzd
         vY/+SvCPelf204VvjvaQ9dWYEGxLMDVm63y3H8rfkEXPsPD2Lpuue5IXmKIiC6zYnf8u
         OpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472856; x=1787077656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KoBrIu71ZNwcJ7ynDv9vbZU1MnMNwwNUPz9FrjCuwMg=;
        b=pfLeaRog/glu0crcRiHQlbSYx5/y7zXX9hFMtM/JsDiOJesDAFKFDdBRtNg+UfT9xL
         kDEO/A862jh6HOqNUSJlWSHXl7A6hv9uzrrQuxY19ZKeXlEn4Q4UwbNODCiOU6dKCgjN
         iX4+eWsjrAFKzL3oPb9lznURjYqQ/Cb+Pft4ubFt7fwcBJLWx8nLOaFevCSxoLamGrSM
         WqSE5uNLjkjjj1EKcOPaQah3eQX2bpWrheyHiSpFYHbpkIKNHfxPaEHyOCNuYVtzZKwl
         WwmYcjR3oKoy1/AfAObbXMVx8uA1pIGgPY3BfN6FPaPf6Jy/5N55WPMTwz8+L9AGttoT
         e4+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDqokFJE7TH66WoHARvWTaRywG3nMFzwBUSJiuZnMrTpUNOrY1W8Eh5g1KfTGlNKDcoxFJQvZGm/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdV3tB4fGyyE/7JAokUzzX4QpNcpeSxsR+KwuU0AvR9Inlj6b
	VFGeIxfC5ssGsZpfS5IEA78TRz41Oluzvq9KA8P5MwQ8TJpRuOmfZ/yR
X-Gm-Gg: AR+sD13U3kF0HTO74AWTDq1n5c3dfKtwHz6wn95kp6D4kK0U4JrzNf3E1/Y52L7Zd4w
	5TXfTIdF1Ic15CBj7iX1Kf/t6U0Qv57/oIR3hJGS0AWcOF06E++r2eaRtGBme98nXrnm+xoVQBc
	BIoK0TC+2YN++HrQ3eHgmAKhMwNnsnzYhZViZCAHPXA+s6ymNtSomYyx/VBZqMcHsqhzuafSmoQ
	nJahtFiP3xd1gwSqCJ0MeB4cr1BCPu6v2pL1OgmKRi/w9oQJ6zAc4PGeigq6uBq3i9guzJ00FKb
	kKHLTAg742wTmNF99DRWSYWdbdHzulYMJNG/jntNp9VQHHy2ABPFNppQn79yNegFHQ4c+vG/7Lb
	aG3yjhpNlrxh41mlTbjmdUV3Op7QmQotC1CSfJeUg90DJhp11LXO+5DTirHpKVxMITfvf0Kds1x
	glG12hWFgd1TvelbK+YPYtL6dGz7UwT2tQCgpdPKHqsm2CQQtvt6Q6KN5yBZcejV1bMTxAXjo6g
	ms83Tpl9aN5SCj4mw==
X-Received: by 2002:a05:600c:3511:b0:499:53c4:1daa with SMTP id 5b1f17b1804b1-4997a61cd61mr24662225e9.15.1786472856266;
        Tue, 11 Aug 2026 11:27:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:36 -0700 (PDT)
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
Subject: [PATCH v2 4/9] clk: renesas: rzg2l: Add support for divider flags
Date: Tue, 11 Aug 2026 19:27:17 +0100
Message-ID: <20260811182729.360959-5-biju.das.jz@bp.renesas.com>
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

Add support for passing divider flags apart from clock flags from soc
specific clock drivers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
 * Fixed a check patch warning by using (_div_flags) in DEF_DIV_FLAGS
   macro.
---
 drivers/clk/renesas/rzg2l-cpg.c |  8 ++++----
 drivers/clk/renesas/rzg2l-cpg.h | 12 ++++++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 07b78cbc4531..2d80775c60c2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -487,20 +487,20 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 
 	if (core->dtable)
 		clk_hw = clk_hw_register_divider_table(dev, core->name,
-						       parent_name, 0,
+						       parent_name, core->core_flags,
 						       base + GET_REG_OFFSET(core->conf),
 						       GET_SHIFT(core->conf),
 						       GET_WIDTH(core->conf),
-						       core->core_flags,
+						       core->div_flags,
 						       core->dtable,
 						       &priv->rmw_lock);
 	else
 		clk_hw = clk_hw_register_divider(dev, core->name,
-						 parent_name, 0,
+						 parent_name, core->core_flags,
 						 base + GET_REG_OFFSET(core->conf),
 						 GET_SHIFT(core->conf),
 						 GET_WIDTH(core->conf),
-						 core->core_flags, &priv->rmw_lock);
+						 core->div_flags, &priv->rmw_lock);
 
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 38db209aabf9..ebf6b744dac4 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -112,6 +112,7 @@ struct cpg_core_clk {
 	notifier_fn_t notifier;
 	u32 core_flags;
 	u32 mux_flags;
+	u32 div_flags;
 	int num_parents;
 };
 
@@ -168,11 +169,18 @@ enum clk_types {
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .core_flags = CLK_DIVIDER_HIWORD_MASK)
+		 .core_flags = 0, \
+		 .div_flags = CLK_DIVIDER_HIWORD_MASK)
 #define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .core_flags = CLK_DIVIDER_READ_ONLY)
+		 .core_flags = 0, \
+		 .div_flags = CLK_DIVIDER_READ_ONLY)
+#define DEF_DIV_FLAGS(_name, _id, _parent, _conf, _dtable, _flags, _div_flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, \
+		 .core_flags = _flags, \
+		 .div_flags = CLK_DIVIDER_HIWORD_MASK | (_div_flags))
 #define DEF_G3S_DIV(_name, _id, _parent, _conf, _sconf, _dtable, _invalid_rate, \
 		    _max_rate, _clk_flags, _notif) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3S_DIV, .conf = _conf, .sconf = _sconf, \
-- 
2.43.0

