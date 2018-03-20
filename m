Return-Path: <sudeep.holla@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: scmi: use devm_of_clk_add_hw_provider() API and drop scmi_clocks_remove
Date: Tue, 20 Mar 2018 12:11:07 +0000
Message-Id: <1521547867-23808-1-git-send-email-sudeep.holla@arm.com>
In-Reply-To: <1519403030-21189-17-git-send-email-sudeep.holla@arm.com>
References: <1519403030-21189-17-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-clk.vger.kernel.org>

Commit aa795c41d9cd ("clk: Add devm_of_clk_add_hw_provider()/del_provider()
APIs") adds devm_of_clk_add_hw_provider which takes care of deleting the
clock provider when the clock providers device is removed.

This patch makes use of devm_of_clk_add_hw_provider() instead of
of_clk_add_hw_provider() so that we can eliminate the need of explicit
scmi_clocks_remove for just doing of_clk_del_provider()

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/clk/clk-scmi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 26f1476d4a79..488c21376b55 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -172,15 +172,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		}
 	}

-	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-}
-
-static void scmi_clocks_remove(struct scmi_device *sdev)
-{
-	struct device *dev = &sdev->dev;
-	struct device_node *np = dev->of_node;
-
-	of_clk_del_provider(np);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   clk_data);
 }

 static const struct scmi_device_id scmi_id_table[] = {
@@ -192,7 +185,6 @@ MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 static struct scmi_driver scmi_clocks_driver = {
 	.name = "scmi-clocks",
 	.probe = scmi_clocks_probe,
-	.remove = scmi_clocks_remove,
 	.id_table = scmi_id_table,
 };
 module_scmi_driver(scmi_clocks_driver);
--
2.7.4
