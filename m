Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A57BC43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD9C721473
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HxAmEcrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9C721473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbeK3C5i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 21:57:38 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48256 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbeK3C5h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 21:57:37 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181129155148euoutp01f257dd5be3ce3d22081acfcd9b1e11a4~royx3uq6H1399413994euoutp01C
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 15:51:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181129155148euoutp01f257dd5be3ce3d22081acfcd9b1e11a4~royx3uq6H1399413994euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543506708;
        bh=2PUpc/1tfmt+k9DHGt1CiyOF5QjQRiAzTe22STuYeZk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HxAmEcrPpbQyDpcJSFmrmZOjpV44hRaV/841PotygQw8KVW0pNBBxsSZzAU0ppwjK
         G9yKreLgVGQG9/rY36Q7ubbKwGBz5CLxMr8eqiNqoyrP90BoFqozvBtIgrpJghdI5q
         K0knHOK7mtdhZ/pM6wrMR93DItw02r7YZ1KrkcB8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181129155147eucas1p1a04d8bbedba57fefe776082f05fb3f22~roywxpuyt1617316173eucas1p1Z;
        Thu, 29 Nov 2018 15:51:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id DD.4F.04806.31B000C5; Thu, 29
        Nov 2018 15:51:47 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181129155146eucas1p15ff987ffae765e34b64cd2244e9078c3~royv7spKs2701227012eucas1p1v;
        Thu, 29 Nov 2018 15:51:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181129155146eusmtrp27fd42086325e1362b9e944172e0a7c2e~royvstsaM2119121191eusmtrp2f;
        Thu, 29 Nov 2018 15:51:46 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-b0-5c000b13918c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AF.D7.04128.21B000C5; Thu, 29
        Nov 2018 15:51:46 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181129155145eusmtip28afef64a05e8ea39a036631ccb30b5fb~royvG6Sg92940129401eusmtip2B;
        Thu, 29 Nov 2018 15:51:45 +0000 (GMT)
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
Subject: [PATCH v2 4/5] arm64: dts: exynos: add imem clock
Date:   Thu, 29 Nov 2018 16:51:33 +0100
Message-Id: <20181129155134.19141-5-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87rC3AwxBovXc1lsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+N1XxdjwUeOiv6P
        8xkbGDewdzFyckgImEjsatjN1MXIxSEksIJR4k3HNUYI5wujxPvDi6AynxklHn6axArTsuRQ
        L1TVckaJZUvuMoEkwFrWTbECsdkEzCUebT8DFhcRcJPomzybDaSBWaCNWeLp7C6whLCAlcTl
        LaeYQWwWAVWJlyc6gaZycPAKuEgsPGIHsUxeomHXZrBbOQVcJaat3A9WzisgKHFy5hMWEJsZ
        qKZ562xmkPkSAtvYJS73fmSBaHaROP/5EROELSzx6vgWqKdlJP7vnA8VL5fYvfUZO0RzC6PE
        3MmLoBLWEoePX2QFOYhZQFNi/S59iLCjRG97AzNIWEKAT+LGW0GIG/gkJm2bDhXmlehoE4Ko
        1pWY9/8MNNykJbr+r4OyPSR67m5hn8CoOAvJN7OQfDMLYe8CRuZVjOKppcW56anFxnmp5XrF
        ibnFpXnpesn5uZsYgcnp9L/jX3cw7vuTdIhRgINRiYfX4df/aCHWxLLiytxDjBIczEoivIc5
        GGKEeFMSK6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJxcEo1ME5vLEtu
        +mgQn7/oQ411t8p01T3LNnBsnrrdI+CK54S5RTK2l2ILLBqUua8Lb2id6br5C/NK34jljLU2
        e6zTlKwf9m7Pnhsat+QEz/x2Vd3rVi1m9teSWyUFBRYUP57ltO9cbrO859sVqbU9r9/IPLqp
        Yqo+S86rZ6f359unWHuV/rr9vygzSYmlOCPRUIu5qDgRAGlJzohKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xe7pC3AwxBl0NAhYbZ6xntbj+5Tmr
        xfwj51gt+vb9Z7Tof/ya2eL8+Q3sFh977rFazDi/j8li7ZG77BZLr19ksmjde4Td4vCbdlYH
        Ho8189Ywemxa1cnmcfDdHiaPvi2rGD0+b5ILYI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMy
        sdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy3jd18VY8JGjov/jfMYGxg3sXYycHBICJhJLDvUy
        gthCAksZJa5MdoCIS0s0nl7NBGELS/y51sXWxcgFVPOJUeLrzTksIAk2AXOJR9vPgBWJCHhI
        zJi4mBWkiFmgj1ni88HzYBuEBawkLm85xQxiswioSrw80Qm0jYODV8BFYuERO4gF8hINuzaD
        lXMKuEpMW7mfGeIgF4lHh5aDHccrIChxcuYTsL3MQPXNW2czT2AUmIUkNQtJagEj0ypGkdTS
        4tz03GIjveLE3OLSvHS95PzcTYzAKNp27OeWHYxd74IPMQpwMCrx8Dr8+h8txJpYVlyZe4hR
        goNZSYT3MAdDjBBvSmJlVWpRfnxRaU5q8SFGU6AfJjJLiSbnAyM8ryTe0NTQ3MLS0NzY3NjM
        Qkmc97xBZZSQQHpiSWp2ampBahFMHxMHp1QD41Jm4b0FXwWqWzdkcSl+l9/N+WjNk5xJ0dVv
        n920Uwrpu8WzdPrJvUqleyIOuGZu/6lT22QnEO4Rd//0G3u20jXnrFWZc1bc5S53VzvWeZNz
        hqtTV/lTS/FD4S5nnZ025X1YeilVqOmM9UvTA+maet4yAgLdx1znPd71hWd9/hcZc3Xt1t6X
        SizFGYmGWsxFxYkAxOnq1rgCAAA=
X-CMS-MailID: 20181129155146eucas1p15ff987ffae765e34b64cd2244e9078c3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181129155146eucas1p15ff987ffae765e34b64cd2244e9078c3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181129155146eucas1p15ff987ffae765e34b64cd2244e9078c3
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
        <CGME20181129155146eucas1p15ff987ffae765e34b64cd2244e9078c3@eucas1p1.samsung.com>
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

