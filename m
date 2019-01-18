Return-Path: <SRS0=hvdj=P2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BECBC43387
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E41D20652
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SgGxmSQV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfARNRP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jan 2019 08:17:15 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36263 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfARNRP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jan 2019 08:17:15 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190118131714euoutp0206a0983fda3095947dace107a7e322ed~688F2vQq50991809918euoutp02K
        for <linux-clk@vger.kernel.org>; Fri, 18 Jan 2019 13:17:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190118131714euoutp0206a0983fda3095947dace107a7e322ed~688F2vQq50991809918euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1547817434;
        bh=4Emby0cxzZ3GtnFFpd2my2pacgDv3hyDGGWWlsK1BYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SgGxmSQVtAKGphhmOfzl/mCW2QlGXq5+44gnYQepEYXsD7C/aVOPA9hzkAOjynSK0
         2zm2zYSZNKCPzLZfgiW/xEOwbkh0Dwk2GB7GqbBswCQeO0fhgE+zJ8zePHDb33DwzU
         5Zq7jCiOX2EihFs6481AhdgBS8Hp11x1TwiQohZo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190118131713eucas1p1eb7afa64c3064ae8ad3d282668ddb5e8~688FKOCWX1532015320eucas1p1k;
        Fri, 18 Jan 2019 13:17:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 61.C0.04441.9D1D14C5; Fri, 18
        Jan 2019 13:17:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190118131712eucas1p2cf278b13bb4b51c2331a7e2c9d864e9d~688Ecjr-e1559015590eucas1p2N;
        Fri, 18 Jan 2019 13:17:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190118131712eusmtrp1453c0d41bd3be1ac355f324867fba206~688ENaKdW1588815888eusmtrp1j;
        Fri, 18 Jan 2019 13:17:12 +0000 (GMT)
X-AuditID: cbfec7f2-a1ae89c000001159-28-5c41d1d9d39f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 13.55.04128.8D1D14C5; Fri, 18
        Jan 2019 13:17:12 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190118131711eusmtip156ec1fae9c723e711541d280a1d4344e~688Dk7foz2064820648eusmtip1c;
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
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 3/5] dt-bindings: clk: exynos5433: document imem clock
Date:   Fri, 18 Jan 2019 14:16:37 +0100
Message-Id: <20190118131639.17578-4-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djP87o3LzrGGDzbym2xccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLf7v2cFu
        cfhNO6vFv2sbWRz4PNbMW8PosWlVJ5vHwXd7mDz6tqxi9Pi8SS6ANYrLJiU1J7MstUjfLoEr
        Y2XPAvaCVYIV745uZm9gXM7XxcjJISFgIjGr5zI7iC0ksIJRYtoGuS5GLiD7C6PEmc3zWCAS
        nxklZrwLhWn4d2cBE0TRckaJq7e3scB1zGnZygRSxSZgLvFo+xkwW0TATaJv8mw2kCJmgRPM
        El8b5rN2MXJwCAt4Srw7VgtSwyKgKnHo7w2wel4BF4lvF7rZILbJS0xb3QUW5xRwlZi3bgUr
        RI2gxMmZT8CuYwaqad46mxmi/hS7xLxePpDxEkBzHh6ShAgLS7w6voUdwpaROD25hwXCLpfY
        vfUZO8hpEgItjBJzJy9igkhYSxw+fhHsTGYBTYn1u/Qhwo4Ss5dfY4IYzydx460gxAV8EpO2
        TWeGCPNKdLQJQVTrSsz7f4YVwpaW6Pq/Dsr2kJj56SHLBEbFWUh+mYXkl1kIexcwMq9iFE8t
        Lc5NTy02zEst1ytOzC0uzUvXS87P3cQITFWn/x3/tIPx66WkQ4wCHIxKPLwvtjnECLEmlhVX
        5h5ilOBgVhLh5VrhGCPEm5JYWZValB9fVJqTWnyIUZqDRUmct5rhQbSQQHpiSWp2ampBahFM
        lomDU6qBUWDp0zcFcxn0DG8un8UZfeSqWu88DZtYLpb4CcK9j0K+MC46oTn7yWXhpu9pgk9K
        2ZI2W0XPs7bjfNypsNxz3ZHSbt/DWjFFN1+cLJB8LxahJR83beatDXa7GDf9OXBwPvcur7db
        JDX4t32+2LD8v0rVYc3kaGflfGODrnTlbgUjtWjmje9zlViKMxINtZiLihMB4qFAdlEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7o3LjrGGHTcFbXYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFv/37GC3
        OPymndXi37WNLA58HmvmrWH02LSqk83j4Ls9TB59W1YxenzeJBfAGqVnU5RfWpKqkJFfXGKr
        FG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsbJnAXvBKsGKd0c3szcwLufr
        YuTkkBAwkfh3ZwETiC0ksJRR4tgTQYi4tETj6dVMELawxJ9rXWxdjFxANZ8YJab3PWIHSbAJ
        mEs82n4GrEhEwENixsTFrCBFzAKXmCUeHJ7K0sXIwSEs4Cnx7lgtSA2LgKrEob83wOp5BVwk
        vl3oZoNYIC8xbXUXWJxTwFVi3roVrBAHuUhcmNPBDFEvKHFy5hMWEJsZqL5562zmCYwCs5Ck
        ZiFJLWBkWsUoklpanJueW2ykV5yYW1yal66XnJ+7iREYWduO/dyyg7HrXfAhRgEORiUe3hfb
        HGKEWBPLiitzDzFKcDArifByrXCMEeJNSaysSi3Kjy8qzUktPsRoCvTERGYp0eR8YNTnlcQb
        mhqaW1gamhubG5tZKInznjeojBISSE8sSc1OTS1ILYLpY+LglGpgrLsy4QivvumK3ffvTZ0k
        0q2+o/pM+eSudZY6y5OLFm3VfHz47g+51EW90+6cz7r3g+fff/u0FVILJq+yWv7myWlL/iVC
        jcFnYpi3zVuf+N06KaNgyZseY77NSxfPPshrdUviSfCZ5P2/L6ebtoXfK0jtyDnH+kVBym5D
        3suWqqMfLvSpnChYvFaJpTgj0VCLuag4EQCXqJ8VwgIAAA==
X-CMS-MailID: 20190118131712eucas1p2cf278b13bb4b51c2331a7e2c9d864e9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190118131712eucas1p2cf278b13bb4b51c2331a7e2c9d864e9d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190118131712eucas1p2cf278b13bb4b51c2331a7e2c9d864e9d
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
        <CGME20190118131712eucas1p2cf278b13bb4b51c2331a7e2c9d864e9d@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document DT bindings for imem clock of the Samsung Exynos5433 SSS (Security
SubSystem) and SlimSSS IPs.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
index 50d5897c9849..183c327a7d6b 100644
--- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
@@ -50,6 +50,8 @@ Required Properties:
     IPs.
   - "samsung,exynos5433-cmu-cam1" - clock controller compatible for CMU_CAM1
     which generates clocks for Cortex-A5/MIPI_CSIS2/FIMC-LITE_C/FIMC-FD IPs.
+  - "samsung,exynos5433-cmu-imem"   - clock controller compatible for CMU_IMEM
+    which generates clocks for SSS (Security SubSystem) and SlimSSS IPs.
 
 - reg: physical base address of the controller and length of memory mapped
   region.
@@ -168,6 +170,12 @@ Required Properties:
 		- aclk_cam1_400
 		- aclk_cam1_552
 
+	Input clocks for imem clock controller:
+		- oscclk
+		- aclk_imem_sssx_266
+		- aclk_imem_266
+		- aclk_imem_200
+
 Optional properties:
   - power-domains: a phandle to respective power domain node as described by
 	generic PM domain bindings (see power/power_domain.txt for more
@@ -469,6 +477,21 @@ Example 2: Examples of clock controller nodes are listed below.
 		power-domains = <&pd_cam1>;
 	};
 
+	cmu_imem: clock-controller@11060000 {
+		compatible = "samsung,exynos5433-cmu-imem";
+		reg = <0x11060000 0x1000>;
+		#clock-cells = <1>;
+
+		clock-names = "oscclk",
+			"aclk_imem_sssx_266",
+			"aclk_imem_266",
+			"aclk_imem_200";
+		clocks = <&xxti>,
+			<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
+			<&cmu_top CLK_DIV_ACLK_IMEM_266>,
+			<&cmu_top CLK_DIV_ACLK_IMEM_200>;
+	};
+
 Example 3: UART controller node that consumes the clock generated by the clock
 	   controller.
 
-- 
2.20.0

