Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A3AC43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C98602146D
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:52:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AkOUq5Zv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C98602146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbeK3C5g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 21:57:36 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47191 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728989AbeK3C5g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 21:57:36 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20181129155146euoutp02795fcecdd33fec42506a30b6cb4f2023~royv77ZSn1074810748euoutp027
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 15:51:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20181129155146euoutp02795fcecdd33fec42506a30b6cb4f2023~royv77ZSn1074810748euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543506706;
        bh=a3+GrKi7Ef8UCTSqWji6LI6CRrv9eigqRKacfceSf3E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AkOUq5ZvPgKU0zCKB9hIVv4FyOzZLDtS3JXNG7RSTnD+v7gYq0keA+4dxKIYxcKhR
         1Djj+A92Cj0k5Y9mdzom95ezad/cjPZZ9gWpqAHz1djaK+8qE1fUdRYbJFmwLB/AeV
         qzHc8QCYBFLFhntwwd75SH3aGD5zXJfD6rTIEAUA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181129155145eucas1p17be0f7007db485cfa2d84d2178a609d3~royvUsHvd1648416484eucas1p1T;
        Thu, 29 Nov 2018 15:51:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id AB.95.04441.11B000C5; Thu, 29
        Nov 2018 15:51:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181129155145eucas1p18b3f72cb77218279c9a844cbc179b728~royucpH_a1617316173eucas1p1U;
        Thu, 29 Nov 2018 15:51:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181129155144eusmtrp27980d8135666d55349e8550d4653451a~royuNSeG02119121191eusmtrp2b;
        Thu, 29 Nov 2018 15:51:44 +0000 (GMT)
X-AuditID: cbfec7f2-5e3ff70000001159-33-5c000b1134e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AD.D7.04128.01B000C5; Thu, 29
        Nov 2018 15:51:44 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181129155144eusmtip2978655b058e7e1a32a47119362ba988d~roytj012U3016630166eusmtip2Q;
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
        Marek Szyprowski <m.szyprowski@samsung.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 1/5] clk: samsung: exynos5433: fix typo in imem divider
Date:   Thu, 29 Nov 2018 16:51:30 +0100
Message-Id: <20181129155134.19141-2-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7qC3AwxBvNfqltsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkt
        Fmx8xOjA67Fm3hpGj02rOtk8Dr7bw+TRt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGSf7TjMV
        vOWsaJq5ma2B8RRHFyMnh4SAicS1SX1sXYxcHEICKxglpn7+BOV8YZQ4vPI7I0iVkMBnRolZ
        84xgOnZtP80CEV/OKPFikztcw4Qb68Ea2ATMJR5tP8MEYosIuEn0TZ4NNpVZYB6zxKmfU1i7
        GDk4hAW8JJ7cCAOpYRFQlVj/8xs7iM0r4CLxc/saFohl8hINuzaDxTkFXCWmrdzPDFEjKHFy
        5hOwGmagmuats5lB5ksI7GOXaD2/lhWi2UVi+8tXUIOEJV4d38IOYctI/N85nwnCLpfYvfUZ
        O0RzC6PE3MmLoBLWEoePXwQ7lFlAU2L9Ln2IsKPE1YPH2EHCEgJ8EjfeCkLcwCcxadt0Zogw
        r0RHmxBEta7EvP9noK6Rluj6vw7K9pCYs3QD8wRGxVlIvpmF5JtZCHsXMDKvYhRPLS3OTU8t
        NsxLLdcrTswtLs1L10vOz93ECExSp/8d/7SD8eulpEOMAhyMSjy8L77/jxZiTSwrrsw9xCjB
        wawkwnuYgyFGiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dU
        A2OJuVN1Q6mZ7atLxlYafxsrZzb3S03v2+Lc+EDq39ya/5dtjS7e7vtpb2xTJzBX1O1r6cYa
        Di0FfS+7dVzlx31u2p17sPlNfcFU64DvsXH5PkH7lr/Vus3Bd45VZeLyGfPqL16Y2ySh8Wbn
        nrA75TylzYdyrz9lc+o5+UXwz0LmtTkn61V3/FJiKc5INNRiLipOBAA4P+9wTgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xe7oC3AwxBvuuqVlsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkt
        Fmx8xOjA67Fm3hpGj02rOtk8Dr7bw+TRt2UVo8fnTXIBrFF6NkX5pSWpChn5xSW2StGGFkZ6
        hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GSf7TjMVvOWsaJq5ma2B8RRHFyMnh4SA
        icSu7adZuhi5OIQEljJK3OlaxQKRkJZoPL2aCcIWlvhzrYsNougTo8Tai7vAEmwC5hKPtp8B
        s0UEPCRmTFzMClLELLCCWeL2u7fsXYwcHMICXhJPboSB1LAIqEqs//mNHcTmFXCR+Ll9DdQy
        eYmGXZvB4pwCrhLTVu5nBrGFgGoeHVrOCFEvKHFy5hOwemag+uats5knMArMQpKahSS1gJFp
        FaNIamlxbnpusZFecWJucWleul5yfu4mRmBEbTv2c8sOxq53wYcYBTgYlXh4HX79jxZiTSwr
        rsw9xCjBwawkwnuYgyFGiDclsbIqtSg/vqg0J7X4EKMp0BMTmaVEk/OB0Z5XEm9oamhuYWlo
        bmxubGahJM573qAySkggPbEkNTs1tSC1CKaPiYNTqoGx1Om/5ibPWaZrHj35mbdqTc9EzTKR
        l1z18xp6z7QY92VNVA4Wclkf3yrgNnWe2qXjH/88yzT56OhnX1Y3zbZq4YNNd/s2rpFrCn4t
        VFn21GG3/B47z61XrdnMDN47phesuj43dJpx7rqFSr7FTA+VdZ6fPszRd6dK5LWSxqvYDvtP
        b80sLhorsRRnJBpqMRcVJwIAdtaoHr4CAAA=
X-CMS-MailID: 20181129155145eucas1p18b3f72cb77218279c9a844cbc179b728
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181129155145eucas1p18b3f72cb77218279c9a844cbc179b728
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181129155145eucas1p18b3f72cb77218279c9a844cbc179b728
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
        <CGME20181129155145eucas1p18b3f72cb77218279c9a844cbc179b728@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix typo in imem clock divider 200 switched with 266.

Fixes: 5785d6e61f27 ("clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains")
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

