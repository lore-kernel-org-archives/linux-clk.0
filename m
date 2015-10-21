Return-Path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 2/5] clk: si5351: add missing of_node_put
Date: Wed, 21 Oct 2015 22:41:37 +0200
Message-Id: <1445460100-26727-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

for_each_child_of_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
(
   return child;
|
+  of_node_put(child);
?  return ...;
)
   ...
 }
// </smpl>

The resulting puts were manually moved to the end of the function for
conciseness.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk-si5351.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 5596c0a..e346b22 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1183,13 +1183,13 @@ static int si5351_dt_parse(struct i2c_client *client,
 		if (of_property_read_u32(child, "reg", &num)) {
 			dev_err(&client->dev, "missing reg property of %s\n",
 				child->name);
-			return -EINVAL;
+			goto put_child;
 		}
 
 		if (num >= 8 ||
 		    (variant == SI5351_VARIANT_A3 && num >= 3)) {
 			dev_err(&client->dev, "invalid clkout %d\n", num);
-			return -EINVAL;
+			goto put_child;
 		}
 
 		if (!of_property_read_u32(child, "silabs,multisynth-source",
@@ -1207,7 +1207,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 				dev_err(&client->dev,
 					"invalid parent %d for multisynth %d\n",
 					val, num);
-				return -EINVAL;
+				goto put_child;
 			}
 		}
 
@@ -1230,7 +1230,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 					dev_err(&client->dev,
 						"invalid parent %d for clkout %d\n",
 						val, num);
-					return -EINVAL;
+					goto put_child;
 				}
 				pdata->clkout[num].clkout_src =
 					SI5351_CLKOUT_SRC_CLKIN;
@@ -1239,7 +1239,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 				dev_err(&client->dev,
 					"invalid parent %d for clkout %d\n",
 					val, num);
-				return -EINVAL;
+				goto put_child;
 			}
 		}
 
@@ -1256,7 +1256,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 				dev_err(&client->dev,
 					"invalid drive strength %d for clkout %d\n",
 					val, num);
-				return -EINVAL;
+				goto put_child;
 			}
 		}
 
@@ -1283,7 +1283,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 				dev_err(&client->dev,
 					"invalid disable state %d for clkout %d\n",
 					val, num);
-				return -EINVAL;
+				goto put_child;
 			}
 		}
 
@@ -1296,6 +1296,9 @@ static int si5351_dt_parse(struct i2c_client *client,
 	client->dev.platform_data = pdata;
 
 	return 0;
+put_child:
+	of_node_put(child);
+	return -EINVAL;
 }
 #else
 static int si5351_dt_parse(struct i2c_client *client, enum si5351_variant variant)
