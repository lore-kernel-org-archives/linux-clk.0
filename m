Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 6/6] soc: rockchip: power-domain: check the existing of regmap
Date: Mon, 15 Feb 2016 11:33:57 +0800
Message-Id: <1455507237-13161-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Check return value of syscon_node_to_regmap for
rockchip_pm_domain_probe. If err value is returned, probe
procedure should abort.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/soc/rockchip/pm_domains.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/rockchip/pm_domains.c b/drivers/soc/rockchip/pm_domains.c
index 534c589..3c4a44d 100644
--- a/drivers/soc/rockchip/pm_domains.c
+++ b/drivers/soc/rockchip/pm_domains.c
@@ -402,6 +402,10 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	}
 
 	pmu->regmap = syscon_node_to_regmap(parent->of_node);
+	if (IS_ERR(pmu->regmap)) {
+		dev_err(dev, "no regmap available\n");
+		return -ENODEV;
+	}
 
 	/*
 	 * Configure power up and down transition delays for CORE
-- 
2.3.7
