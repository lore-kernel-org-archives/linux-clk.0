Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF80820B29;
	Fri, 26 Jan 2024 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293765; cv=none; b=nzs3puja36LWrmnH5th5vbfQyT66wV1m8P4MS2jghCmqqDrrrsq7O8SPdkkBQ4BA+QAZmQBZo9UsoVNnZ7lZR/s0A9ElcRIEJtD/Oq4b7yfKb+SgP/W/1GUYA89GLA6ZjuE3WTRsprJA1KzQ9kMWclFoimeTvc/NISsCDVY9Ja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293765; c=relaxed/simple;
	bh=2n9PipAmeHqJwOVMkEkqIqxneWxYWA+hFsQHqev4W4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsXNedp4bw3ZbQTiNW7bU7bJC1eGY1aZ9NKjVmRULqbhNTtwfXjU3BxT5HqhXDQZ4QWKqu11VILO+OnLem0NEUf01M1xwKBCO5eHjbkGG95T8s4UFFfRsAGFh3KKzJjbG7GMnElsATUXoFTxoQcEc4LVl8w2ArOFeahCHMm7EIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aRVs7Rii; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aRVs7Rii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706293762;
	bh=2n9PipAmeHqJwOVMkEkqIqxneWxYWA+hFsQHqev4W4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aRVs7Rii5ElUaOxTaXrEfFAShkE7yAzXJASBBruDy/zSGWx+c/vVAiqI8vxB0z0HZ
	 VC9I/nvECaQn3sp/mZ33p+S8A8mRl5DLn9kjUq+knWfq28wY96+lUKvPkUFlxoL7WZ
	 2JHv+9b/tuP4Koi+Ix4btpTALVcWhTLZei1TbhixGjhJvM+5OuDGJT0sfXdJY2TBUZ
	 hLUmuo4Af9QxCG95ykGY6iXwZVUd+AnBqx+s/bpUeZDzQ7KSSiH0YmBhplDsJ73uxq
	 +kLxMUjALDkNnYMpkLc19VS7eqIG1XFYmKYyXV53ast34kgaR5yJhLgWHo4ml8+cyV
	 Qm6Pzaq35XUXw==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F03A23782072;
	Fri, 26 Jan 2024 18:29:21 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 92EB4480C4B; Fri, 26 Jan 2024 19:29:21 +0100 (CET)
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
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v8 1/7] clk: rockchip: rk3588: fix CLK_NR_CLKS usage
Date: Fri, 26 Jan 2024 19:18:22 +0100
Message-ID: <20240126182919.48402-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126182919.48402-1-sebastian.reichel@collabora.com>
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CLK_NR_CLKS is not part of the DT bindings and needs to be removed
from it, just like it recently happened for other platforms. This
takes care of it by introducing a new function identifying the
maximum used clock ID at runtime.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c |  5 ++++-
 drivers/clk/rockchip/clk.c        | 17 +++++++++++++++++
 drivers/clk/rockchip/clk.h        |  2 ++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 6994165e0395..0b60ae78f9d8 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2458,15 +2458,18 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 static void __init rk3588_clk_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
+	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
 
+	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3588_clk_branches,
+					ARRAY_SIZE(rk3588_clk_branches)) + 1;
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
 		pr_err("%s: could not map cru region\n", __func__);
 		return;
 	}
 
-	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
+	ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
 		iounmap(reg_base);
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 4059d9365ae6..73d2cbdc716b 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -429,6 +429,23 @@ void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_plls);
 
+unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
+					   unsigned int nr_clk)
+{
+	unsigned long max = 0;
+	unsigned int idx;
+
+	for (idx = 0; idx < nr_clk; idx++, list++) {
+		if (list->id > max)
+			max = list->id;
+		if (list->child && list->child->id > max)
+			max = list->id;
+	}
+
+	return max;
+}
+EXPORT_SYMBOL_GPL(rockchip_clk_find_max_clk_id);
+
 void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk)
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 758ebaf2236b..fd3b476dedda 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -973,6 +973,8 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks);
 void rockchip_clk_of_add_provider(struct device_node *np,
 				struct rockchip_clk_provider *ctx);
+unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
+					   unsigned int nr_clk);
 void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk);
-- 
2.43.0

