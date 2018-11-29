Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE46C43610
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 647D1213A2
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NQWqI+1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 647D1213A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbeK3C5h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 21:57:37 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48252 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729025AbeK3C5h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 21:57:37 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181129155147euoutp01319a5ff336831c74684ac8b5eb6dd1e6~roywsgfDq1399413994euoutp01B
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 15:51:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181129155147euoutp01319a5ff336831c74684ac8b5eb6dd1e6~roywsgfDq1399413994euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543506707;
        bh=aPIefR432pcd8Oh1Knr42gOxbhNtL3G3YMqwTyU8U6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NQWqI+1PIJgS/bD8VYp6Ap5Zxt35IeOAKVHRJbO8OZP0LU0wWmTThNoVCDUTMrW8n
         KOItqW8XIjFUtQ4TgATS3KDUS6Bj0/Yr9XR8wtnftxVh9z5DEjAn7kbGNOxS27lP6T
         SBUMCvckeh4Mn+TFaVT3cdyj/EEr0NDpZf1+5MN8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181129155146eucas1p2285750f50e1f6c156af273738a3c7f90~roywJ5QZ61780717807eucas1p2c;
        Thu, 29 Nov 2018 15:51:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A1.5B.04294.21B000C5; Thu, 29
        Nov 2018 15:51:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1~royvX6RtF1648416484eucas1p1V;
        Thu, 29 Nov 2018 15:51:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181129155145eusmtrp21a01bff133c384f7b191879e2d9e8706~royvI4nUD2119121191eusmtrp2c;
        Thu, 29 Nov 2018 15:51:45 +0000 (GMT)
X-AuditID: cbfec7f4-84fff700000010c6-d8-5c000b129691
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AE.D7.04128.11B000C5; Thu, 29
        Nov 2018 15:51:45 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181129155145eusmtip2fb1c9339649ea2339a42bb75fef5b016~royunUhwr2889528895eusmtip2T;
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
Subject: [PATCH v2 3/5] arm64: dts: bindings: document imem clock
Date:   Thu, 29 Nov 2018 16:51:32 +0100
Message-Id: <20181129155134.19141-4-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7pC3AwxBr/+KFpsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+P57J+sBS8FKpZ0
        1DUwvuXtYuTkkBAwkXg3ZTFbFyMXh5DACkaJN1emM0I4Xxgl1s3sZ4VwPjNKvHo0iQ2m5Xfz
        fCaIxHJGidc3F7LDtbRM+skOUsUmYC7xaPsZJhBbRMBNom/ybLAlzAJtzBJPZ3eBJYQFHCV+
        vrsDZrMIqEo099xlBrF5BVwkFh9YyQ6xTl6iYddmMJtTwFVi2sr9UDWCEidnPmEBsZmBapq3
        zmYGWSAhsIldYs2eKVDNLhKzJzUxQtjCEq+Ob4GKy0j83zmfCcIul9i99Rk7RHMLo8TcyYug
        EtYSh49fBIYAB9AGTYn1u/Qhwo4SS+fMBwtLCPBJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVuhLz
        /p9hhbClJbr+r4OyPST2PlvOOIFRcRaSb2Yh+WYWwt4FjMyrGMVTS4tz01OLjfJSy/WKE3OL
        S/PS9ZLzczcxAtPT6X/Hv+xg3PUn6RCjAAejEg/vi+//o4VYE8uKK3MPMUpwMCuJ8B7mYIgR
        4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwKjbd9hKtqz1
        omxul8jjnklrKhZtfjTxTK7tM34NXb6wFAGRt/dLDmwsfrt66jO2Bx72Lhla8mv2uf34fG1/
        C1N21MUtf4J/tip5l6aUn5m1SMx8D8tVfZHTDN8mPrX+JiJv+3g9j++8RbtsXQ53zsldbbnh
        JodElRab9vaSf5fr737113VYI6HEUpyRaKjFXFScCABRVnNYSwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7qC3AwxBkvXaFlsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
        xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+P57J+sBS8FKpZ01DUwvuXtYuTkkBAwkfjdPJ8J
        xBYSWMooca05FiIuLdF4ejUThC0s8edaFxtEzSdGifcfckFsNgFziUfbz4DViAh4SMyYuJi1
        i5GLg1mgj1ni88Hz7CAJYQFHiZ/v7oAVsQioSjT33GUGsXkFXCQWH1jJDrFAXqJh12Ywm1PA
        VWLayv3MEMtcJB4dWs4IUS8ocXLmExYQmxmovnnrbOYJjAKzkKRmIUktYGRaxSiSWlqcm55b
        bKRXnJhbXJqXrpecn7uJERhD24793LKDsetd8CFGAQ5GJR5eh1//o4VYE8uKK3MPMUpwMCuJ
        8B7mYIgR4k1JrKxKLcqPLyrNSS0+xGgK9MREZinR5HxgfOeVxBuaGppbWBqaG5sbm1koifOe
        N6iMEhJITyxJzU5NLUgtgulj4uCUamDcE7baXW5jeQ370sot0zzfJMc+Y/9b/unkRZFkTlGp
        F1xLzM7e8tjbra96Pfp2mYnz4nkaaQJ8b5LYoj8Vfcp9HeFUIizwSat5yca6PZOq9jL98uAT
        ebtCcc7eo5wnpze9+1hz4e6rueaLljw8wm2m9XrzwQULlnCrGZ2Wsrdylc3/6cV1nF9UiaU4
        I9FQi7moOBEAIfjccLcCAAA=
X-CMS-MailID: 20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
        <CGME20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1@eucas1p1.samsung.com>
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

