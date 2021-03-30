Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FE0C433EB
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 20:53:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F1F2619C5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 20:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhC3Uwh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Mar 2021 16:52:37 -0400
Received: from st43p00im-ztfb10073301.me.com ([17.58.63.186]:41879 "EHLO
        st43p00im-ztfb10073301.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232646AbhC3UwV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Mar 2021 16:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1617137540; bh=xxba6mHR2dCb2XUZvdfSUyuVZbTapNyVZRz8gGMq7p8=;
        h=From:To:Subject:Date:Message-Id;
        b=qgnbj+U+3qyGrqZirTM5FLFXIw7kpivaZTOVj3vc+0hj1C3F3tsvBJCPitwJq9ejV
         ZHmzREDH5Izqo/O+Lmc/7kr9RgJodO01t2QkmnWSy1cJXqFC6dUdhh550bkPToUFJx
         +9E/4ZtiSDGTC9pfZkecueKdxRsOxOrjPIAimaNxQX0VL1cL5I6+FEaMn5DwgL7q4N
         RgVFyBNejv8QmOP8JgE78j43YV9u4THuq6+rUZV3PbEXa1SL09Ukj8MKuSfj++DsHQ
         DmNJFBF+pNfhPMIYtyQFYxx63u8GYrN/SLWdFuY3zjL2kDgA1szqJdvsllAWbVHG/V
         te/lLrJgiWakQ==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-ztfb10073301.me.com (Postfix) with ESMTPSA id 078662A0692;
        Tue, 30 Mar 2021 20:52:17 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [PATCH v3 5/7] dt-bindings: clock: st: clkgen-pll: add new introduced compatible
Date:   Tue, 30 Mar 2021 22:51:23 +0200
Message-Id: <20210330205125.25708-6-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330205125.25708-1-avolmat@me.com>
References: <20210330205125.25708-1-avolmat@me.com>
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.369,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-03-30=5F12:2021-03-30=5F01,2021-03-30=5F12,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103300152
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

New compatible are added, supporting various kind of clkgen-pll
used for STiH407, STiH410 and STiH418

Signed-off-by: Alain Volmat <avolmat@me.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
index f207053e0550..d0fa1e02d06d 100644
--- a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
@@ -10,7 +10,10 @@ Required properties:
 
 - compatible : shall be:
 	"st,clkgen-pll0"
+	"st,clkgen-pll0-a0"
+	"st,clkgen-pll0-c0"
 	"st,clkgen-pll1"
+	"st,clkgen-pll1-c0"
 	"st,stih407-clkgen-plla9"
 	"st,stih418-clkgen-plla9"
 
-- 
2.17.1

