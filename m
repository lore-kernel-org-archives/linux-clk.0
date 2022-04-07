Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E90C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 13:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241600AbiDGNcP convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 09:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239740AbiDGNcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 09:32:13 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE32BBA0
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 06:30:11 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237DQoH6010307;
        Thu, 7 Apr 2022 09:30:03 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3f6gb7pbcq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 09:30:03 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 237DU2MG048028
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Apr 2022 09:30:02 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 7 Apr 2022 09:30:01 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 7 Apr 2022 09:30:01 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 7 Apr 2022 09:30:01 -0400
Received: from nsa.ad.analog.com ([10.44.3.67])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 237DTsKW026152;
        Thu, 7 Apr 2022 09:29:56 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 0/4] Dynamic OF and use after free related fixes
Date:   Thu, 7 Apr 2022 15:30:32 +0200
Message-ID: <20220407133036.213217-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: BmBjb0gHtxjHZxwuKiPHVLhQ1U1WGw3S
X-Proofpoint-ORIG-GUID: BmBjb0gHtxjHZxwuKiPHVLhQ1U1WGw3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_02,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=440
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011 bulkscore=7
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=7 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070065
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series is a collection of fixes with things I encountered when
handling a system with device tree overlays "fun". This effectively means
removing and adding devices which led to me the found issues.

patch 1 is fairly straight and indeed an issue related with of_nodes not
being put.

For patches 2 and 3, they are only triggered if someone first removes the
provider which is a dumb thing to do. However, I guess we should be
prepared for that and the framework even has some efforts to deal with
these cases (eg: clk_nodrv_ops). That said, patch 2 is more or less
straight (even though catching the guilty line wasn't), we add something
to a list during resgister, we need to remove it on the unregister path.
Patch 3 is a different beast... though I think krefs are the proper solution
here, I'm not sure I covered all the corner cases with all the reparenting
that might happen (mainly reason why this is RFC). Nullyfing
clk_core->parent during unregister might suffice but I'm more in favor of
proper refcounting (for now at least). Patch 3 also does not have a fixes
tag because I genuily don't know when this became a problem. Maybe right
from the beginning?

Patch 4 is just a minor improvement and not really a fix...

Nuno Sá (4):
  clk: clk-conf: properly release of nodes
  clk: fix clk not being unlinked from consumers list
  clk: refcount the active parent clk_core
  clk: use clk_core_unlink_consumer() helper

 drivers/clk/clk-conf.c | 18 +++++++--
 drivers/clk/clk.c      | 83 +++++++++++++++++++++++++++---------------
 2 files changed, 67 insertions(+), 34 deletions(-)

-- 
2.35.1

