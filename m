Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE2CC65BB0
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 589FA2082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KE8A6lLu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 589FA2082B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbeLDQxW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 11:53:22 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37324 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbeLDQxW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 11:53:22 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20181204165318euoutp022a6a7f89c99c2188e261a7cb4d7fd02d~tL25VaSP82212722127euoutp02i
        for <linux-clk@vger.kernel.org>; Tue,  4 Dec 2018 16:53:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20181204165318euoutp022a6a7f89c99c2188e261a7cb4d7fd02d~tL25VaSP82212722127euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543942398;
        bh=uS4i7uCjTEDvPajx514u8TksjmHmSKJ8edNnyMV3KnU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KE8A6lLuh465yYWM7SYOF2cmoPpDryo3cKqWFDx5jWNK9/NqY2uDqCyXAR31MP5kN
         CpMN42aU7peeNxW2/2g9p1bdyi2xX8vk0Rm3bRnyb4BFVj4wB9zzO251VR4MVV8SVT
         V9JgBDgaTfyNxtPUUeYBwKjO5z1SN6DVb/3wEsXM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181204165317eucas1p2cef4742bfd7e00bf8635552fa24d8e43~tL24th8lz2034220342eucas1p2C;
        Tue,  4 Dec 2018 16:53:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 0E.7F.04294.DF0B60C5; Tue,  4
        Dec 2018 16:53:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181204165316eucas1p2ba063b96e83d2d2be93ca067d32d7926~tL230ymOk3220732207eucas1p2C;
        Tue,  4 Dec 2018 16:53:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181204165316eusmtrp1a5aa9f227dfad9e95a6c11c4985fbc64~tL23lng9n1425714257eusmtrp1D;
        Tue,  4 Dec 2018 16:53:16 +0000 (GMT)
X-AuditID: cbfec7f4-835ff700000010c6-46-5c06b0fd9a49
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 73.48.04284.CF0B60C5; Tue,  4
        Dec 2018 16:53:16 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165315eusmtip102d29d2348bd95536d66a20258d1b34a~tL23Eq9Gk2005320053eusmtip18;
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
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 2/5] clk: samsung: exynos5433: fix name typo in sssx
Date:   Tue,  4 Dec 2018 17:52:45 +0100
Message-Id: <20181204165248.17572-3-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju29nZjtPJcUp7U7EcJWioFUKHCknQOhBU9EtKyJUn71N2vE0j
        RxfNIWpN8EZWhpXmderUeQEvZeZy+Usju6hp5o3E/Sgy17azzH/P+1x43vfjIzBJN+5JxCvS
        GKVCniQTiPj6V79MgX9aBFGH3hoEVGt5M05Nmr/h1MPhcZwq6rcgqnhuGaNMphYhtV74CafK
        Tf08qnH4o5CqnZzgUXf6hoXU0Eo+ftKFbqhuQLSuvkBAD6z18uii9npEb+h8zuMXRSdimKT4
        DEYZHBotiptbfIFSK1yy7nVOCdXIJNIgJwLIEFi5O45pkIiQkM8RFJeU4NxgRqBefOMYNhA0
        /Z7EtyM/DXxOeIagt6pOsB0xvuvDbC4BeRRmO408G/YgT0GRtspuwsg8DOarNHbBnTwNPX3f
        7QE+eQCaZ6rtFWIyHFqfrGJc3V5QG9qENuxERoCuZAtxHjcYrfjKt2HM6rnVUWW/Aki9EAaM
        zXwuHA6b6lXEYXdYGmkXctgbxrSFDk8m9HQsCLnwbQQPtDU8TjgOQyMT1o0Ia4M/NBuCOToM
        9KU3MRsNpCtMrbpxO7jCfX2ZgxbD3TwJ5w6EaovR8XJeoLE0OTAN74cGsBLkW7njmsod11T+
        732EsHokZdLZ5FiGPaJgMoNYeTKbrogNupqSrEPWDzW2NWLuQobNK4OIJJDMRQylgigJLs9g
        VcmDCAhM5iGe9rNS4hi5KptRplxWpicx7CDyIvgyqThn15dLEjJWnsYkMkwqo/yn8ggnTzWi
        cqZn0ifxoq461dzmhWVzC33DF8sHt7lajA2J0b507Wo7GJwQET3jHVqDOrvnE2fJutHHeesr
        ZSNMwL6FSK30R0KT6XXbHmx3d5qf/wfLtYLIMNOQ1Pnc9fa1Th3hFB7pQ4at7c9SnWksLF3q
        yCbHPzek0k/P5uY6q44l6GR8Nk5+OABTsvK/l1mrUUwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7p/NrDFGOw5zm+xccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
        E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzHL1YzFszkqZi4/QZ7A+N5ri5GTg4JAROJNz92
        sXQxcnEICSxllDhxfjsbREJaovH0aiYIW1jiz7UuNoiiT4wSE9cfYQFJsAmYSzzafgasSETA
        Q2LGxMWsIEXMAn3MEp8PnmcHSQgLuEvs3vuSGcRmEVCVWP9wHiuIzSvgIrFx8VtmiA3yEg27
        NoPVcwq4Smya8I8RxBYCqpkzrZcZol5Q4uTMJ2CLmYHqm7fOZp7AKDALSWoWktQCRqZVjCKp
        pcW56bnFhnrFibnFpXnpesn5uZsYgZG07djPzTsYL20MPsQowMGoxMMrOYUtRog1say4MvcQ
        owQHs5II7x01oBBvSmJlVWpRfnxRaU5q8SFGU6AnJjJLiSbnA6M8ryTe0NTQ3MLS0NzY3NjM
        Qkmc97xBZZSQQHpiSWp2ampBahFMHxMHp1QDo+eyKQyHrwkH/wp25Wyd0vOsvKQigP2j9kl1
        GzEd5yilitIKrpltrm5K8xwDj62fHSsgu1Ng8Yw58g/eqRnukM37w7LxYIdJwzQ14Yyza7N7
        pq8NdV2qvEze5Epwd5VCa1zD+hc+909zuh2bYHgwb8N1zymVO00Ej4n6sQmnXvhuGMUbPzlP
        iaU4I9FQi7moOBEAjMhtQroCAAA=
X-CMS-MailID: 20181204165316eucas1p2ba063b96e83d2d2be93ca067d32d7926
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181204165316eucas1p2ba063b96e83d2d2be93ca067d32d7926
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181204165316eucas1p2ba063b96e83d2d2be93ca067d32d7926
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165316eucas1p2ba063b96e83d2d2be93ca067d32d7926@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix typo in sssx name, there should be three letters 's'.

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
2.19.1

