Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2961B34D90E
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777421; cv=none; b=LLMhcJ1grN6sKTw9un1ODQyfizP53xdPvhR8eblncSRs/bd2Q5T1U5TVTgCf/SFLNSJ68DIGKlKXLxfU7taBdAswnRzIGOh+p/y3cKsaCJ5IoQxYgOJp24IEJW9C7YjmScJCu6Cb6cUihrJKVUaiYGDFkWhDSHiC1eSRNayFcpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777421; c=relaxed/simple;
	bh=/pfeBRZlSAeIZP2jyTAgG02IfuvKN3sK7yiMk55tNm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksfV2xM6j42nPQsJ2pe3ErR+MKiEvGt3QRVR/taCKIRV1u3mz6suIB06ScqAax4200S1JWmkEf9q8E8mXDS64kSdaNhHWdGFv9qM0qL2VQZy+gGuz0lvnbL0kKR6IK6A48DuwUUdt1PbRloR/6jH303cqwWG47XmcVtq7U8W/WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuAnWhYv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuAnWhYv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so15290325e9.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777418; x=1774382218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=CuAnWhYvpc5/KS4Veot31dAxGCS3Ok4Coi0J7DrJZ0o4HoG2BjYX/33PIhg+O/J5mu
         0UhCeOwndahi5EmL+UhGb5DHPixOV5XE+IkG4cnYTO7yrwAoOAsOz2fofkzw2L1t8mMa
         FTSDlnUtCm5dd7Nk+DRSEIZeYA5K9pOHwLLRg3nkehaDwZaYbZxndjxwCby6qKmqTLQk
         Mhcz93BXN4wXPs3GAh1kZFfdDTZrpRe86fUq1qYLCxJL7vx7rc/ZJ9XCQ0CGZHteAxRP
         mOhCF/QKwFCGBt52Azj3fGPAAET5alIMe7oAMqB/T8vx3qdA54J2jw/IyG3VKV6e/V6+
         8jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777418; x=1774382218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=p/1U6Fk9iPPNJovSXb/BTXKCaZSFHlpvmWSUCfN63vQpCo736P+y7yW2YCrmp9qIY3
         fiKYXEMhw7jsVlxbtOKL24GN1WssMlPvEA3SiklO1T36i3PeYlD6x8fJo3ATdbL7SGZF
         vzdw36yqR4YAuE2WaadQc/h8Mkf3PxM6zsgLdhxsppFBK0Ycwv3Zt8A6ijnt5M8Y7Ai6
         pMrlGl5Ti1WRbpF/QV9KC8CpNvgTEx3ar39XbnmvcJbSCkV9vEVA3NYEqj8/Fjfasz7/
         hLEGl3JDXK/ioU+bN+vb9CRF84H+m1cWGvtb3Q8GkbjklYiGg4NrIGjn04eCvlANEhRP
         8WVw==
X-Forwarded-Encrypted: i=1; AJvYcCU6P4uUhbsM6NzKpvJhPFbiLcRhJsHRJPkQx0il1gHvGYkMGwjnvqinI9jR4ecaGltZfD2G6AQERGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtVEaDZf024krb0tdXeZgT+/EPQZXDFQvCuaIyxVq6fXMXMVF
	wQ7Y2K5I20jfNOZFEJ5/e314MeiVPaPUPsyXvMEbrlzIYTBE640I4Gx8
X-Gm-Gg: ATEYQzylBj4QKwqC6g8ldoRwNTcBU+X+5cqF1vxn4F2pqD1Ju9toxrKMwqeJ+bT7YmJ
	h5aja1vkBLHIznnl3+coJ44B242WHCRkEp64rX10o6R3aHdI4m9YTxV2R1Bz86fMWhBdZFBcVao
	H0wKi+GMcij3d0Upct4pCrzYU8Bv0Qd+hjFjYTTBxPc775rAs+teTG8EPcVsYYLw57Bwd5XXg00
	DD5viRSubYZfkYRcdoNtpw0TKLOoqxy5iXPlYS8iZUchfWu9TPHwzFJ7VjqHlkbb4u1rSDKkHZE
	Z1DQFWoUqRjbFC3JHYs/QrJnX98UBany1I1L2uHzrbF0TcY/H2rqvPBVCP5RjHzT45/hESftD0w
	P0v5LY0W0ZDxplWFWxM0VLz/WntsDayY12tGmSSRHEj6KytLaIK0reVpB9ybDL9o8Ql2qhWYxyW
	Arh50PJHjzQH7heCLaDrN2Mj4EbiN7aHo2JYulZVdMmigrdVFi
X-Received: by 2002:a05:6000:608:b0:43b:4489:d450 with SMTP id ffacd0b85a97d-43b527c52famr974355f8f.30.1773777418084;
        Tue, 17 Mar 2026 12:56:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:56:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Tue, 17 Mar 2026 19:56:33 +0000
Message-ID: <20260317195650.468330-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks may be left disabled
as the hardware state is not automatically restored. Unlike regular clocks
which are re-enabled by their respective drivers, critical clocks
(CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
must take responsibility for re-enabling them on resume.

Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
entries in a singly-linked list anchored at crit_clk_hw_head in
rzg2l_cpg_priv. Populate the list during module clock registration by
checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.

On resume, walk the list and re-enable any critical module clock that is
found to be disabled, before deasserting critical resets, ensuring the
correct clock-before-reset restore ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 8165c163143a..c2d31b93f62b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -130,6 +130,12 @@ struct div_hw_data {
 	u32 width;
 };
 
+/* Critical clk list  */
+struct rzg2l_crit_clk_hw {
+	struct clk_hw *hw;
+	struct rzg2l_crit_clk_hw *next;
+};
+
 #define to_div_hw_data(_hw)	container_of(_hw, struct div_hw_data, hw_data)
 
 struct rzg2l_pll5_param {
@@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
  * @info: Pointer to platform data
  * @genpd: PM domain
  * @mux_dsi_div_params: pll5 mux and dsi div parameters
+ * @crit_clk_hw_head: Head of the linked list critical clk entries
  */
 struct rzg2l_cpg_priv {
 	struct reset_controller_dev rcdev;
@@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
 	struct generic_pm_domain genpd;
 
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
+
+	struct rzg2l_crit_clk_hw *crit_clk_hw_head;
 };
 
+static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
+					   struct clk_hw *hw)
+{
+	struct rzg2l_crit_clk_hw *node;
+
+	node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	node->hw = hw;
+	node->next = priv->crit_clk_hw_head;
+	priv->crit_clk_hw_head = node;
+
+	return 0;
+}
+
 static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b)
 {
 	return (b + 1) << a;
@@ -1737,6 +1762,13 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
+	if (init.flags & CLK_IS_CRITICAL) {
+		if (rzg2l_cpg_add_crit_clk_hw_entry(priv, &clock->hw)) {
+			clk = ERR_PTR(-ENOMEM);
+			goto fail;
+		}
+	}
+
 	clk = clock->hw.clk;
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
@@ -2086,8 +2118,17 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	struct rzg2l_crit_clk_hw *node;
 	int ret;
 
+	for (node = priv->crit_clk_hw_head; node; node = node->next) {
+		if (!rzg2l_mod_clock_is_enabled(node->hw)) {
+			ret = rzg2l_mod_clock_endisable(node->hw, true);
+			if (ret)
+				return ret;
+		}
+	}
+
 	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
 	if (ret)
 		return ret;
-- 
2.43.0

