Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8331B815;
	Mon, 25 Mar 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395375; cv=none; b=IHFEXwYhpX2V0bTpy6vrdzTDP+fQ91n474b0j+IplygfQhMZrY+3avqWQW0XNJzbc04OV0FmN5Vg88X/P/HHiBUrkJ7R83Kv0guWnX3mTq+Z7DDmgBsbC1XgNvBWPO5YEMPZT0JCcXDPdtQt/rIVvqDCAp6d0YvaIZAW5hpHg2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395375; c=relaxed/simple;
	bh=nt9v0s2RYGIxt7Tz/WeZjUBZ7veA0ms2cejOmDNes+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKXzDclno8ogXoUDiQmh2MeADlWsWcAd3sXZ+smYPHHsssog+z2lo16xF/Lzuki6DuIyS1go14hGmNHxBAbJunM3Oc82nSOHDSJaDog+NvRZSMcnA31PjtZdUoWBi1VpgTtD+w6vvXosBShvhCg6wOFSSZrKC03DBFegsZyCWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xGRNemES; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xGRNemES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711395371;
	bh=nt9v0s2RYGIxt7Tz/WeZjUBZ7veA0ms2cejOmDNes+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xGRNemESxwFY4ZNY9LOmZQM08s6kfcpJihlJqGBsoB5EO0iWXtG85TsTEbMB3pTiL
	 lQe/rFCsPIQ3RHmNBGP1H64JiwrCfL29Q3x7KnUmys6vNLcMwH+iwUZ6/ruVi5FW2/
	 FjwBJDYL7BX0B3wX0gJbNA1r5pzjnQ18yzmJIQZlFFxDSt8ayKd3hexczUCzxHYbTQ
	 0NCiWuQqmWetsQjEnbBpOeoUe26hy57cL2V4KwtcjJEW3DXG2JZDXo+OjYeIhgE10B
	 N0Ru94oaRCj3MpXypTRsnZuwq1l2Tm1lSHhSQ+DnL++eSIKVDDQ1glwXVkIs8XYahH
	 mt35gdLzHK04Q==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 894CB37820F1;
	Mon, 25 Mar 2024 19:36:11 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1664D4800D1; Mon, 25 Mar 2024 20:36:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
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
Subject: [PATCH v9 4/7] clk: rockchip: expose rockchip_clk_set_lookup
Date: Mon, 25 Mar 2024 20:33:35 +0100
Message-ID: <20240325193609.237182-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325193609.237182-1-sebastian.reichel@collabora.com>
References: <20240325193609.237182-1-sebastian.reichel@collabora.com>
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
and add a matching rockchip_clk_add_lookup.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.c | 14 ++++----------
 drivers/clk/rockchip/clk.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 31b7cc243d82..ef2408f10f39 100644
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
@@ -424,7 +418,7 @@ void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 			continue;
 		}
 
-		rockchip_clk_add_lookup(ctx, clk, list->id);
+		rockchip_clk_set_lookup(ctx, clk, list->id);
 	}
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_plls);
@@ -585,7 +579,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 			continue;
 		}
 
-		rockchip_clk_add_lookup(ctx, clk, list->id);
+		rockchip_clk_set_lookup(ctx, clk, list->id);
 	}
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_branches);
@@ -609,7 +603,7 @@ void rockchip_clk_register_armclk(struct rockchip_clk_provider *ctx,
 		return;
 	}
 
-	rockchip_clk_add_lookup(ctx, clk, lookup_id);
+	rockchip_clk_set_lookup(ctx, clk, lookup_id);
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_armclk);
 
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index fd3b476dedda..e39392e1c2a2 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -969,6 +969,18 @@ struct rockchip_clk_branch {
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
 void rockchip_clk_of_add_provider(struct device_node *np,
-- 
2.43.0

