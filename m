Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6621FC04EBA
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D73920868
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OrR0hc20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D73920868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbeK3C5i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 21:57:38 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48246 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbeK3C5h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 21:57:37 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181129155147euoutp019a19224d2c0028bb383700aeef04d7f4~roywYckA81343213432euoutp01s
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 15:51:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181129155147euoutp019a19224d2c0028bb383700aeef04d7f4~roywYckA81343213432euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543506707;
        bh=paBe9wWua/zten9R7vX78NZKHAa6oeHL2Ywjfrz/At4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OrR0hc20iD8/YN+dw6rbDlyyJ6s0FaYSth0hGl3cfrQ/EZsvw5ptGeDZ5qaJr/oKC
         lGF3BQVCtpJt5nXAh//oCZRTwF8AxhF598mJVP6CrvpRto5pPr1v3CNeGUt2kY/7LF
         ZiFV6SBO5G06d/pr+tH7pMb4oMg6cfPp5tYKv61g=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181129155146eucas1p1f65e30a7a8fdb670c21396e2876596ec~royv18mvZ1697716977eucas1p1S;
        Thu, 29 Nov 2018 15:51:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id BC.4F.04806.21B000C5; Thu, 29
        Nov 2018 15:51:46 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4~royu3BjWy1780817808eucas1p2O;
        Thu, 29 Nov 2018 15:51:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181129155145eusmtrp1246945ac9d6fd37a0e1b9ccd812463c8~royuoFBy43243432434eusmtrp1X;
        Thu, 29 Nov 2018 15:51:45 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-ae-5c000b120b54
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F7.E2.04284.11B000C5; Thu, 29
        Nov 2018 15:51:45 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181129155144eusmtip24395ee683a67667baa9000baa4f7b72c~royuHo5Y_2940929409eusmtip2z;
        Thu, 29 Nov 2018 15:51:44 +0000 (GMT)
From:   Kamil Konieczny <k.konieczny@partner.samsung.com>
To:     k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/5] clk: samsung: exynos5433: fix name typo in sssx
Date:   Thu, 29 Nov 2018 16:51:31 +0100
Message-Id: <20181129155134.19141-3-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87pC3AwxBt/auCw2zljPanH9y3NW
        i/lHzrFa9O37z2jR//g1s8X58xvYLT723GO1mHF+H5PF2iN32S2WXr/IZNG69wi7xeE37awO
        PB5r5q1h9Ni0qpPN4+C7PUwefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlbFo4nmmgmfcFYc3
        P2NrYFzI1cXIySEhYCLx790l1i5GLg4hgRWMEhOun2OHcL4wSpxf38sKUiUk8JlR4tjGDJiO
        XY92M0EULWeUWPP+KjNcx+ZDD5hAqtgEzCUebT8DZosIuEn0TZ7NBlLELNDGLPF0dhdYQljA
        XeLc3q3MIDaLgKrE1K0z2EFsXgEXiY+nDjJCrJOXaNi1GSzOKeAqMW3lfmaIGkGJkzOfsIDY
        zEA1zVtng10hIbCJXWLqrcXsEM0uEk9PLIKyhSVeHd8CZctInJ7cwwJhl0vs3vqMHaK5hVFi
        7uRFTBAJa4nDxy8CA4ADaIOmxPpd+iCmhICjxIYt1RAmn8SNt4IQJ/BJTNo2nRkizCvR0SYE
        MUNXYt7/M6wQtrRE1/91ULaHxOTm84wTGBVnIXlmFpJnZiGsXcDIvIpRPLW0ODc9tdg4L7Vc
        rzgxt7g0L10vOT93EyMwOZ3+d/zrDsZ9f5IOMQpwMCrx8Dr8+h8txJpYVlyZe4hRgoNZSYT3
        MAdDjBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQbGzd0q
        D9lM7Nxt8lW0f8hvurZINetLTNpG6Z3lK76VBz+oUfl1RHTn4k3f/k/g/z3hWtPuW5khG52N
        LRZ/ZXsbvV3shs6/xOz/EwW35Rv0ykav2X04/KKldWtn49JXLKnJx89M3at8Z3tgr88yI3V3
        ieke4nFfXjAWckieuR+0MiXzYPf3LzxlSizFGYmGWsxFxYkANNOTtEoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7qC3AwxBp9fcFpsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
        xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2PRxPNMBc+4Kw5vfsbWwLiQq4uRk0NCwERi16Pd
        TF2MXBxCAksZJdqeT2WHSEhLNJ5ezQRhC0v8udbFBlH0iVFi2ZRrLCAJNgFziUfbz4AViQh4
        SMyYuJgVpIhZoI9Z4vPB82CThAXcJc7t3coMYrMIqEpM3ToDLM4r4CLx8dRBRogN8hINuzaD
        xTkFXCWmrdwPVi8EVPPo0HJGiHpBiZMzn4AtZgaqb946m3kCo8AsJKlZSFILGJlWMYqklhbn
        pucWG+oVJ+YWl+al6yXn525iBEbStmM/N+9gvLQx+BCjAAejEg+vw6//0UKsiWXFlbmHGCU4
        mJVEeA9zMMQI8aYkVlalFuXHF5XmpBYfYjQFemIis5Rocj4wyvNK4g1NDc0tLA3Njc2NzSyU
        xHnPG1RGCQmkJ5akZqemFqQWwfQxcXBKNTCytQpqXIvIqTkoXtmWrySYLrzk/S2h9XI5+bub
        z09gq46YuY3T9Hei/mU7FQ3PzCfpXx1rDaRfFDBme2fs/blydsjsSfX+CXr3cxsLEsx7XtWI
        z6vL3bl9UfTG1wesNnKks1Twb2IOdp1YL+BSsVzsY3tH818Xx2hT7+3vpq98LCO5Zr/5ZiWW
        4oxEQy3mouJEAETqX766AgAA
X-CMS-MailID: 20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
        <CGME20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix typo in sssx name, there should be three letters 's'.

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
2.19.1

