Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B98C43610
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FD5721479
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="K4Rl3YED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD5721479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbeKUWjg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 17:39:36 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36833 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730167AbeKUWje (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 17:39:34 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181121120525euoutp01932b6193e26966cba49c7fcc0395a929~pIi1WCYSj1535715357euoutp01j
        for <linux-clk@vger.kernel.org>; Wed, 21 Nov 2018 12:05:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181121120525euoutp01932b6193e26966cba49c7fcc0395a929~pIi1WCYSj1535715357euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1542801925;
        bh=aPIefR432pcd8Oh1Knr42gOxbhNtL3G3YMqwTyU8U6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K4Rl3YEDZkrzhWrmmxHzNinaoBKSK/z7e4KevWt4Y/k4yZ1LG0fMxjUqrt6Y4zaja
         RwAIj+mF4FOoeCwhD/FxCyJM0dqYNDCmXu5sYqYNqVgtJ90//udOqJnPi/12LN9qsr
         MGBB2PD+O057uSP3oDzEcq1PhtarqPQtRZh6sG8k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181121120524eucas1p23834f7d8432a6945352aa1c35d8e3967~pIi0mWtvd1840618406eucas1p2c;
        Wed, 21 Nov 2018 12:05:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 7D.1D.04294.40A45FB5; Wed, 21
        Nov 2018 12:05:24 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181121120523eucas1p1e8c1ef3d19d0f71bbdc57e2a470c80b0~pIiz4q3p90898508985eucas1p1F;
        Wed, 21 Nov 2018 12:05:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181121120523eusmtrp2148071221214e1e18ba9c0100141e4ee~pIizppqqK0951809518eusmtrp2L;
        Wed, 21 Nov 2018 12:05:23 +0000 (GMT)
X-AuditID: cbfec7f4-835ff700000010c6-1b-5bf54a04b611
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.DE.04284.30A45FB5; Wed, 21
        Nov 2018 12:05:23 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181121120523eusmtip276b4b95a3440c2f7e9a332e1b4569813~pIizJDKf11587415874eusmtip2V;
        Wed, 21 Nov 2018 12:05:23 +0000 (GMT)
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
Subject: [PATCH 2/4] arm64: dts: bindings: document imem clock
Date:   Wed, 21 Nov 2018 13:05:07 +0100
Message-Id: <20181121120509.18892-3-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djPc7osXl+jDU6fk7DYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8HismbeG0WPTqk42j4Pv9jB59G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8bz2T9ZC14KVCzp
        qGtgfMvbxcjJISFgItH/5z5rFyMXh5DACkaJxkMnmSGcL4wS/S1foTKfGSUedfxmg2mZ9u4q
        VNVyRoklvffY4VqW3GliB6liEzCXeLT9DBOILSLgJtE3eTYbSBGzQBuzxNPZXWAJYQE7if37
        TwLt4OBgEVCV2P0gDCTMK+AisfvDNKht8hINuzaDzeQUcJVYO/kqC0SNoMTJmU/AbGagmuat
        s8EukhDYxi7xvOc6O0Szi8T/nctYIWxhiVfHt0DFZYDi85kg7HKJ3VufsUM0tzBKzJ28CCph
        LXH4+EWw45gFNCXW79KHCDtKtN5qZQYJSwjwSdx4KwhxA5/EpG3TocK8Eh1tQhDVuhLz/p+B
        ukBaouv/OijbQ6J32wPmCYyKs5B8MwvJN7MQ9i5gZF7FKJ5aWpybnlpslJdarlecmFtcmpeu
        l5yfu4kRmJxO/zv+ZQfjrj9JhxgFOBiVeHgThL9EC7EmlhVX5h5ilOBgVhLhjbT5Gi3Em5JY
        WZValB9fVJqTWnyIUZqDRUmct5rhQbSQQHpiSWp2ampBahFMlomDU6qBMUy/f2UnI9O512tP
        BUVyvcrckZEx2fvSgW/JHvJKOndcIlzaz5re44uUWnDIwyT+S8T1+Vtn7Lv0+p9s8GvbsMqO
        SJfjIrd/d52Saduo3RR1NOpWWP9ERkuVBW+uNesWecstjFh0M+ycfYvCZZVeWefbr2+cn63i
        odcaxr5X6b9r09NtZzoPKLEUZyQaajEXFScCALmPdT5KAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7rMXl+jDXb3qFpsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
        xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+P57J+sBS8FKpZ01DUwvuXtYuTkkBAwkZj27ipz
        FyMXh5DAUkaJmZsfsUEkpCUaT69mgrCFJf5c62KDKPrEKNHZuQsswSZgLvFo+xkwW0TAQ2LG
        xMWsIEXMAn3MEp8PnmcHSQgL2Ens338SKMHBwSKgKrH7QRhImFfARWL3h2lQy+QlGnZtBivn
        FHCVWDv5KgtIuRBQTe8lXohyQYmTM5+wgNjMQOXNW2czT2AUmIUkNQtJagEj0ypGkdTS4tz0
        3GJDveLE3OLSvHS95PzcTYzAGNp27OfmHYyXNgYfYhTgYFTi4U0Q/hItxJpYVlyZe4hRgoNZ
        SYQ30uZrtBBvSmJlVWpRfnxRaU5q8SFGU6AXJjJLiSbnA+M7ryTe0NTQ3MLS0NzY3NjMQkmc
        97xBZZSQQHpiSWp2ampBahFMHxMHp1QD47wS3s2SBy7e0Fj91Wid/DWWO0q3X1gVnnO58sQz
        LWW3n4V/FHc3b7bRxYK3C75NMVd645bwLEjqRI5+7J+g6KNtx/cYaz1Y0DPli3LE2l6V8x0O
        Jk89pv3zjL/iUjv3yMKPfAXhr9ZyT/zPnGNesuKh/lH5Q+uPl/2/xDx5bf+X1Q6Plx3b0KHE
        UpyRaKjFXFScCAAZclGJtwIAAA==
X-CMS-MailID: 20181121120523eucas1p1e8c1ef3d19d0f71bbdc57e2a470c80b0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181121120523eucas1p1e8c1ef3d19d0f71bbdc57e2a470c80b0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181121120523eucas1p1e8c1ef3d19d0f71bbdc57e2a470c80b0
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <CGME20181121120523eucas1p1e8c1ef3d19d0f71bbdc57e2a470c80b0@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document imem clock bindings for SSS (Security SubSystem) and SlimSSS IPs.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
index 50d5897c9849..4e4352bf5a0b 100644
--- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
@@ -19,6 +19,8 @@ Required Properties:
     which generates clocks for PMU/TMU/MCT/WDT/RTC/SECKEY/TZPC IPs.
   - "samsung,exynos5433-cmu-fsys"  - clock controller compatible for CMU_FSYS
     which generates clocks for USB/UFS/SDMMC/TSI/PDMA IPs.
+  - "samsung,exynos5433-cmu-imem"   - clock controller compatible for CMU_IMEM
+    which generates clocks for SSS (Security SubSystem) and SlimSSS IPs.
   - "samsung,exynos5433-cmu-g2d"   - clock controller compatible for CMU_G2D
     which generates clocks for G2D/MDMA IPs.
   - "samsung,exynos5433-cmu-disp"  - clock controller compatible for CMU_DISP
@@ -88,6 +90,12 @@ Required Properties:
 		- sclk_usbhost30_fsys
 		- sclk_usbdrd30_fsys
 
+	Input clocks for imem clock controller:
+		- oscclk
+		- aclk_imem_sssx_266
+		- aclk_imem_266
+		- aclk_imem_200
+
 	Input clocks for g2d clock controller:
 		- oscclk
 		- aclk_g2d_266
@@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are listed below.
 		       <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
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
 	cmu_g2d: clock-controller@12460000 {
 		compatible = "samsung,exynos5433-cmu-g2d";
 		reg = <0x12460000 0x0b08>;
-- 
2.19.1

