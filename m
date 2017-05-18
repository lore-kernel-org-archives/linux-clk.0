Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:34154 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754521AbdERQTj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 May 2017 12:19:39 -0400
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: scpi: fix return type of __scpi_dvfs_round_rate
Date: Thu, 18 May 2017 17:19:28 +0100
Message-Id: <1495124368-26191-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The frequencies above the maximum value of signed integer(i.e. 2^31 -1)
will overflow with the current code.

This patch fixes the return type of __scpi_dvfs_round_rate from 'int'
to 'unsigned long'.

Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/clk/clk-scpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Hi,

Sorry for the stupid bug, just noticed the issue running on software
models with the frequency of 2.4 GHz. Not noticed so far as never ran
this on a system above 1.2 GHz so far :(

Regards,
Sudeep

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 96d37175d0ad..8ad458b5ad6e 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -71,15 +71,15 @@ static const struct clk_ops scpi_clk_ops = {
 };

 /* find closest match to given frequency in OPP table */
-static int __scpi_dvfs_round_rate(struct scpi_clk *clk, unsigned long rate)
+static long __scpi_dvfs_round_rate(struct scpi_clk *clk, unsigned long rate)
 {
 	int idx;
-	u32 fmin = 0, fmax = ~0, ftmp;
+	unsigned long fmin = 0, fmax = ~0, ftmp;
 	const struct scpi_opp *opp = clk->info->opps;

 	for (idx = 0; idx < clk->info->count; idx++, opp++) {
 		ftmp = opp->freq;
-		if (ftmp >= (u32)rate) {
+		if (ftmp >= rate) {
 			if (ftmp <= fmax)
 				fmax = ftmp;
 			break;
--
2.7.4

