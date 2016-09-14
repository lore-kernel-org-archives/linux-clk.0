Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:64320 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754369AbcINUDH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Sep 2016 16:03:07 -0400
Subject: [PATCH 3/4] clk/Renesas-MSTP: Less function calls in
 cpg_mstp_clocks_init() after error detection
To: linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Julia Lawall <julia.lawall@lip6.fr>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <b945de99-815a-b380-e13c-17b01e0febad@users.sourceforge.net>
Date: Wed, 14 Sep 2016 22:03:02 +0200
MIME-Version: 1.0
In-Reply-To: <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 21:30:27 +0200

The kfree() function was called in up to two cases
by the cpg_mstp_clocks_init() function during error handling even if
the passed variable contained a null pointer.

* Split a condition check for memory allocation failures so that
  each pointer from these function calls will be checked immediately.

  See also background information:
  Topic "CWE-754: Improper check for unusual or exceptional conditions"
  Link: https://cwe.mitre.org/data/definitions/754.html

* Return directly after a call of the function "kzalloc" failed
  at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/renesas/clk-mstp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 1fdc44b..6c82e0e 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -167,10 +167,12 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	unsigned int i;
 
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return;
+
 	clks = kmalloc_array(MSTP_MAX_CLOCKS, sizeof(*clks), GFP_KERNEL);
-	if (group == NULL || clks == NULL) {
+	if (!clks) {
 		kfree(group);
-		kfree(clks);
 		return;
 	}
 
-- 
2.10.0

