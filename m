Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3214EC282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:03:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01B9720854
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kttGpDTd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfAVJDB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:03:01 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47000 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbfAVJCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 04:02:54 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190122090253euoutp01acfd699f028257b78d791a1dbd117f7f~8IDJ6nKhH2247722477euoutp01M
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 09:02:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190122090253euoutp01acfd699f028257b78d791a1dbd117f7f~8IDJ6nKhH2247722477euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548147773;
        bh=taqJU5yfA72AunT1wQhqYaFYAc2L/FzbtvaSd6TSsA4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kttGpDTdgqtlMHzAYffgxpFXzxyPFFychfh0jtj3Fu6glsEiYrhVJIXzIgR2/+PYC
         mcICD8HDyprxaJRLL8LDLbYub0vOkoVfRMBGdT0PPZlF3RgdjqAvJJxLRU3o3dBQdI
         4WXlnxDzI5MTpNVa16WCqQIYHeCE7iX+18snReug=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190122090252eucas1p20c926dc725a3d4347738b2f7ad8994d6~8IDJfv2Oh2673626736eucas1p2v;
        Tue, 22 Jan 2019 09:02:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F3.ED.04294.C3CD64C5; Tue, 22
        Jan 2019 09:02:52 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76~8IDIo1MqP2542325423eucas1p1e;
        Tue, 22 Jan 2019 09:02:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190122090251eusmtrp2494296d5e40fc57c6819f763f211be99~8IDIZ7dHY2967329673eusmtrp2E;
        Tue, 22 Jan 2019 09:02:51 +0000 (GMT)
X-AuditID: cbfec7f4-84fff700000010c6-5d-5c46dc3c0722
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AF.F8.04128.B3CD64C5; Tue, 22
        Jan 2019 09:02:51 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090250eusmtip138baaa92b8bab6337c33f7aca5154f52~8IDH02z1e2589425894eusmtip1O;
        Tue, 22 Jan 2019 09:02:50 +0000 (GMT)
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
Subject: [PATCH v5 4/5] dt-bindings: clk: exynos5433: add imem clock
Date:   Tue, 22 Jan 2019 10:02:31 +0100
Message-Id: <20190122090232.29194-5-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87o2d9xiDFq/ilpsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+NY6xb2gpOsFXv/
        5zcw3mLpYuTkkBAwkZh/4zNjFyMXh5DACkaJd43b2SGcL4wSR9/+hnI+M0pse/yCGabl8Lbf
        rBCJ5YwSh6YfYYRrObyigQmkik3AXOLR9jNgtoiAm0Tf5NlsIEXMAm3MEk9nd4ElhAVcJJ7N
        P8EOYrMIqErsfPSAEcTmBYovfHuFCWKdvMS01RD1nAKuErNe7WCDqBGUODnzCdgXzEA1zVtn
        M4MskBBYxy6x5/wBdohmF4lJF46xQtjCEq+Ob4GKy0j83zkfakG5xO6tz9ghmlsYJeZOXgSV
        sJY4fPwiUDMH0AZNifW79CHCjhL/tsxgBAlLCPBJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVuhLz
        /p+BukBaouv/OijbQ2LetoOsExgVZyH5ZhaSb2Yh7F3AyLyKUTy1tDg3PbXYKC+1XK84Mbe4
        NC9dLzk/dxMjMD2d/nf8yw7GXX+SDjEKcDAq8fAmXHCNEWJNLCuuzD3EKMHBrCTC63rRLUaI
        NyWxsiq1KD++qDQntfgQozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QDo5Ng0q9bkz49
        YExfeMr6venGGfll/zMyxA4tmpPw89HuF90h/ie0W4yusnnG2YotO/l0Sr1DkeYzC1X+oAUV
        VTb3L1yvs63KOxYWuG+JwuroP4zbv1tIW8Y3WyUbc12NLdCeuvbORPH/E5arhv/luXtb/cq0
        GbKmc/26+rc1H1cX2t5+/JDVMyWW4oxEQy3mouJEAC+N2t5LAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7rWd9xiDL71SlpsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
        xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+NY6xb2gpOsFXv/5zcw3mLpYuTkkBAwkTi87Tdr
        FyMXh5DAUkaJdzO/sEIkpCUaT69mgrCFJf5c62KDKPrEKHHj1mmwbjYBc4lH28+AFYkIeEjM
        mLgYbBKzQB+zxOeD59lBEsICLhLP5p8As1kEVCV2PnrACGLzAsUXvr0CtUFeYtrqLjCbU8BV
        YtarHWwgthBQzdXOy6wQ9YISJ2c+AVvMDFTfvHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy02
        0itOzC0uzUvXS87P3cQIjKNtx35u2cHY9S74EKMAB6MSD2/CBdcYIdbEsuLK3EOMEhzMSiK8
        rhfdYoR4UxIrq1KL8uOLSnNSiw8xmgI9MZFZSjQ5HxjjeSXxhqaG5haWhubG5sZmFkrivOcN
        KqOEBNITS1KzU1MLUotg+pg4OKUaGI9dLt4nLX6fxZs3wozv9/67Aim+U17szu1e/EK4/335
        uQD+F3FyyR3H7DMrxCvPmdfedv06627N8Tz32Mbk35IpG/iWFbGYyrwUWX43KOaFwKrLgsov
        q1VS/HOVuCa82pFtdyq6parlao7swpLpe7puPv07f83FO5IOEc4HI5LybnN/1u9ep8RSnJFo
        qMVcVJwIAJnnbo65AgAA
X-CMS-MailID: 20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add Exynos5433 DT bindings to describe imem clocks for SlimSSS (Slim
Security SubSystem).

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 include/dt-bindings/clock/exynos5433.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 87bb2b017143..52652aaabc06 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -1406,4 +1406,10 @@
 
 #define CAM1_NR_CLK					113
 
+/* CMU_IMEM */
+#define CLK_ACLK_SLIMSSS		2
+#define CLK_PCLK_SLIMSSS		35
+
+#define IMEM_NR_CLK			52
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
-- 
2.20.0

