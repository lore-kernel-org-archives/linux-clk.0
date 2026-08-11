Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87CC37E5DF
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472862; cv=none; b=rv/CMvaJqVkoONNXZvIAtJtracSFJu8shgics9cJhiDAAlPSWfyRe+rXCrOwicKjfsBdgFRDgJTVz++t4vAWNETuVu+xMG/l7bRbV0gCPSHEyGPaF5seEDkglMtnssA7TL751bes1KLhFvABAnN881nzqNK9KuRrORCVfq5yOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472862; c=relaxed/simple;
	bh=89LNdMndvS72NVwbm0KJ8CZAVjk4xgHc/PIAAlNZp1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSnz0LRsb+CBXNU3wz6yNzGCQ/UA4SGdeuw3OtQYqdB4Ll9lNa7kEI43pr6ZJmopTTyPxQeJHWysd8il0nn0zIDzwIRp+jl0NFqhwJIKXOQtkEJFPF295ZjWHahyz6Gopvpoqjz5L2jmgScQuZx/8CaA7ERXYEZKiNBbfp+oxgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyPeK8Yj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyPeK8Yj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so432295e9.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472858; x=1787077658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6geQBKDB/Sl0WGqmUVK4X+V/u0XbeuPhtU7bTybDrw=;
        b=eyPeK8YjepZ8zpZYpDVPZaN3Vj5GFI6oCXKnMIQN+KXQB3eOtApsKbvpyL/mhFog2P
         cBYmtdy5MfMT0h6ySL3KJxYQJbq61gHnSOyhZZFBYLZ3byMcXmOp4pHVAxD2WCLQqFCd
         b1nh5ot94Z96G0V0JtjuLYB3y0m0JXl2LKvqlLr9UVWKdyetlGq9DoumYnUgu9IWJf8D
         1Gx28F0m9PV1icHrpROjsTKdlCuyZa7gUh6EGxzLCXZH3LG2RQeGvBHyH8ReHwIcONaw
         VF/exRfQWR6Jasx3PuqFuHmcLTp5XRgCH+hPlnZSNAoNYwy2xizoYlFq9YnW9L9248YR
         PM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472858; x=1787077658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6geQBKDB/Sl0WGqmUVK4X+V/u0XbeuPhtU7bTybDrw=;
        b=Z5lz+bWk7fIytsmzN5XDYH0tfi/JBAFETA/jyJ5ZigV6Jxd6Itz7eYSNsVIzNwoavf
         wmDNx5+B5eaAV+DtyI1A8aOJ6vHXBPyhPwGn9P7UhT+ZIlVQtseK0wW/vKi1+62Aa7PQ
         j/4u4YxiybNIyNWDa+Qn3OY6hHO4Frij8wuy8AmUGrC2mH7wOVjXBk1SafT3LsebImJJ
         LubA6YOwXlC7kshOTJQibgz2K2l7q+SNFuh0X+CvY9WpsiquZ80d7o1gM/yvT/Ry0lZI
         Iah6yVqiDXMZS41G2aMGmBArFH6lBJ0E68Ev++HxjdaPKuMi/lOu1FDDRipYQDfyZnIJ
         LF7A==
X-Forwarded-Encrypted: i=1; AHgh+RpSzd6n1TE5Nsb80OFIsucA/BybuTwBTreeMdhszoVe7Kk/2bqP+rzBFZN9McYzJ+7lK0NYp6T/Cus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOz553JfWKhjEIFpHCiMxPyIHxIlZ9/qp3HuZpW0YfA6GHc3SJ
	ex3Tm2BhR9iNVJxwNvyByw0toPIryXVM16SeSwD9EGlaaWApuLTUxtw9
X-Gm-Gg: AR+sD10HDGahWQAaPVODcO9u9imZ3drbdv1lbwHIz0ctbuXPibuFHi/c5skVBwX4Idl
	jN1xrhr4buuYbppP/+7CxZZNpbGFgQEi5MFP9XZ11htlHoTpPO0yc0NpLcENRbRynw0XGLGo5YK
	XEhcVJnUGTBygd3eiuMnnu0QDpIqQDBPuhF1cYoc/V2aI3qEY1TRZGzmF48iwP2RAmWLXZgiR4f
	irhzPXpjPOSzwV9hsSAOtfSX87i3khx3YXptXNUzzAUazoCp2PALypmG7J6Hxk5K7kkI3K5QUsH
	sNqIxNAlgysZcZT5npZqe9en6po5H6+4J/iApOc+lKzpz6GbRD73ZK/Hpqe1/mgxawKXd5j0hR4
	ws1ulqijZ6YHnpZmKICGpXmvsFPtdG2F+VuuMH+BP+XYr71s3PK3Gfmx1fwAJIBT1iLvNiniiV6
	O9pBkt0VPBs4bsowqxj0S10BizzNq83fXnYKqf4+SZHdQnWMu1KTz8OXDleBYIjr6QFzQwzwLw9
	VJzApabCUJJ
X-Received: by 2002:a05:600c:1990:b0:499:78b3:7b34 with SMTP id 5b1f17b1804b1-49978b37c3amr64700545e9.2.1786472857873;
        Tue, 11 Aug 2026 11:27:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:37 -0700 (PDT)
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
Subject: [PATCH v2 6/9] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
Date: Tue, 11 Aug 2026 19:27:19 +0100
Message-ID: <20260811182729.360959-7-biju.das.jz@bp.renesas.com>
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

Add support for RZ/G3L DSI mux that supports 2 duty cycles.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped rzg3l_cpg_dsi_smux_get_duty_cycle().
 * Updated Mux flags with CLK_DUTY_CYCLE_PARENT and
   CLK_SET_RATE_NO_REPARENT
 * Determine rate now forward to clk_mux_ops.determine_rate().
 * Dropped the duty cycle macros.
 * Dropped struct rzg3l_dsi_mux_clk and to_plldsi_clk_mux.
---
 drivers/clk/renesas/rzg2l-cpg.c | 84 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h | 10 ++++
 2 files changed, 94 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index d3d4e618466c..33cfea1b798a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1493,6 +1493,87 @@ static const struct clk_ops rzg3l_cpg_pll_ops = {
 	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
 };
 
+static u8 rzg3l_cpg_dsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzg3l_cpg_dsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzg3l_cpg_dsi_smux_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	return clk_mux_ops.determine_rate(hw, req);
+}
+
+static int rzg3l_cpg_dsi_smux_set_duty_cycle(struct clk_hw *hw,
+					     struct clk_duty *duty)
+{
+	struct clk_hw *parent_hw;
+	u8 parent_idx;
+
+	/*
+	 * Select parent based on requested duty cycle:
+	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
+	 * - Otherwise, select DSI/RGB path (parent 1)
+	 */
+	if (duty->num * 2 > duty->den)
+		parent_idx = 0;
+	else
+		parent_idx = 1;
+
+	if (parent_idx >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	parent_hw = clk_hw_get_parent_by_index(hw, parent_idx);
+	if (!parent_hw)
+		return -EINVAL;
+
+	return clk_hw_set_parent(hw, parent_hw);
+}
+
+static const struct clk_ops rzg3l_cpg_dsi_smux_ops = {
+	.determine_rate = rzg3l_cpg_dsi_smux_determine_rate,
+	.get_parent = rzg3l_cpg_dsi_smux_get_parent,
+	.set_parent = rzg3l_cpg_dsi_smux_set_parent,
+	.set_duty_cycle = rzg3l_cpg_dsi_smux_set_duty_cycle,
+};
+
+static struct clk * __init
+rzg3l_cpg_dsi_mux_clk_register(const struct cpg_core_clk *core,
+			       struct rzg2l_cpg_priv *priv)
+{
+	struct clk_mux *mux_data;
+	struct clk_init_data init;
+	int ret;
+
+	mux_data = devm_kzalloc(priv->dev, sizeof(*mux_data), GFP_KERNEL);
+	if (!mux_data)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = core->name;
+	init.ops = &rzg3l_cpg_dsi_smux_ops;
+	init.flags = core->core_flags | CLK_SET_RATE_PARENT;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	mux_data->reg = priv->base + GET_REG_OFFSET(core->conf);
+	mux_data->shift = GET_SHIFT(core->conf);
+	mux_data->mask = clk_div_mask(GET_WIDTH(core->conf));
+	mux_data->flags = core->mux_flags;
+	mux_data->lock = &priv->rmw_lock;
+	mux_data->hw.init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, &mux_data->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return mux_data->hw.clk;
+}
+
 static inline bool
 rzg3l_dsi_compute_pll_parameters(struct rzg3l_plldsi_parameters *pars,
 				 struct rzg3l_plldsi_parameters *p,
@@ -1805,6 +1886,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_G3L_PLLDSI:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_plldsi_ops);
 		break;
+	case CLK_TYPE_G3L_DSI_MUX:
+		clk = rzg3l_cpg_dsi_mux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 22cca4795301..1591fce2a329 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -151,6 +151,9 @@ enum clk_types {
 
 	/* Clock for G3L LVDS divider */
 	CLK_TYPE_G3L_LVDS_DIV,
+
+	/* Clock for G3L DSI clock source selector */
+	CLK_TYPE_G3L_DSI_MUX,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -204,6 +207,13 @@ enum clk_types {
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .mux_flags = CLK_MUX_READ_ONLY)
+#define DEF_G3L_SEL_DSI_MUX(_name, _id, _conf, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .core_flags = CLK_SET_RATE_PARENT | CLK_DUTY_CYCLE_PARENT | \
+			       CLK_SET_RATE_NO_REPARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 #define DEF_SD_MUX(_name, _id, _conf, _sconf, _parent_names, _mtable, _clk_flags, _notifier) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, .sconf = _sconf, \
 		 .parent_names = _parent_names, \
-- 
2.43.0

