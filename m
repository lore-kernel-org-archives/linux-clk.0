Return-Path: <SRS0=hvdj=P2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125BEC43444
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE20420652
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aVxSw0We"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfARNRQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jan 2019 08:17:16 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36276 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbfARNRQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jan 2019 08:17:16 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190118131714euoutp02bc423aad7b8bc5b3b1d1918742b451a7~688GjnmZx0991809918euoutp02M
        for <linux-clk@vger.kernel.org>; Fri, 18 Jan 2019 13:17:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190118131714euoutp02bc423aad7b8bc5b3b1d1918742b451a7~688GjnmZx0991809918euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1547817434;
        bh=osX66katt/WYuYzov6/4bl1LjO7N4Isu2O4D9x+TbP8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aVxSw0WeSha9DjKiZUGu5nKrbswpMaeUKhmVUQRyo91sEq31dA2IONpiXlOl+9Qtv
         +b8stLzbbYrzoqnenAN7icgFF3DiYbLnF8SZwRghcahfZTmDkOYEdemcSOnFZsc5MP
         WyyCrGmCmEwET2mLZk6CuDd10soCy3e97joO5Zms=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190118131714eucas1p2d9606c5e8a7c7f06619b474e54177a5a~688FtZ3Z-1781517815eucas1p2M;
        Fri, 18 Jan 2019 13:17:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 6B.C4.04294.9D1D14C5; Fri, 18
        Jan 2019 13:17:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a~688E8HW0d2158821588eucas1p2o;
        Fri, 18 Jan 2019 13:17:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190118131712eusmtrp19b8950bff2562cce50e7e05b55949d13~688EtBqK61588815888eusmtrp1m;
        Fri, 18 Jan 2019 13:17:12 +0000 (GMT)
X-AuditID: cbfec7f4-835ff700000010c6-bd-5c41d1d9bac7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.55.04128.8D1D14C5; Fri, 18
        Jan 2019 13:17:12 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190118131712eusmtip1749cbc46d3098c3625bf175111666c93~688EKqbjn2115721157eusmtip1T;
        Fri, 18 Jan 2019 13:17:12 +0000 (GMT)
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
Subject: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
Date:   Fri, 18 Jan 2019 14:16:38 +0100
Message-Id: <20190118131639.17578-5-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djPc7o3LzrGGPzfqW+xccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoLpuU1JzMstQifbsErowPfy6xFPQKV3xo
        PsDcwLhcoIuRk0NCwESiYe9y5i5GLg4hgRWMEg8n3mYHSQgJfGGUWHnNGyLxmVHi7vIvjDAd
        U66dYIYoWs4ocWGbNUQRUMOL7y+ZQBJsAuYSj7afAbNFBNwk+ibPZgMpYhZoY5Z4OrsLLCEs
        4CLxe9N9NhCbRUBV4vvMvSwgNi9Q/Pm1iSwQ2+Qlpq2GqOcUcJWYt24FK0SNoMTJmU/AapiB
        apq3zgb7QUJgG7vEwu07oE51kTj/7gmULSzx6vgWdghbRuL05B6oBeUSu7c+Y4dobmGUmDt5
        ERNEwlri8PGLQNs4gDZoSqzfpQ8RdpQ4+eoSO0hYQoBP4sZbQYgb+CQmbZvODBHmlehoE4Ko
        1pWY9/8MK4QtLdH1fx2U7SGx+WYv+wRGxVlIvpmF5JtZCHsXMDKvYhRPLS3OTU8tNspLLdcr
        TswtLs1L10vOz93ECExOp/8d/7KDcdefpEOMAhyMSjy8E7Y4xAixJpYVV+YeYpTgYFYS4eVa
        4RgjxJuSWFmVWpQfX1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgTHn/s4/
        r6cUxD6d47TN9eXFDd4fDia+eZiSv/JtyLHTWb1JL9nYWNxO37x+yf7e1OT7C3Lf7P0zR3ju
        0v9mLaW5xXdmOD7l+Wn++cx+/vor0hOP/H4bufryd6PwWc6x/mwHZ75xmtd6wW73lZbZ4qmN
        7x3fTTny0dT1lVfMEf75O4NKn7lnNKabKLEUZyQaajEXFScCAPy7njNKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7o3LjrGGPxea2GxccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
        E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwPfy6xFPQKV3xoPsDcwLhcoIuRk0NCwERiyrUT
        zF2MXBxCAksZJd7P2MMGkZCWaDy9mgnCFpb4c62LDaLoE6PEr62bGEESbALmEo+2nwErEhHw
        kJgxcTErSBGzQB+zxOeD59lBEsICLhK/N90Hm8oioCrxfeZeFhCbFyj+/NpEFogN8hLTVneB
        DeIUcJWYt24FK4gtBFRzYU4HM0S9oMTJmU/A6pmB6pu3zmaewCgwC0lqFpLUAkamVYwiqaXF
        uem5xUZ6xYm5xaV56XrJ+bmbGIGRtO3Yzy07GLveBR9iFOBgVOLhfbHNIUaINbGsuDL3EKME
        B7OSCC/XCscYId6UxMqq1KL8+KLSnNTiQ4ymQE9MZJYSTc4HRnleSbyhqaG5haWhubG5sZmF
        kjjveYPKKCGB9MSS1OzU1ILUIpg+Jg5OqQZGPcXtn5Pins1deZPPbdZs4VWqt42jGDnFv3rH
        P9vDE3b086XdmX9ai7/NCWty3vBh78JFfz7khp1bUfvhqdRyRgGr74sX2stL7Wd6sMK1w396
        8KLJ034k3eSMcTjCLSuwYKbvDUVDphSpt3cUDgadZHbk8BWa5K1ssCb8YGufU3qm6LqfCYyC
        SizFGYmGWsxFxYkA0RNoELoCAAA=
X-CMS-MailID: 20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
        <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DT bindings to describe imem clocks for SSS (Security SubSystem) and
SlimSSS in Exynos5433.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 include/dt-bindings/clock/exynos5433.h | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 87bb2b017143..cc6153a0b5f7 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -1406,4 +1406,59 @@
 
 #define CAM1_NR_CLK					113
 
+/* CMU_IMEM */
+#define CLK_ACLK_SSS			1
+#define CLK_ACLK_SLIMSSS		2
+#define CLK_ACLK_RTIC			3
+#define CLK_ACLK_XIU_SSSX		4
+#define CLK_ACLK_ASYNCAHBM_SSS_ATLAS	5
+#define CLK_ACLK_ASYNCAXI_SSSX		6
+#define CLK_ACLK_BTS_SSS_CCI		7
+#define CLK_ACLK_BTS_SSS_DRAM		8
+#define CLK_ACLK_BTS_SLIMSSS		9
+#define CLK_ACLK_SMMU_SSS_CCI		10
+#define CLK_ACLK_SMMU_SSS_DRAM		11
+#define CLK_ACLK_SMMU_SLIMSSS		12
+#define CLK_ACLK_SMMU_RTIC		13
+#define CLK_ACLK_IMEMND_266		14
+#define CLK_ACLK_ALB_IMEM		15
+#define CLK_ACLK_XIU_IMEMX		16
+#define CLK_ACLK_AXIUS_IMEMX		17
+#define CLK_ACLK_ASYNCAXI_IMEMX		18
+#define CLK_ACLK_ARBG_TX		19
+#define CLK_ACLK_BTS_ARBG_TX		20
+#define CLK_ACLK_SMMU_ARBG_TX		21
+#define CLK_ACLK_GIC			22
+#define CLK_ACLK_INT_MEM		23
+#define CLK_ACLK_XIU_PIMEMX		24
+#define CLK_ACLK_AXI2APB_IMEM0P		25
+#define CLK_ACLK_AXI2APB_IMEM1P		26
+#define CLK_ACLK_ASYNCAXIS_MIF_PIMEMX	27
+#define CLK_ACLK_AXIDS_PIMEMX_GIC	28
+#define CLK_ACLK_AXIDS_PIMEMX_IMEM0P	29
+#define CLK_ACLK_AXIDS_PIMEMX_IMEM1P	30
+#define CLK_ACLK_SROMC			31
+#define CLK_ACLK_AXIDS_SROMC		32
+#define CLK_ACLK_AXI2AHB_IMEMH		33
+#define CLK_PCLK_SSS			34
+#define CLK_PCLK_SLIMSSS		35
+#define CLK_PCLK_RTIC			36
+#define CLK_PCLK_SYSREG_IMEM		37
+#define CLK_PCLK_PMU_IMEM		38
+#define CLK_PCLK_ALB_IMEM		39
+#define CLK_PCLK_BTS_SSS_CCI		40
+#define CLK_PCLK_BTS_SSS_DRAM		41
+#define CLK_PCLK_BTS_SLIMSSS		42
+#define CLK_PCLK_SMMU_SSS_CCI		43
+#define CLK_PCLK_SMMU_SSS_DRAM		44
+#define CLK_PCLK_SMMU_SLIMSSS		45
+#define CLK_PCLK_SMMU_RTIC		46
+#define CLK_PCLK_ASYNCAPB_ARBG_TX	47
+#define CLK_PCLK_BTS_ARBG_TX		48
+#define CLK_PCLK_SMMU_ARBG_TX		49
+#define CLK_PCLK_ASYNCAXI_IMEMX		50
+#define CLK_PCLK_GPIO_IMEM		51
+
+#define IMEM_NR_CLK			52
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
-- 
2.20.0

