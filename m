Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD2FC43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 06:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8A74217D9
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 06:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfBRGwe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 01:52:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:39156 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725836AbfBRGwe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Feb 2019 01:52:34 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id B7EF4D9B77C58F3AC6D6;
        Mon, 18 Feb 2019 14:52:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.408.0; Mon, 18 Feb 2019 14:52:21 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] clk: tegra: dfll: Make symbol 'tegra210_cpu_cvb_tables' static
Date:   Mon, 18 Feb 2019 07:06:09 +0000
Message-ID: <20190218070609.167535-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following sparse warning:

drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:244:18: warning:
 symbol 'tegra210_cpu_cvb_tables' was not declared. Should it be static?

Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 4b6dd2b3767f..e8ec42bf8638 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -241,7 +241,7 @@ static const unsigned long tegra210_cpu_max_freq_table[] = {
 		{          0UL,	{       0, 0, 0 } }, \
 	}
 
-struct cvb_table tegra210_cpu_cvb_tables[] = {
+static struct cvb_table tegra210_cpu_cvb_tables[] = {
 	{
 		.speedo_id = 10,
 		.process_id = 0,



