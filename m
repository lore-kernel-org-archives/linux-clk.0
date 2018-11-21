Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65430C43610
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D1C821479
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d7GIipUI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D1C821479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbeKUWje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 17:39:34 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36840 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbeKUWje (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 17:39:34 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181121120526euoutp01403ff7d652fc12c981b266839e7c822e~pIi2H0Lui1538615386euoutp01j
        for <linux-clk@vger.kernel.org>; Wed, 21 Nov 2018 12:05:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181121120526euoutp01403ff7d652fc12c981b266839e7c822e~pIi2H0Lui1538615386euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1542801926;
        bh=2PUpc/1tfmt+k9DHGt1CiyOF5QjQRiAzTe22STuYeZk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d7GIipUILyRlwSoHVqxfBZ/mWn4xcpaM41OruBCUNMLRYYlXMaVEu8AT2h+RUOjSL
         aYdMdaeHPeO/RlJhwQU9dVac7RUrFJJyG7efnVzrpBVxeZ1/0VxTmvnzzP8hfnCDAV
         XZImmYEPZI9OOkj3wSw/nZ2QuV9a8J2SYyyLQ5OE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181121120525eucas1p1f73a1d44349b1eb947e0d40442b7049f~pIi1RdioE2011820118eucas1p10;
        Wed, 21 Nov 2018 12:05:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id FF.38.04806.50A45FB5; Wed, 21
        Nov 2018 12:05:25 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181121120524eucas1p2545f7ee0ed4064a10b3bc18f446c288c~pIi0coL9j1840218402eucas1p2p;
        Wed, 21 Nov 2018 12:05:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181121120524eusmtrp2a467ba9f4aad865732857d09082a65d0~pIi0NZc1H0951809518eusmtrp2N;
        Wed, 21 Nov 2018 12:05:24 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-3c-5bf54a05f7f7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.DE.04284.40A45FB5; Wed, 21
        Nov 2018 12:05:24 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181121120523eusmtip2da787aefd9f254272c9b21f750cb30da~pIizpPLdX1531815318eusmtip2a;
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
Subject: [PATCH 3/4] arm64: dts: exynos: add imem clock
Date:   Wed, 21 Nov 2018 13:05:08 +0100
Message-Id: <20181121120509.18892-4-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87qsXl+jDSadYbXYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8HismbeG0WPTqk42j4Pv9jB59G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8brvi7Ggo8cFf0f
        5zM2MG5g72Lk5JAQMJHYMuccWxcjF4eQwApGiVc9U6CcL4wSV89+ZYdwPjNKzHz+kLGLkQOs
        5fmRUoj4ckaJzc3TETrerbzEBDKXTcBc4tH2M2C2iICbRN/k2WBFzAJtzBJPZ3eBJYSBiv5P
        nMwMYrMIqEpsXPwIzOYVcJHoX/CIDeJAeYmGXZvBjuUUcJVYO/kqC0SNoMTJmU/AbGagmuat
        s5lBFkgIbGOX+NKzkgmi2UVib/smVghbWOLV8S1QX8tI/N85H6qmXGL31mfsEM0tjBJzJy+C
        SlhLHD5+kRXkZ2YBTYn1u/Qhwo4SB5uOsUGCgk/ixltBiBv4JCZtm84MEeaV6GgTgqjWlZj3
        /wzUBdISXf/XQdkeEptvrGOfwKg4C8k3s5B8Mwth7wJG5lWM4qmlxbnpqcXGeanlesWJucWl
        eel6yfm5mxiB6en0v+NfdzDu+5N0iFGAg1GJhzdB+Eu0EGtiWXFl7iFGCQ5mJRHeSJuv0UK8
        KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJpCeWpGanphakFsFkmTg4pRoYo3dGF+dfOhkk
        /nFazfo/FU9nXnP9JNzo1RdQ61hj1rY1v0jr7q21TlYnmsTTuFR2xK+ZzX+nYrt704FbQSeZ
        LJQj1X3YK2MP7UtnWvd7x4EN58rj9fkjg/e93dovGv3SiKHw6P4ou0OnZRg/XfhVcIzf0KHT
        UtvXspvt1uvM5vzMzbl/pRcosRRnJBpqMRcVJwIAlIOK0EsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xe7osXl+jDXad47bYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8HismbeG0WPTqk42j4Pv9jB59G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbrvi7Ggo8cFf0f5zM2MG5g72Lk4JAQMJF4fqS0
        i5GLQ0hgKaPE09+L2boYOYHi0hKNp1czQdjCEn+udbFBFH1ilDgw7TQ7SIJNwFzi0fYzYEUi
        Ah4SMyYuZgUpYhboY5b4fPA8WJEwUNH/iZOZQWwWAVWJjYsfgdm8Ai4S/QseQW2Tl2jYtRms
        nlPAVWLt5KssINcJAdX0XuKFKBeUODnzCQuIzQxU3rx1NvMERoFZSFKzkKQWMDKtYhRJLS3O
        Tc8tNtQrTswtLs1L10vOz93ECIyibcd+bt7BeGlj8CFGAQ5GJR7eBOEv0UKsiWXFlbmHGCU4
        mJVEeCNtvkYL8aYkVlalFuXHF5XmpBYfYjQF+mEis5Rocj4wwvNK4g1NDc0tLA3Njc2NzSyU
        xHnPG1RGCQmkJ5akZqemFqQWwfQxcXBKNTDO+rFs5iSTOMZ7YR4CCXcLlp3uZ1soJv1is7xQ
        s+Vfn5ZZcwMdZeLiVY4UZrRYthblXb/2cXllFktW+RfJ038sjqy793LP9yYnft6AI3UPOAv7
        ZjtJhwgfm7OZzbgiY2ktn11xpeXUW6d/npC78XZu3J05cfslPP4vyFKZNSfYoVQ074u9zxwl
        luKMREMt5qLiRAAkvMhguAIAAA==
X-CMS-MailID: 20181121120524eucas1p2545f7ee0ed4064a10b3bc18f446c288c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181121120524eucas1p2545f7ee0ed4064a10b3bc18f446c288c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181121120524eucas1p2545f7ee0ed4064a10b3bc18f446c288c
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <CGME20181121120524eucas1p2545f7ee0ed4064a10b3bc18f446c288c@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add description for imem clock. The users can use compatibility
"samsung,exynos5433-cmu-imem".

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 2131f12364cb..34055fa3a9d0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -340,6 +340,21 @@
 				<&cmu_top CLK_SCLK_USBDRD30_FSYS>;
 		};
 
+		cmu_imem: clock-controller@11060000 {
+			compatible = "samsung,exynos5433-cmu-imem";
+			reg = <0x11060000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				"aclk_imem_sssx_266",
+				"aclk_imem_266",
+				"aclk_imem_200";
+			clocks = <&xxti>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_266>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_200>;
+		};
+
 		cmu_g2d: clock-controller@12460000 {
 			compatible = "samsung,exynos5433-cmu-g2d";
 			reg = <0x12460000 0x1000>;
-- 
2.19.1

