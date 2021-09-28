Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D134C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 10:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8282260F21
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 10:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240182AbhI1KTP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 06:19:15 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:45282 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240119AbhI1KTO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 06:19:14 -0400
X-Greylist: delayed 1603 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Sep 2021 06:19:14 EDT
Received: from [185.56.157.72] (port=34972 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mV9lD-005oRW-Dd; Tue, 28 Sep 2021 11:50:51 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] clk: vc5: Use i2c .probe_new
Date:   Tue, 28 Sep 2021 11:50:41 +0200
Message-Id: <20210928095041.17116-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The old .probe is "soon to be deprecated". Use the new, simpler form.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 drivers/clk/clk-versaclock5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index c6d3b1ab3d55..e7be3e54b9be 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -905,7 +905,7 @@ static int vc5_get_output_config(struct i2c_client *client,
 
 static const struct of_device_id clk_vc5_of_match[];
 
-static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int vc5_probe(struct i2c_client *client)
 {
 	unsigned int oe, sd, src_mask = 0, src_val = 0;
 	struct vc5_driver_data *vc5;
@@ -1244,7 +1244,7 @@ static struct i2c_driver vc5_driver = {
 		.pm	= &vc5_pm_ops,
 		.of_match_table = clk_vc5_of_match,
 	},
-	.probe		= vc5_probe,
+	.probe_new	= vc5_probe,
 	.remove		= vc5_remove,
 	.id_table	= vc5_id,
 };
-- 
2.33.0

