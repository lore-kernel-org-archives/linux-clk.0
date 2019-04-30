Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F265CC43219
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 14:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB4632147A
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 14:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfD3OoS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 10:44:18 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:60272 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726053AbfD3OoS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Apr 2019 10:44:18 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3UEYMpo014757;
        Tue, 30 Apr 2019 09:44:14 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2s4mg1mb9x-1;
        Tue, 30 Apr 2019 09:44:14 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail3.cirrus.com (Postfix) with ESMTP id 4CE3B611C8B1;
        Tue, 30 Apr 2019 09:44:47 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 30 Apr
 2019 15:44:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 30 Apr 2019 15:44:13 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 015BB2A1;
        Tue, 30 Apr 2019 15:44:13 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <sboyd@kernel.org>
CC:     <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 1/2] clk: Ensure new parent is looked up when changing parents
Date:   Tue, 30 Apr 2019 15:44:11 +0100
Message-ID: <20190430144412.20950-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=602 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300092
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_core_fill_parent_index is called from clk_mux_determine_rate_flags
and for the initial parent of the clock but seems to not get called on
the path changing a clocks parent. This can cause a clock parent change
to fail, fix this by adding a call in clk_fetch_parent_index.

Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ffd33b63c37eb..5aa180180ee95 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1601,6 +1601,9 @@ static int clk_fetch_parent_index(struct clk_core *core,
 		return -EINVAL;
 
 	for (i = 0; i < core->num_parents; i++) {
+		if (!core->parents[i].core)
+			clk_core_fill_parent_index(core, i);
+
 		if (core->parents[i].core == parent)
 			return i;
 
-- 
2.11.0

