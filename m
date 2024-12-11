Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407DC1DE4D4;
	Wed, 11 Dec 2024 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936409; cv=none; b=fuc+FBgLbe3RRRcdrH7DFdy9EnEMcYRkkzXL7/gjbqPdUvwV5AkDpdJ26WLFzGphtHiXzoXgnZBF/Dscuq+FuiO5MXpFUkfNOhSUc2uy2/WDmp2d+nWcUuvrtRz5rXWvsChSlkh9x4RYlyTqoIaFHFH6TxO82gvDa0mTxokGF7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936409; c=relaxed/simple;
	bh=wscIrGbAnnlwwmBenRu9NQ9zTdMnj0cQssdU+EELuq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YA3IBswnh2tk7YdLtAPglfmZDM5/eKU/Jfx3hs3iLZjw0m4N9TZpUIO3cBlCwfXlLRDbKV4mpG25SAiIYLWuzQVGq7egOkbsbGtTRrTrW25FaSjAyQDs0vEgW5fR37jUPnI7VJRD8DEITE8c+xAr+Y+uYr+SChXLcwk12j5lte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YaSvZPCD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YaSvZPCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733936399;
	bh=wscIrGbAnnlwwmBenRu9NQ9zTdMnj0cQssdU+EELuq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YaSvZPCDh5d+JN8T+LubgKK74yeYa41ieMmqcGrTVsh0ZwK7WQrBmR8aCGpcXcxR1
	 ux+TEGkptFixBYg3M0Q35YMMJy3AgRTJ/gHwOnPzjhE0bKT8ASiro+jeddUO84QdbR
	 s/85Guq08/kaK1UUTRLOpEKlgCjwwxyZK9/vS7rjt2PDk50jJXQW6/aKtp46f/k9bk
	 mlGhKJ9zsNHAd3fjXuJrhzBuM0ROHyCiTzgeuKrtBaAgXxBCduQDAXucr6RM8NQGne
	 hs/KVoDA14xqNVLCk+Xag2YtIPOIDgsNzPQJMJN3/NnobfBfMmC7ppgEajPNF66ToO
	 nrE0oMaN0myug==
Received: from jupiter.universe (dyndsl-091-248-215-089.ewe-ip-backbone.de [91.248.215.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D90017E37C0;
	Wed, 11 Dec 2024 17:59:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7E6FA48CC8D; Wed, 11 Dec 2024 17:59:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v12 3/5] clk: rockchip: expose rockchip_clk_set_lookup
Date: Wed, 11 Dec 2024 17:58:52 +0100
Message-ID: <20241211165957.94922-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211165957.94922-1-sebastian.reichel@collabora.com>
References: <20241211165957.94922-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rockchip_clk_add_lookup to clk.h, so that it can be used
by sub-devices with their own driver. These might also have to
do a lookup, so rename the function to rockchip_clk_set_lookup
and add a matching rockchip_clk_get_lookup.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.c | 14 ++++----------
 drivers/clk/rockchip/clk.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 45214607467e..90eb651f1425 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -197,12 +197,6 @@ static void rockchip_fractional_approximation(struct clk_hw *hw,
 	clk_fractional_divider_general_approximation(hw, rate, parent_rate, m, n);
 }
 
-static void rockchip_clk_add_lookup(struct rockchip_clk_provider *ctx,
-				    struct clk *clk, unsigned int id)
-{
-	ctx->clk_data.clks[id] = clk;
-}
-
 static struct clk *rockchip_clk_register_frac_branch(
 		struct rockchip_clk_provider *ctx, const char *name,
 		const char *const *parent_names, u8 num_parents,
@@ -292,7 +286,7 @@ static struct clk *rockchip_clk_register_frac_branch(
 			return mux_clk;
 		}
 
-		rockchip_clk_add_lookup(ctx, mux_clk, child->id);
+		rockchip_clk_set_lookup(ctx, mux_clk, child->id);
 
 		/* notifier on the fraction divider to catch rate changes */
 		if (frac->mux_frac_idx >= 0) {
@@ -451,7 +445,7 @@ void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 			continue;
 		}
 
-		rockchip_clk_add_lookup(ctx, clk, list->id);
+		rockchip_clk_set_lookup(ctx, clk, list->id);
 	}
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_plls);
@@ -613,7 +607,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 			continue;
 		}
 
-		rockchip_clk_add_lookup(ctx, clk, list->id);
+		rockchip_clk_set_lookup(ctx, clk, list->id);
 	}
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_branches);
@@ -637,7 +631,7 @@ void rockchip_clk_register_armclk(struct rockchip_clk_provider *ctx,
 		return;
 	}
 
-	rockchip_clk_add_lookup(ctx, clk, lookup_id);
+	rockchip_clk_set_lookup(ctx, clk, lookup_id);
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_armclk);
 
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 4c6e2c931f8e..d9e071ca9c5d 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -1022,6 +1022,18 @@ struct rockchip_clk_branch {
 #define SGRF_GATE(_id, cname, pname)				\
 		FACTOR(_id, cname, pname, 0, 1, 1)
 
+static inline struct clk *rockchip_clk_get_lookup(struct rockchip_clk_provider *ctx,
+						  unsigned int id)
+{
+	return ctx->clk_data.clks[id];
+}
+
+static inline void rockchip_clk_set_lookup(struct rockchip_clk_provider *ctx,
+					   struct clk *clk, unsigned int id)
+{
+	ctx->clk_data.clks[id] = clk;
+}
+
 struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks);
 struct rockchip_clk_provider *rockchip_clk_init_early(struct device_node *np,
-- 
2.45.2

