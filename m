Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5950C15535B
	for <linux-clk@vger.kernel.org>; Sat,  1 Feb 2025 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426241; cv=none; b=a/jCNtF+mgxITqQ7ulLQD9uUnMWBbw0g2q9TKHD/XisWiOTJ0LEuPZNkcm6nHivZxl5eycdYUnH3LeIdvNEieTDiIqwSXl0jWgivN6hlN0ayiLQUOFp2BeA6BAR+BNpnOMwEyXiae9a8CzzEVPJ7pO/B0vuAqAzkS3zrGr+NyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426241; c=relaxed/simple;
	bh=UuFTOH855oug/yZ9nF1g+wqoTgLoigLvYCkoaQuCAjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2FhfpWZX3973S4vL5LO+tG3MgncEkGX0rNed9mmdaOfAK1dGGCwnLrePhT5WqY+uLxUl70RTCpPQE/bCGrUPqz/6SHZmqf8bO1SoOcd54AnsDjadMCh0TzU1KzYI3HqqglwUe54JvMo4UrDGx2bK8bQ8uyGD+wcZAAcMhDEKUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: xsD368QgS5mDYTNGl21MmQ==
X-CSE-MsgGUID: hVzhiz63Q/qK9+/q1GQq8w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Feb 2025 01:10:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 05A7C400628C;
	Sun,  2 Feb 2025 01:10:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: davinci: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 16:10:09 +0000
Message-ID: <20250201161018.41084-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify of_davinci_pll_init() by using of_get_available_child_by_name().

While at it, move of_node_put(child) inside the if block to avoid
additional check if of_child is NULL.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/davinci/pll.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 82727b1fc67a..75b01f79414d 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -763,13 +763,13 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 		return PTR_ERR(clk);
 	}
 
-	child = of_get_child_by_name(node, "pllout");
-	if (of_device_is_available(child))
+	child = of_get_available_child_by_name(node, "pllout");
+	if (child)
 		of_clk_add_provider(child, of_clk_src_simple_get, clk);
 	of_node_put(child);
 
-	child = of_get_child_by_name(node, "sysclk");
-	if (of_device_is_available(child)) {
+	child = of_get_available_child_by_name(node, "sysclk");
+	if (child) {
 		struct clk_onecell_data *clk_data;
 		struct clk **clks;
 		int n_clks =  max_sysclk_id + 1;
@@ -803,11 +803,11 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 				clks[(*div_info)->id] = clk;
 		}
 		of_clk_add_provider(child, of_clk_src_onecell_get, clk_data);
+		of_node_put(child);
 	}
-	of_node_put(child);
 
-	child = of_get_child_by_name(node, "auxclk");
-	if (of_device_is_available(child)) {
+	child = of_get_available_child_by_name(node, "auxclk");
+	if (child) {
 		char child_name[MAX_NAME_SIZE];
 
 		snprintf(child_name, MAX_NAME_SIZE, "%s_auxclk", info->name);
@@ -818,11 +818,12 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 				 child_name, PTR_ERR(clk));
 		else
 			of_clk_add_provider(child, of_clk_src_simple_get, clk);
+
+		of_node_put(child);
 	}
-	of_node_put(child);
 
-	child = of_get_child_by_name(node, "obsclk");
-	if (of_device_is_available(child)) {
+	child = of_get_available_child_by_name(node, "obsclk");
+	if (child) {
 		if (obsclk_info)
 			clk = davinci_pll_obsclk_register(dev, obsclk_info, base);
 		else
@@ -833,8 +834,8 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 				 PTR_ERR(clk));
 		else
 			of_clk_add_provider(child, of_clk_src_simple_get, clk);
+		of_node_put(child);
 	}
-	of_node_put(child);
 
 	return 0;
 }
-- 
2.43.0

