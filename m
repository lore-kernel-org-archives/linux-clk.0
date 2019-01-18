Return-Path: <SRS0=hvdj=P2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2C5C43444
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FAD020652
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gvG8stg2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfARNRT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jan 2019 08:17:19 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36259 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfARNRP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jan 2019 08:17:15 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190118131713euoutp02a318c799b5fb98a7b76602b6079cd895~688FjL9pC1058110581euoutp02R
        for <linux-clk@vger.kernel.org>; Fri, 18 Jan 2019 13:17:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190118131713euoutp02a318c799b5fb98a7b76602b6079cd895~688FjL9pC1058110581euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1547817433;
        bh=v259pxNOA+ldScCU2PS9WMmlIqLRFNp7CjAhA2pWsL8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gvG8stg2yicIkwUSY9D/c6tIdsAMQ6GLp34j1bL9fgNbkylKla1A0cYvHtAPgSC5s
         ldXp0Bu7YaNlDT2y38elnx2/rxHJMG9gJrfLpupbkKhgnVJc/kRvB+HCkI21vO0QhT
         qIRbKeD/ZzxsfeOIQrxCJwxz07koYfDxNOG0rP4s=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190118131713eucas1p185ff8c49e580b538295a6d1726972060~688EyYmgR1549715497eucas1p1l;
        Fri, 18 Jan 2019 13:17:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 40.C0.04441.8D1D14C5; Fri, 18
        Jan 2019 13:17:12 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190118131712eucas1p2b7e11ff6df0a78d8e7ea50b34f9cf737~688Dzwdmf0619906199eucas1p2u;
        Fri, 18 Jan 2019 13:17:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190118131711eusmtrp1e18aae81029313cf52a65a2e11c54852~688DkiiOo1588815888eusmtrp1h;
        Fri, 18 Jan 2019 13:17:11 +0000 (GMT)
X-AuditID: cbfec7f2-5c9ff70000001159-25-5c41d1d873ff
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 02.55.04128.7D1D14C5; Fri, 18
        Jan 2019 13:17:11 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190118131711eusmtip170de69b714e4422b2d9b541c72d6e43a~688DBGzBi1936519365eusmtip1T;
        Fri, 18 Jan 2019 13:17:11 +0000 (GMT)
From:   Kamil Konieczny <k.konieczny@partner.samsung.com>
To:     k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/5] clk: samsung: exynos5433: fix name typo in sssx
Date:   Fri, 18 Jan 2019 14:16:36 +0100
Message-Id: <20190118131639.17578-3-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjt3b1397qcXKfpg1rhIChJTQi6UYiC2YSQ+quirrx+0Pxgc5r5
        R0pTh82a6GyWhjaU5efUaWWCH2imOfVH80eZ5FdpBqlBprm23Yn+O895znnPc+ClMFE/4UOl
        ZWSz8gypTMwX4KaRbXPg7HR43Lme92eZjuo2grFsrRBM3fAkwaj7rYgpX1jDGLO5nWR+lc0R
        TLW5n8e0DH8mGb1lmscUvR0mGWtfL8kM/SgmwoSS5tpmJDEaSvmSgZ99PIm6y4Akm8YT14kY
        weUkVpaWw8qDQxMFqarFdSJr0PWO5kUPWYA2BSrkQgF9HtpV/zAVElAiugmBoasOccMWgtYK
        DZ8bNhHsfqri7VvWhnZxbtGIYP6x5cBiKZzi21V8+gJ87ZlwODzpSFBX1Diewmg9BkU7JYR9
        4UFfBcvyIrJjnD4FDY1zDoOQjgBt5xri4k5C1UuVg3ehr0BtaxPBadxh7MkibseYTXO/u8bR
        Auh+EvaWPpCcOQL0AzNO7AGro11O7AfjFWU4h3PhTfcyyZkLETyrqHcWvQRDo9O2NMqWcAba
        XgdzdDjUG6tIOw20G8yuu3M3uIHGpMU4WgglD0ScOhBqrRMEh31BZW11YglUvprHHyF/3aE2
        ukNtdAe5zxFmQN6sUpGewipCMtjcIIU0XaHMSAm6lZluRLZfNb43utGLfs/cHEQ0hcSuwm+m
        sDgRIc1R5KUPIqAwsadQ0BQeJxImSfPusvLMBLlSxioGkS+Fi72F+UfmY0V0ijSbvc2yWax8
        f8ujXHwKkLZtTPvUI/pibDaxVtOmrLbE/zVOKodLH05Fg8ncWnzDq1zzLnnpS2RlQmiMm/9x
        jZo39j0/yCob0W8c0zbEdmy199b5ST0m8O17Ub7LC+MdPVG6j3UdtatelP9plVyiRl4Bntu+
        sX+i53ZMydf06qPalUY3WWK8uaVzW20U44pUaUgAJldI/wNguPVfUQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7rXLzrGGMyermOxccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLf7v2cFu
        cfhNO6sDr8eaeWsYPTat6mTzOPhuD5NH35ZVjB6fN8kFsEbp2RTll5akKmTkF5fYKkUbWhjp
        GVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZXQ9ectacIinYtKS7ewNjJ+5uhg5OSQE
        TCReH/7D0sXIxSEksJRR4taaU8wQCWmJxtOrmSBsYYk/17rYIIo+MUq0H77ICJJgEzCXeLT9
        DFiRiICHxIyJi1lBipgF1jNL3O1qAisSFnCXuP7sCZjNIqAqsXj5PbAGXgEXiembXzNCbJCX
        mLa6CyzOKeAqMW/dClYQWwio5sKcDmaIekGJkzOfsIDYzED1zVtnM09gFJiFJDULSWoBI9Mq
        RpHU0uLc9NxiI73ixNzi0rx0veT83E2MwJjaduznlh2MXe+CDzEKcDAq8fC+2OYQI8SaWFZc
        mXuIUYKDWUmEl2uFY4wQb0piZVVqUX58UWlOavEhRlOgJyYyS4km5wPjPa8k3tDU0NzC0tDc
        2NzYzEJJnPe8QWWUkEB6YklqdmpqQWoRTB8TB6dUA+OxuU1sy5ny/p/y9LKe4WX3ceXqc8ES
        5jECubomesYVk7csN9FeasxRpaZaOJuXz7+q6vRsloM7BO+cFrHikRPVuNrZu/S0ZOicZ7ui
        D0fLb2QO3nrBYs+u7twds1Nqp1i8mK4euH7T+jubm5PveVjsWM/5oX35hr1NeqZa+5sCrk5q
        knzZuEeJpTgj0VCLuag4EQC9GzsevwIAAA==
X-CMS-MailID: 20190118131712eucas1p2b7e11ff6df0a78d8e7ea50b34f9cf737
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190118131712eucas1p2b7e11ff6df0a78d8e7ea50b34f9cf737
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190118131712eucas1p2b7e11ff6df0a78d8e7ea50b34f9cf737
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
        <CGME20190118131712eucas1p2b7e11ff6df0a78d8e7ea50b34f9cf737@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix typo in sssx name, there should be three letters 's'.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 2 +-
 include/dt-bindings/clock/exynos5433.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index ea47f49abc7f..24c3360db65b 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -559,7 +559,7 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	/* ENABLE_ACLK_TOP */
 	GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
 			ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
-	GATE(CLK_ACLK_IMEM_SSX_266, "aclk_imem_ssx_266",
+	GATE(CLK_ACLK_IMEM_SSSX_266, "aclk_imem_sssx_266",
 			"div_aclk_imem_sssx_266", ENABLE_ACLK_TOP,
 			29, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_BUS0_400, "aclk_bus0_400", "div_aclk_bus0_400",
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 98bd85ce1e45..87bb2b017143 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -156,7 +156,7 @@
 #define CLK_ACLK_G2D_266		220
 #define CLK_ACLK_G2D_400		221
 #define CLK_ACLK_G3D_400		222
-#define CLK_ACLK_IMEM_SSX_266		223
+#define CLK_ACLK_IMEM_SSSX_266		223
 #define CLK_ACLK_BUS0_400		224
 #define CLK_ACLK_BUS1_400		225
 #define CLK_ACLK_IMEM_200		226
-- 
2.20.0

