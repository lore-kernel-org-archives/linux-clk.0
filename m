Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3586FCCA480
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiFWMTW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiFWMTV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:19:21 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CFC1A6
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:19:21 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N9JMq8026059;
        Thu, 23 Jun 2022 08:19:12 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gs8j63shp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jun 2022 08:19:12 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25NCJBEA023746
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jun 2022 08:19:11 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 23 Jun
 2022 08:19:10 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 23 Jun 2022 08:19:10 -0400
Received: from NSA-L01.ad.analog.com ([10.32.224.71])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25NCJ2ao026429;
        Thu, 23 Jun 2022 08:19:05 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RESEND RFC PATCH v2 0/4] Dynamic OF and use after free related fixes
Date:   Thu, 23 Jun 2022 14:18:53 +0200
Message-ID: <20220623121857.886-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 3mxXS2bAaO9El4cmpWiHtc4-UzKLVX9t
X-Proofpoint-GUID: 3mxXS2bAaO9El4cmpWiHtc4-UzKLVX9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=761 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230050
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series is a collection of fixes with things I encountered when
handling a system with device tree overlays "fun". This effectively
means
removing and adding devices which led to me the found issues.

patch 1 is fairly straight and indeed an issue related with of_nodes not
being put.

For patches 2 and 3, they are only triggered if someone first removes
the provider which is a dumb thing to do. However, I guess we should be
prepared for that and the framework even has some efforts to deal with
these cases (eg: clk_nodrv_ops). That said, patch 2 is more or less
straight (even though catching the guilty line wasn't), we add something
to a list during resgister, we need to remove it on the unregister path.
Patch 3 is a different beast... though I think krefs are the proper
solution here, I'm not sure I covered all the corner cases with all the
reparenting that might happen (mainly reason why this is RFC). Nullyfing
clk_core->parent during unregister might suffice but I'm more in favor
of proper refcounting (for now at least). Patch 3 also does not have a
fixes tag because I genuily don't know when this became a problem. Maybe
right from the beginning?

Patch 4 is just a minor improvement and not really a fix...

v2:
 * add an helper function in '__set_clk_parents()' to set each parent
separately;
 * massaged commit message in patch 2/4
("clk: fix clk not being unlinked from consumers list") as per Stephen
feedback.

Nuno Sá (4):
  clk: clk-conf: properly release of nodes
  clk: fix clk not being unlinked from consumers list
  clk: refcount the active parent clk_core
  clk: use clk_core_unlink_consumer() helper

 drivers/clk/clk-conf.c | 126 +++++++++++++++++++++++++----------------
 drivers/clk/clk.c      |  83 +++++++++++++++++----------
 2 files changed, 131 insertions(+), 78 deletions(-)

-- 
2.17.1

