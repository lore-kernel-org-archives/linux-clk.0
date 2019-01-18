Return-Path: <SRS0=hvdj=P2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F56C43612
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A1DA20883
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NuXlAswg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfARNRP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jan 2019 08:17:15 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60154 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbfARNRO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jan 2019 08:17:14 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190118131713euoutp01724101fc4589223fdea661d34e0609e0~688Ew3hdP1775617756euoutp01K
        for <linux-clk@vger.kernel.org>; Fri, 18 Jan 2019 13:17:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190118131713euoutp01724101fc4589223fdea661d34e0609e0~688Ew3hdP1775617756euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1547817433;
        bh=JgyOErs3JfFd3HuYd2x+7ig5y2VM6o2o6Yl3w/nw3K8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NuXlAswgvnqCy6e2zB8PhS+Vg+DsjynEEW/9NWiZJRJfS36leKtni3jdYPrfUEuZA
         XjY1sfRXYK9xIQYxWN3E7TcROVk9dQyBIbY5veYg95+dLWmcTj0XgL2O0f1rE30cpd
         zaOWIwU40vs8lElbzrEjVj0d4zZf+LJp/aPTL42s=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190118131712eucas1p16959f3ac5a92bfff5b8ec84c06b18850~688EIG3Rt1550115501eucas1p1n;
        Fri, 18 Jan 2019 13:17:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.C4.04294.7D1D14C5; Fri, 18
        Jan 2019 13:17:11 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190118131711eucas1p190e9b63ac047566ba84fb4f8749aceee~688DRoEY01549215492eucas1p12;
        Fri, 18 Jan 2019 13:17:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190118131711eusmtrp13fa11c592c44c280078870061701de04~688DBuwhb1588415884eusmtrp1I;
        Fri, 18 Jan 2019 13:17:11 +0000 (GMT)
X-AuditID: cbfec7f4-84fff700000010c6-b6-5c41d1d71306
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 9C.0F.04284.7D1D14C5; Fri, 18
        Jan 2019 13:17:11 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190118131710eusmtip1d16262442d197a3e95c8eb4653b31e86~688CdHenS2115721157eusmtip1S;
        Fri, 18 Jan 2019 13:17:10 +0000 (GMT)
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
        stable@vger.kernel.org
Subject: [PATCH v4 1/5] clk: samsung: exynos5433: fix typo in imem divider
Date:   Fri, 18 Jan 2019 14:16:35 +0100
Message-Id: <20190118131639.17578-2-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO2dn5zicHKfgm1bSwB8FXik6YJSCxrphQRCZZEsPU3LTdrzk
        JVilZsO8ptlEs8JLczonamY2SMWls3n5o4mGqGWsDE1/JIjmPIb+e97n8j3vCx+FS7oJType
        lcyqVfIEqVAk6Ohfs/lOjIZGBZxnTBVGghlfXSCYF302gikwbyKmcO4nzgwPt5DMcv5XgqkY
        NmNMU980ydSOj2JMzoc+kun99YhgakyzKEQsM1QbkKxV/1go+/i7G5MVtOmRbKX10CUiUnQy
        lk2IT2XV/qduiuJq50rwJIvT3Y7X/aQG6SktcqKAPgYa8wKmRSJKQjcgePMtX8APqwjKqyxC
        flhBYDDr0P+I1WzcEeoRFE6P7EbmjQukwyWkT8Ds2yHMgd3pM1BQWrmdwOlqHAbXnhIOwY0+
        B5/GXuIOLKB9YGZsbLtCTIdBWdM0ztd5Q3mjdvshJzocqpsbCN7jCgPP5wUOjG95HrZX4o4C
        oHtI2FhsJ/lwGGTfHxHy2A3slrYd/gBYS/MFPE6D9+3fST6cjaCq9BXGC8HQaxndaqO2Go6A
        scufp0Oh5IERd9BAu8DEoiu/gwuUdDzbocWQlyvh3b5QvTlE8NgLtJvNO1gG68vdWBE6rNtz
        jW7PNbrd3hqE65EHm8IpFSwXpGLT/Di5kktRKfxiEpWtaOtPWTcsq52oa/1WD6IpJHUWF7WF
        REkIeSqXruxBQOFSd7GoITRKIo6Vp2ew6sRodUoCy/UgL0og9RBn7pu5LqEV8mT2Nssmser/
        KkY5eWpQ5mVW0WjzucEtabsiem1rdXlZicFsxiTrvRB44dq9lotZSS1zsukgTeyTJt+J5M6z
        uTH2P7LinMFId6v1zruWYtYddevr5sMPRtuxxnEyQGoISf5xWjll8lRpIky6suPKJXvBlb/R
        9c5pgeNflq4aBbVTWi6qomhy/+fWgRKpgIuTBx7F1Zz8H0GzI8VPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7rXLzrGGOzexm6xccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWe1
        WLDxEaMDr8eaeWsYPTat6mTzOPhuD5NH35ZVjB6fN8kFsEbp2RTll5akKmTkF5fYKkUbWhjp
        GVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZSx9PIm54DhnxbbFx9gbGFdxdDFyckgI
        mEic3reerYuRi0NIYCmjxKu901kgEtISjadXM0HYwhJ/rnWxgdhCAp8YJe43pYHYbALmEo+2
        nwGrERHwkJgxcTEryCBmgRXMErffvWUHSQgLeEmcuLSQGcRmEVCVeHDpEiOIzSvgIjF17V1m
        iAXyEtNWd4EN4hRwlZi3bgUrxDIXiQtzOpgh6gUlTs58AnYcM1B989bZzBMYBWYhSc1CklrA
        yLSKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMKK2Hfu5eQfjpY3BhxgFOBiVeHhfbHOIEWJN
        LCuuzD3EKMHBrCTCy7XCMUaINyWxsiq1KD++qDQntfgQoynQExOZpUST84HRnlcSb2hqaG5h
        aWhubG5sZqEkznveoDJKSCA9sSQ1OzW1ILUIpo+Jg1OqgZHpp9NGFk9RnRctQg4TJy9vfipc
        xcL5J9kkSaiEeeeilx9KXzZXf3r/L7/swIOk3cfU2KMfPhJ+4f+J60NNp+PH701iO71VZ7n5
        CyxnWnjZy1ThoRVb7et5JYFsd+UP3ztxMnnL4wVlKu7nWGczXVS6LXnz9ense7P7Z3hs+7+k
        OKA4PHSquo0SS3FGoqEWc1FxIgC904ysvgIAAA==
X-CMS-MailID: 20190118131711eucas1p190e9b63ac047566ba84fb4f8749aceee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190118131711eucas1p190e9b63ac047566ba84fb4f8749aceee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190118131711eucas1p190e9b63ac047566ba84fb4f8749aceee
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
        <CGME20190118131711eucas1p190e9b63ac047566ba84fb4f8749aceee@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix typo in imem clock divider 200 switched with 266.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 751e2c4fb65b..ea47f49abc7f 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
 			ENABLE_ACLK_TOP, 25,
 			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
-	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
+	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
 			ENABLE_ACLK_TOP, 24,
 			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
-	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
+	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
 			ENABLE_ACLK_TOP, 23,
 			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_ACLK_PERIC_66, "aclk_peric_66", "div_aclk_peric_66_b",
-- 
2.20.0

