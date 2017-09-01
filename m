Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] clk: tegra: Use tegra_clk_register_periph_data()
Date: Fri,  1 Sep 2017 16:53:42 +0200
Message-Id: <20170901145343.19890-3-thierry.reding@gmail.com>
In-Reply-To: <20170901145343.19890-1-thierry.reding@gmail.com>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Instead of open-coding the same pattern repeatedly, reuse the newly
introduced tegra_clk_register_periph_data() helper that will unpack
the initialization structure.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 5 +----
 drivers/clk/tegra/clk-tegra114.c     | 4 +---
 drivers/clk/tegra/clk-tegra20.c      | 4 +---
 drivers/clk/tegra/clk-tegra30.c      | 4 +---
 4 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 848255cc0209..090a5d792341 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -927,10 +927,7 @@ static void __init periph_clk_init(void __iomem *clk_base,
 			continue;
 
 		data->periph.gate.regs = bank;
-		clk = tegra_clk_register_periph(data->name,
-			data->p.parent_names, data->num_parents,
-			&data->periph, clk_base, data->offset,
-			data->flags);
+		clk = tegra_clk_register_periph_data(clk_base, data);
 		*dt_clk = clk;
 	}
 }
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index fd1a99c05c2d..63087d17c3e2 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1092,9 +1092,7 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 
 	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
 		data = &tegra_periph_clk_list[i];
-		clk = tegra_clk_register_periph(data->name,
-			data->p.parent_names, data->num_parents,
-			&data->periph, clk_base, data->offset, data->flags);
+		clk = tegra_clk_register_periph_data(clk_base, data);
 		clks[data->clk_id] = clk;
 	}
 
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 837e5cbd60e9..2b839cb24436 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -850,9 +850,7 @@ static void __init tegra20_periph_clk_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
 		data = &tegra_periph_clk_list[i];
-		clk = tegra_clk_register_periph(data->name, data->p.parent_names,
-				data->num_parents, &data->periph,
-				clk_base, data->offset, data->flags);
+		clk = tegra_clk_register_periph_data(clk_base, data);
 		clks[data->clk_id] = clk;
 	}
 
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index a2d163f759b4..98e8a55e4e1c 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1079,9 +1079,7 @@ static void __init tegra30_periph_clk_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
 		data = &tegra_periph_clk_list[i];
-		clk = tegra_clk_register_periph(data->name, data->p.parent_names,
-				data->num_parents, &data->periph,
-				clk_base, data->offset, data->flags);
+		clk = tegra_clk_register_periph_data(clk_base, data);
 		clks[data->clk_id] = clk;
 	}
 
-- 
2.13.3
