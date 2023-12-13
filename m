Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="uzf1TlTC"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631F1C9;
	Wed, 13 Dec 2023 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702493476;
	bh=H15gdOPlR0lE/ns/jtgSsygzR+9sxX1QcUqQffEwjvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uzf1TlTCHWYIDNHn3QnKs9Z/5SSs6cquF13oGb4f1/H85+wSn7lhmzL2Qcd+7Xwtm
	 h/8rigWBZA4470ocNgo1CgRiK4C/w5OE7E3I4LY4Cr/aDORXg8HbDOpWjZx2+u2Hya
	 +sJY34XfXwweIK1L1CoiGAstwotgmvM2B8FVSS2BJV8tie2ChQyw9zkbOySQKRhne7
	 D+J1nLlOwOESh93YG6cGIwcypG4xsnhVqHwMsJOkJWhExj4wk6meoAirQVtuPvbtyk
	 pY4pN1GzjngUo3VfQaohq9IsU9bz7+HsAavbVWucqCJiRyzHcVVIJXTRQsQqVP+qtY
	 bUS4n5SaG1x6Q==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A54EF378149B;
	Wed, 13 Dec 2023 18:51:16 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 351A64800CA; Wed, 13 Dec 2023 19:51:16 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Kever Yang <kever.yang@rock-chips.com>,
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
Subject: [PATCH v7 1/7] clk: rockchip: rk3588: fix CLK_NR_CLKS usage
Date: Wed, 13 Dec 2023 19:46:46 +0100
Message-ID: <20231213185114.47565-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213185114.47565-1-sebastian.reichel@collabora.com>
References: <20231213185114.47565-1-sebastian.reichel@collabora.com>
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
index 4059d9365ae6..043458b7c579 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -429,6 +429,23 @@ void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_plls);
 
+unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
+					   unsigned int nr_clk)
+{
+	unsigned int idx;
+	unsigned long max;
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

