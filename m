Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60680C41518
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FC8B21721
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="touYII18"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbfAVJCx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:02:53 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46974 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbfAVJCw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 04:02:52 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190122090251euoutp014174ab5d60f0d0c35122a07554c69cee~8IDIfi-pw2234122341euoutp01h
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 09:02:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190122090251euoutp014174ab5d60f0d0c35122a07554c69cee~8IDIfi-pw2234122341euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548147771;
        bh=JgyOErs3JfFd3HuYd2x+7ig5y2VM6o2o6Yl3w/nw3K8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=touYII18AXS55WNM15PiNPXK9zip842AC3U5BJ1utC2EAn1aGMurJ/hSk8Asb1faK
         H9x9xwpVkdQgsxaIqgLVqIeHctrp4iZS9sXKPnCrH+phT0yjeXA89cofwAnfJjTRp+
         gCj2PuM4c9Epw4vrhcN1fRlS0hzpjFCrG9zsSBb4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190122090250eucas1p18679703326241dd1cca79c81ef928860~8IDH3OMty1184611846eucas1p1r;
        Tue, 22 Jan 2019 09:02:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 04.86.04806.A3CD64C5; Tue, 22
        Jan 2019 09:02:50 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b~8IDG-ieCZ0649206492eucas1p1D;
        Tue, 22 Jan 2019 09:02:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190122090249eusmtrp199350fc6ea7e609564e7d615ad3d7eef~8IDGwP_s52578625786eusmtrp1m;
        Tue, 22 Jan 2019 09:02:49 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-07-5c46dc3ab70f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 3B.E2.04284.93CD64C5; Tue, 22
        Jan 2019 09:02:49 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090249eusmtip14f6ab9041101538e994b07c4db88537d~8IDGIL_Bw2863128631eusmtip1r;
        Tue, 22 Jan 2019 09:02:48 +0000 (GMT)
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
Subject: [PATCH v5 1/5] clk: samsung: exynos5433: fix typo in imem divider
Date:   Tue, 22 Jan 2019 10:02:28 +0100
Message-Id: <20190122090232.29194-2-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3Z2ds6Gk89p+KZRNDHJ8NaFThZRojIMSvonKEFXHlScFzav
        SShYTmeZecumqShemPN+ycoGTnGUokw0pbJSy/JSEGplVOY8Wv73vM/7/L73feGjCUk36UBH
        RMexymi5QioQ8Tv7V4fcvF/7B3l2zjozLcVNJDO+/JFkyvuGSCbHsIaYOzMLBDM83EwxX2+9
        IZniYQOPaeibpJjqcTOPufm0j2J6F9UkU9EyjU6LZfoyPZK16rIEsp4v3TxZTrsOyZZa9wSS
        l0QnQ1lFRAKr9DgVIgqvnskjYk3CpM6qfioN6WgNEtKAj0DbqyaBBoloCa5D0DiZjbhiGcFU
        23eKK5YQLH/T8raQBX39JlKLoDK3mPqHNMyZCUtKgI/B9MPBDcIO+0NOfskGQeAyAp6vFpCW
        hi0OgJZHaeshmuZjZxhbOWiRYuwLhWpnbtheKKrXbDwjxH6gne8SWLQY28Cz++/5Fk2sZ9I7
        SgjL84CNFFSV91Ic7AsV7SYBp21h3tS+6e+GgfxbfE4nwpOOWYqDbyB4kF+5eeYJ6DWZSctC
        BD4ATY89OPsMlOq6+RYbsDVMfLbhdrCGvM57BGeLITNDwqXdoGxtkOS0I2jWGje1DMxrNbxc
        tE+77Rrttmu0/+dWIEKH7Nl4VVQYqzoczSa6q+RRqvjoMPerMVGtaP1PDfwxrXQhw68rRoRp
        JLUS00N+QRJSnqBKjjIioAmpndjP7B8kEYfKk6+xyphgZbyCVRmRI82X2otTdry7LMFh8jg2
        kmVjWeVWl0cLHdLQ4O+dLuoUrZfESTpiyHVb4NUU+QYPJUVI9Vnz1xUG+5+pd3+0K3rw6Pnq
        sEMBVkdnpufSb4+op5yOV2V7Frx9SS81O14sWRlzcb1Q6ENGOtXVTn5Krs10KTXY7s84G6j+
        0OCt10ykhrTtGsFJifNCt9FFOypUSLgvvjhnNIt8pHxVuNzLlVCq5H8BeF36+k8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7qWd9xiDL6/VLbYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLNa
        LNj4iNGB12PNvDWMHptWdbJ5HHy3h8mjb8sqRo/Pm+QCWKP0bIryS0tSFTLyi0tslaINLYz0
        DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MpY+nsRccJyzYtviY+wNjKs4uhg5OSQE
        TCRer1nN1sXIxSEksJRR4knDdGaIhLRE4+nVTBC2sMSfa11QRZ8YJW78fc4OkmATMJd4tP0M
        WJGIgIfEjImLWUGKmAVWMEvcfvcWrEhYwEti484GoCIODhYBVYmrX7VBTF4BF4mp7aoQ8+Ul
        pq3uAhvDKeAqMevVDjYQWwio5GrnZVYQm1dAUOLkzCcsIDYzUH3z1tnMExgFZiFJzUKSWsDI
        tIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwnrYd+7l5B+OljcGHGAU4GJV4eDnOucYIsSaW
        FVfmHmKU4GBWEuF1vegWI8SbklhZlVqUH19UmpNafIjRFOiFicxSosn5wFjPK4k3NDU0t7A0
        NDc2NzazUBLnPW9QGSUkkJ5YkpqdmlqQWgTTx8TBKdXAmHx4yYL5qgpprRGL/jEeWrDsaMIe
        Fu0PXje2HOvtVGet2Ld/lnu27dFr28wacrbks4ucPvk9u/Z50Wbr2FXPb04RnLRt+9t91w2u
        VIgffugzRb5x89VN6b5ZZTmOFrOP/Xuvtj16uY7a4aOcr5bcZL+3/exGV27zyzmi33e+bitI
        6Q4t++8fbKbEUpyRaKjFXFScCADh+9LOvQIAAA==
X-CMS-MailID: 20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b@eucas1p1.samsung.com>
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

