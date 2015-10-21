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
Subject: [PATCH 1/5] clk: add missing of_node_put
Date: Wed, 21 Oct 2015 22:41:36 +0200
Message-Id: <1445460100-26727-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

for_each_matching_node_and_match performs an of_node_get on each iteration,
so a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression e1,e2,e;
local idexpression np;
@@

 for_each_matching_node_and_match(np, e1, e2) {
   ... when != of_node_put(np)
       when != e = np
(
   return np;
|
+  of_node_put(np);
?  return ...;
)
   ...
 }
// </smpl>

Besides the problem identified by the semantic patch, this patch adds an
of_node_get in front of saving np in a field of parent, to account for the
fact that this value will be put on going on to the next element in the
iteration, and then adds of_node_puts in the two loops where the parent
pointer can be freed.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e735eab..11babd1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3200,12 +3200,15 @@ void __init of_clk_init(const struct of_device_id *matches)
 			list_for_each_entry_safe(clk_provider, next,
 						 &clk_provider_list, node) {
 				list_del(&clk_provider->node);
+				of_node_put(clk_provider->np);
 				kfree(clk_provider);
 			}
+			of_node_put(np);
 			return;
 		}
 
 		parent->clk_init_cb = match->data;
+		of_node_get(np);
 		parent->np = np;
 		list_add_tail(&parent->node, &clk_provider_list);
 	}
@@ -3220,6 +3223,7 @@ void __init of_clk_init(const struct of_device_id *matches)
 				of_clk_set_defaults(clk_provider->np, true);
 
 				list_del(&clk_provider->node);
+				of_node_put(clk_provider->np);
 				kfree(clk_provider);
 				is_init_done = true;
 			}
