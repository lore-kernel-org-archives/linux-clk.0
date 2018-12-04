Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC51C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC6B42082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kg9Q5+IG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC6B42082B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbeLDQxW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 11:53:22 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37325 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbeLDQxV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 11:53:21 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20181204165318euoutp024f3a5099a641eebab21387acc105c794~tL26EEMSD2212722127euoutp02j
        for <linux-clk@vger.kernel.org>; Tue,  4 Dec 2018 16:53:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20181204165318euoutp024f3a5099a641eebab21387acc105c794~tL26EEMSD2212722127euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543942399;
        bh=GPa2JE3HFr5rdstyWjxdMgU2tSngpsXZpX3djZ/WFi8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kg9Q5+IGEG7M9eSTXQHejQqGS+cj6NSw4GCAptP70KRq/2YtlZb84XR6OvQbnuS8i
         nlRWIQ1jP4+jO6sIlRhSXZ9ZrLQXctR2T4FI0ABNlEVrUQCGxxGwdgR+FAyi9WG/Cc
         rHuFKIlNzOHZP2+CN88vkELH4KFsPm8aq8NHVps8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181204165318eucas1p1281e6eb7a581e4d84060b516039b55cf~tL25T7dfR2847328473eucas1p1x;
        Tue,  4 Dec 2018 16:53:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F0.61.04806.DF0B60C5; Tue,  4
        Dec 2018 16:53:17 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165317eucas1p10bef0207ee57a9420911410ed2a22453~tL24VvL1I1618116181eucas1p1t;
        Tue,  4 Dec 2018 16:53:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181204165316eusmtrp22e30c0d7519a5c5c7c1cf652a1e8ce56~tL24GsoaN2531625316eusmtrp2H;
        Tue,  4 Dec 2018 16:53:16 +0000 (GMT)
X-AuditID: cbfec7f5-34dff700000012c6-56-5c06b0fde83a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 39.6D.04128.CF0B60C5; Tue,  4
        Dec 2018 16:53:16 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165316eusmtip184acd29add7ccc35203ac4e2ee73fa7d~tL23kMgml1979419794eusmtip1M;
        Tue,  4 Dec 2018 16:53:16 +0000 (GMT)
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
Subject: [PATCH v3 3/5] dt-bindings: clk: exynos5433: document imem clock
Date:   Tue,  4 Dec 2018 17:52:46 +0100
Message-Id: <20181204165248.17572-4-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87p/N7DFGBw8YmixccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoLpuU1JzMstQifbsEroyPvYfZChYLVNxs
        nsrcwLiet4uRk0NCwERi+d+bbF2MXBxCAisYJZae3csCkhAS+MIo8fmiJETiM6PE/ZlnWWE6
        7rxZwghRtJxRYsdsqCKghmtf+sG62QTMJR5tP8MEYosIuEn0TZ4NtoJZoI1Z4unsLrCEsICn
        xLUZF9lBbBYBVYm/p66BTeUVcJE4sWwnM8Q2eYmGXZvBajgFXCU2TfgHVSMocXLmE7BlzEA1
        zVtnM4MskBDYxC6xbdknqGYXib6ld1ggbGGJV8e3sEPYMhL/d85ngrDLJXZvfcYO0dzCKDF3
        8iKohLXE4eMXgX7mANqgKbF+lz5E2FFi5rouZpCwhACfxI23ghA38ElM2jYdKswr0dEmBFGt
        KzHv/xlowElLdP1fB2V7SLzdvottAqPiLCTfzELyzSyEvQsYmVcxiqeWFuempxYb56WW6xUn
        5haX5qXrJefnbmIEJqfT/45/3cG470/SIUYBDkYlHl6JKWwxQqyJZcWVuYcYJTiYlUR476gB
        hXhTEiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5NLUgtgskycXBKNTCq+hZefng4
        5PyjsgmPHjvs6IvavbpUPG1LB6NZD6OL8gaNqX+52lcEsf5i8b8tIcqS8kLl18KFZ9Q7uUJ3
        XC+fdtD982TfqA/bWPNm+vQ/cMyY+Tig27W0QC5N7uaJmbefhj3e0Wutm5MTI7I2fm/evCbp
        B5mf1bwOy8xrenRCzZi3fvYHDUklluKMREMt5qLiRAAF5ukqSgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7p/NrDFGCxtMrDYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8HismbeG0WPTqk42j4Pv9jB59G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbH3sNsBYsFKm42T2VuYFzP28XIySEhYCJx580S
        xi5GLg4hgaWMEgu3P2CCSEhLNJ5eDWULS/y51sUGUfSJUeLwsjeMIAk2AXOJR9vPgBWJCHhI
        zJi4mBWkiFmgj1ni88Hz7CAJYQFPiWszLoLZLAKqEn9PXQNr5hVwkTixbCczxAZ5iYZdm8Fq
        OAVcJTZN+AdWIwRUM2daLzNEvaDEyZlPWEBsZqD65q2zmScwCsxCkpqFJLWAkWkVo0hqaXFu
        em6xkV5xYm5xaV66XnJ+7iZGYCRtO/Zzyw7GrnfBhxgFOBiVeHglprDFCLEmlhVX5h5ilOBg
        VhLhvaMGFOJNSaysSi3Kjy8qzUktPsRoCvTERGYp0eR8YJTnlcQbmhqaW1gamhubG5tZKInz
        njeojBISSE8sSc1OTS1ILYLpY+LglGpgtFujcWbCgYJIC80djr8T3TIKzpQzXwlQT1jIVG7y
        Xy+TkS0m1StANl7DL/Jfxqv11b+OG/buXTd3wnH21LfXNvfLLVhvNDf9a4/pvbAHN3xjf4Sw
        F9g9mtPmPM/bSfp2QFJfz/t3TKvbT19QjD+YfCOkRsfXOevlzLYphhE+ydbXc9febu5QYinO
        SDTUYi4qTgQAAJABmroCAAA=
X-CMS-MailID: 20181204165317eucas1p10bef0207ee57a9420911410ed2a22453
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181204165317eucas1p10bef0207ee57a9420911410ed2a22453
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181204165317eucas1p10bef0207ee57a9420911410ed2a22453
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165317eucas1p10bef0207ee57a9420911410ed2a22453@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document DT bindings for imem clock of the Samsung Exynos5433 SSS (Security
SubSystem) and SlimSSS IPs.

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
2.19.1

