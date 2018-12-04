Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D198C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 444B020659
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jXY18+b3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 444B020659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbeLDQxU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 11:53:20 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53910 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbeLDQxU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 11:53:20 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181204165318euoutp0188b29498ebbf851005993d8b017c89f5~tL25NgHKB0189101891euoutp01B
        for <linux-clk@vger.kernel.org>; Tue,  4 Dec 2018 16:53:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181204165318euoutp0188b29498ebbf851005993d8b017c89f5~tL25NgHKB0189101891euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543942398;
        bh=pbRPbjcbk9NEaVKCqrmKNoqOPUA8YSH7EyfHdF9jyLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jXY18+b3sjdxzRSGXqU6hv9Cv1BhnWdJNnfkyw2aocwkikSxx3ZETZbzYFYHWVQKs
         kYLjO3ew0ArMWKQNi6ZVzVWzAFW/oyfXRFGkhGWINLEOGQmm3ChfRKrkiEDCq7Hc0F
         2F7quf9ABs/UWWubSjBOYtyT0/1hcpHEcp5zJWq8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181204165316eucas1p208826f71832460fd8ca98b060154a2a9~tL24DFLrW2508625086eucas1p2p;
        Tue,  4 Dec 2018 16:53:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id FF.51.04806.CF0B60C5; Tue,  4
        Dec 2018 16:53:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181204165316eucas1p2da523b358ed62eca270fe24c5e2b063c~tL23VLye-3220732207eucas1p2B;
        Tue,  4 Dec 2018 16:53:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181204165315eusmtrp2a9a252a92bee327282bdff367e72e15e~tL23FMHdY2531625316eusmtrp2F;
        Tue,  4 Dec 2018 16:53:15 +0000 (GMT)
X-AuditID: cbfec7f5-34dff700000012c6-52-5c06b0fc39f4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 38.6D.04128.BF0B60C5; Tue,  4
        Dec 2018 16:53:15 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165315eusmtip1af045b0b224055ce1196b7b8222dca8f~tL22hEJmG1980219802eusmtip1y;
        Tue,  4 Dec 2018 16:53:15 +0000 (GMT)
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
Subject: [PATCH v3 1/5] clk: samsung: exynos5433: fix typo in imem divider
Date:   Tue,  4 Dec 2018 17:52:44 +0100
Message-Id: <20181204165248.17572-2-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRTA/XZ3t7vZ7DoFD1qZCysDNSnwQiYWGkMMgv4oTMipF5Xcw81H
        1h+ZmdkqMydpio+Koa3ZdD7K1VY6SbSlCaJCGeKjzHzliwxxOa89/vudc37fd75z+AhMaMI9
        iWRZGq2USVJEHD675e1qj/9aPSfmoG3em2ooNeDU4NJXnKrq6MGpAosdUXfHvmNUb289l/px
        +zNOlfZaWFRdxzCX0g72sajr5g4uZZ2+gVPVDaMoTCDWV+qR2Ki7yRG3zb5iiQuadEi8aNx1
        Co/mhyTQKckZtDIwNJafpJk2I0Un72KToRjLRjpCjQgCyMMwVxOlRnxCSNYisLYOICZYQmAo
        6eKoEW8jWEQwbj3pYMeB4bY3W1INgveL89y/J/pqryKHxSGDYfS5jeVgd/IEFGjKOQ4JIysx
        6F4txh0FNzISVn7ZuQ5mk75g+mDcbCcgw6Fv4BabaecN2abGTYdHRoCxcB0xjit0PRjfdLAN
        51pzOcb4Ji7ceZrKcDjcy7ds5d1gqrOJy/AOsLdWsRjOhJfNXzYnADIXQYXm0VbhCFg7+3DH
        kjDSDwymQGZfx6C2KJpBFxiacWVe4AJFLSUYkxZAfp6QucMfKu02nGEvUNufbbEYGvWVrELk
        U/bfLGX/zVL2r201wnTIg05XSRNp1SEZnRmgkkhV6bLEgHi51Ig2ftS79c7lF8iyFteOSAKJ
        tgmgmBMjxCUZqixpOwICE7kLPu3dSAkSJFmXaKX8vDI9hVa1Iy+CLfIQXHYaOSckEyVp9AWa
        VtDKP1UWwfPMRnn8oKmx5X2xXj+xJxVzWu1Dl+NDj3eHS7SLkyh3T+RpP3ZFnfaju9zsPmla
        zgk4E2TXzObIjzrvz79vjZ3VkRERxb5L606loYP6hVwjT/fab6HFdCVq55o5sGcC9UwoKr5Z
        nbsXwvxnMprj+rfHiX1s8WVVwV39IfaV1BHFWRFblSQJOoApVZLf/2zgyE0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7q/N7DFGFzdo2OxccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWe1
        WLDxEaMDr8eaeWsYPTat6mTzOPhuD5NH35ZVjB6fN8kFsEbp2RTll5akKmTkF5fYKkUbWhjp
        GVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZUx+s5ex4DhnxZb1U5gbGFdxdDFyckgI
        mEjcPXiAsYuRi0NIYCmjxIxvx1khEtISjadXM0HYwhJ/rnWxQRR9YpQ4vO0DM0iCTcBc4tH2
        M2BFIgIeEjMmLmYFKWIWWMEscfvdW3aQhLCAl8S3X//BbBYBVYldFzaxgdi8Ai4SF691s0Bs
        kJdo2LUZrIZTwFVi04R/jCC2EFDNnGm9zBD1ghInZz4Bq2cGqm/eOpt5AqPALCSpWUhSCxiZ
        VjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTG1LZjP7fsYOx6F3yIUYCDUYmHV2IKW4wQa2JZ
        cWXuIUYJDmYlEd47akAh3pTEyqrUovz4otKc1OJDjKZAT0xklhJNzgfGe15JvKGpobmFpaG5
        sbmxmYWSOO95g8ooIYH0xJLU7NTUgtQimD4mDk6pBkY9SauYuHkr52xJSN/Ns2J5SOGC14dz
        6goOMcTnTq8/7La/f/3xZbw2BYJHjjYUe4n4K+477hbybDfHT7d0CY/WFSd3WJZaaT49P/lX
        9dTS5J8xJ3oXBRvlSYrJ5XQ/vdx8KTYgO+FP6m2/4NiQOd+Y+M0XuJS7H3opJVTm/bP6i7xN
        Tjk/pxJLcUaioRZzUXEiAEqLIxC/AgAA
X-CMS-MailID: 20181204165316eucas1p2da523b358ed62eca270fe24c5e2b063c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181204165316eucas1p2da523b358ed62eca270fe24c5e2b063c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181204165316eucas1p2da523b358ed62eca270fe24c5e2b063c
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165316eucas1p2da523b358ed62eca270fe24c5e2b063c@eucas1p2.samsung.com>
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
2.19.1

