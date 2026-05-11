Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA81DE8BF
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 03:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469792; cv=none; b=KStqVNs3PYnr6mTr6t9KWl3A+3Z/KF+KseCeNBHwJ6ZUYaRss7R3RPTy1DStv/Npnywu2+W+9jYASHDtsH/cvAZ0zFoVZqnoxVLndQQFr7GiPgSHhV9tf/CtOysiB2DscAHhntGg5ExjSJeh75rVulstJx5DG/npjUdFDOxdvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469792; c=relaxed/simple;
	bh=aRA9RqDbdkytdeD3fIcLbhFl+PjGHD37mS0atvssw4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMiOxyZRSc3zklyYABDDYE+AHY2G6tvSFiAYOTf6EiGwno8EhKaMfYhaisf5EiBk+3vCQwVK3D0n4wqEb1x9g+eOltAOSODKq2xnCe7xgvQZ9Hf94FdPzj/l4qlw20DugBiouLAlE5IQCOZY0S1P2wq2I8Zemd+LbxswWt7t660=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wm6vQEVb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm6vQEVb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b4583f0a1aso23397455ad.3
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 20:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469790; x=1779074590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z+2lgYT5AdwNVejrbpCLq1bID8j6vgX8/sYNGb+SUj8=;
        b=Wm6vQEVbt9ewLsEPkvcJc8l7n+jW8WrKGkBvXjYcBx7D1VTpFadqopwmyVLelG16wP
         JkqfY3FzgVI70naGkiPyTmt8ufIE3vm3G5czHCcViz/AjJB80KnGSYssgphP/iqea8Ki
         kQuUG5PzG0T37r6HaMkGg7cNcyw4Qb1Qwf66S57gkIGGSjcTYXwftaCrfkkUIiijwQzG
         sXC3RKMwv3pEGAsbY5/EgDWoSwsF5U+EK0+QoONqjUV1Ls/G2rTQvJghtkZjQgNm3T8P
         pQiBQjVEgDhq9QqVNjsPE6sKYgSURx1UOLQ36y46iNyvt5TEpbK2UNBcRrgjzeHZmIoy
         4Rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469790; x=1779074590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+2lgYT5AdwNVejrbpCLq1bID8j6vgX8/sYNGb+SUj8=;
        b=sRztg9oaYBOkh/w5Ornfb+04QvOwT2r68EJxStCzdlEVZG1znRsv9/v9zAaQMYdQHn
         4JNwnso4EESJjV+KRREOtEqF9TSPn9TWmT+ZLSzLZ41Jw2lyBcWhvSdnnZa0nmAXX0Tx
         ljwKnj+Bx1KmMQp1H7FRlcLx+jsEkRTA897OR8mLOp+sfpkHlsTF1Ub+HLUr3hKuJX/f
         DXUQaLg8CoYSKbvutP8D0Ln2c4Zc+rkjEOP4VObyXqWG4XUMAYU06imSY6Fakg5+TLbI
         BYlQyElbffrIH6ec3Nk+WLIb9e1TfnqY4hlrahWz3g41t234JN4t9rSb35S/HNNgY3jo
         e/3w==
X-Gm-Message-State: AOJu0Yxj0GiJ22AgzWs1ru6UXA/fRBNcnanwoz/xxgQtkavHv3ZQOloc
	xSjCUi78f/eWzQWvESU/faZWsADIlqqQ784mhqLBjfOmfSZzDPGra1iTVUEHQyV+
X-Gm-Gg: Acq92OE/6vxHT2NTJnUj9uyQVCeomcTPVk1B1saI00T3vI0mHjoIIxqbfHsEiK/wLia
	7xQW4YD6R4at89Rd43u5yz0aIYYemIfOU7WhgKqisyNTWgO7AoPFkhYeuSSbYauDE4PeNuOut0t
	0aQSWw5h/RJ97oaqyphY29UMOELEHoUuaW8CKrgK4TCxCKLK5va/JF58e7LRvgoewyUTfr5zqrm
	9vWQX/M2TdJlmbKh3aMNeX0OmbJTgsjnQmF03buAp9ZlQT0PR8x+ibkUQegT50YdrQn94u74D9W
	uQXwoYT51rW2JRs6xE+kB5IDO5TbnyHKEof1UtqyGhGP+xhpPDbcfeStOihKLlANQospl8ZORb+
	D1pZ0Jq5oEtc83nre287NxTCRMnPzVU0mfxLswDXe+qN4c8RZSbIkyHsLuMiJtF/DXWv25Oe6TM
	PL2jXLszgA8alhVjtAF6uYuJVJYtiJ8iqsIMWT3/eBk74O3ZHVE+MR+qGRxSc+H0CUQq8WZA16Y
	/r6Ukw6kgJZpTGebrcN6ZAC01VUj46JrIQ=
X-Received: by 2002:a17:903:3c68:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2bc8f9a370emr72908175ad.16.1778469790096;
        Sun, 10 May 2026 20:23:10 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bcfsm83911855ad.38.2026.05.10.20.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:23:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: rockchip: Use flexible array for clock table
Date: Sun, 10 May 2026 20:22:52 -0700
Message-ID: <20260511032252.361906-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the clock lookup table in the Rockchip clock provider
allocation instead of allocating it separately.

This ties the table lifetime directly to the provider and removes a
separate allocation failure path while preserving the clk_onecell_data
lookup interface.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/rockchip/clk.c | 17 ++++-------------
 drivers/clk/rockchip/clk.h |  2 ++
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index ee8c79b938d3..dbb4b6f33abb 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
 		unsigned long nr_clks, bool has_late_clocks)
 {
 	struct rockchip_clk_provider *ctx;
-	struct clk **clk_table;
 	struct clk *default_clk_val;
 	int i;
 
 	default_clk_val = ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -ENOENT);
 
-	ctx = kzalloc_obj(struct rockchip_clk_provider);
+	ctx = kzalloc_flex(*ctx, clk_table, nr_clks);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	clk_table = kzalloc_objs(struct clk *, nr_clks);
-	if (!clk_table)
-		goto err_free;
-
 	for (i = 0; i < nr_clks; ++i)
-		clk_table[i] = default_clk_val;
+		ctx->clk_table[i] = default_clk_val;
 
-	ctx->reg_base = base;
-	ctx->clk_data.clks = clk_table;
 	ctx->clk_data.clk_num = nr_clks;
+	ctx->clk_data.clks = ctx->clk_table;
+	ctx->reg_base = base;
 	ctx->cru_node = np;
 	spin_lock_init(&ctx->lock);
 
@@ -388,10 +383,6 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
 						   "rockchip,grf");
 
 	return ctx;
-
-err_free:
-	kfree(ctx);
-	return ERR_PTR(-ENOMEM);
 }
 
 struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 9e3503e2ffc2..d4033bf750f5 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -604,6 +604,7 @@ struct rockchip_aux_grf {
  * @grf: regmap of the general-register-files syscon
  * @aux_grf_table: hashtable of auxiliary GRF regmaps, indexed by grf_type
  * @lock: maintains exclusion between callbacks for a given clock-provider.
+ * @clk_table: clock lookup table.
  */
 struct rockchip_clk_provider {
 	void __iomem *reg_base;
@@ -612,6 +613,7 @@ struct rockchip_clk_provider {
 	struct regmap *grf;
 	DECLARE_HASHTABLE(aux_grf_table, GRF_HASH_ORDER);
 	spinlock_t lock;
+	struct clk *clk_table[];
 };
 
 struct rockchip_pll_rate_table {
-- 
2.54.0

