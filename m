Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0257C65BB0
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9305B2082F
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OeyIRnmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9305B2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbeLDQxw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 11:53:52 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53936 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbeLDQxV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 11:53:21 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181204165319euoutp012fd3c94e8a0edb6049cc2ec7d717eea3~tL26rC1970146401464euoutp01W
        for <linux-clk@vger.kernel.org>; Tue,  4 Dec 2018 16:53:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181204165319euoutp012fd3c94e8a0edb6049cc2ec7d717eea3~tL26rC1970146401464euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543942399;
        bh=tDZVLj4WZE1cv/Y7LF/lWBGpvVjKTow2N5/Fx/Wqzec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OeyIRnmh0mn4BEkZp8L7VRZ7kCDvYDgrcLIl3GcVB/WLF8140K4yjA28coqEOjtQs
         UacZRK6L8OSB0vPFOv+MdcxEt7jMzhBFzXHOWNUWcQ/BaMOGDEP4VkBLUpEtkwdLK9
         JvV7p2mHtpq/kW0uIakDGoh6Ye0hR7GZB/75WL28=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181204165318eucas1p2b30312e5a45749b538c88d73799af246~tL25ncFRV1854918549eucas1p2C;
        Tue,  4 Dec 2018 16:53:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C1.61.04806.EF0B60C5; Tue,  4
        Dec 2018 16:53:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275~tL241-9E21612616126eucas1p1s;
        Tue,  4 Dec 2018 16:53:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181204165317eusmtrp1024ef5a5995ffa65b37fdead1623eed6~tL24nF9qC1425714257eusmtrp1F;
        Tue,  4 Dec 2018 16:53:17 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-57-5c06b0fe910a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 64.48.04284.DF0B60C5; Tue,  4
        Dec 2018 16:53:17 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165316eusmtip1f259e993239221bd1fa2af44a47b6614~tL24D1PMC1929019290eusmtip1k;
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
Subject: [PATCH v3 4/5] arm64: dts: exynos: add imem clock
Date:   Tue,  4 Dec 2018 17:52:47 +0100
Message-Id: <20181204165248.17572-5-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7r/NrDFGKxbyWexccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoLpuU1JzMstQifbsErozm9Y9YCn5wVLz+
        v4mpgXEzexcjJ4eEgInE7GmXgWwuDiGBFYwSL58tZ4FwvjBKXG19xAjhfGaU6Lh3mBWm5W7/
        G6iW5YwSX9tfscO1nO+bBDaYTcBc4tH2M0wgtoiAm0Tf5NlsIEXMAm3MEk9ndwElODiEBawk
        Dt40B6lhEVCVmN/YA9bLK+Ai8eLKN6gD5SUadkEcyyngKrFpwj9GiBpBiZMzn7CA2MxANc1b
        ZzODzJcQ2MQuMWFmJyNEs4vErwvzoGxhiVfHt0ANlZE4PbmHBcIul9i99Rk7RHMLo8TcyYuY
        IBLWEoePX2QFOZRZQFNi/S59iLCjxOPlX5lBwhICfBI33gpC3MAnMWnbdKgwr0RHmxBEta7E
        vP9noAEnLdH1fx2U7SFxa/9GpgmMirOQfDMLyTezEPYuYGRexSieWlqcm55abJyXWq5XnJhb
        XJqXrpecn7uJEZieTv87/nUH474/SYcYBTgYlXh4JaawxQixJpYVV+YeYpTgYFYS4b2jBhTi
        TUmsrEotyo8vKs1JLT7EKM3BoiTOW83wIFpIID2xJDU7NbUgtQgmy8TBKdXAqLjEYpV2QGd3
        1/9f25trPnh+uOR29G1BXVdDgVV1iJ5kczhD+OZ9IjkNTF/rLkYIbXijfPWnUeeqGgXhdivB
        8uhn3Ruvhf5iSH7h3Lhp/w2h66vPar9WLjDbrNx7e8s9ZpdzMlIdnfv27hWbmDPzc75W/vej
        ye/sG9u7cw/+mua3IstU+tUhJZbijERDLeai4kQA506JGUsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7p/N7DFGCy6KWqxccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
        E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzm9Y9YCn5wVLz+v4mpgXEzexcjJ4eEgInE3f43
        QDYXh5DAUkaJvbsbmSAS0hKNp1dD2cISf651sYHYQgKfGCU6txiD2GwC5hKPtp8BqxER8JCY
        MXExK8ggZoE+ZonPB88DTeXgEBawkjh40xykhkVAVWJ+Yw/YYl4BF4kXV75BHSEv0bAL4iBO
        AVeJTRP+MULscpGYM62XGaJeUOLkzCcsIDYzUH3z1tnMExgFZiFJzUKSWsDItIpRJLW0ODc9
        t9hQrzgxt7g0L10vOT93EyMwirYd+7l5B+OljcGHGAU4GJV4eCWnsMUIsSaWFVfmHmKU4GBW
        EuG9owYU4k1JrKxKLcqPLyrNSS0+xGgK9MREZinR5HxghOeVxBuaGppbWBqaG5sbm1koifOe
        N6iMEhJITyxJzU5NLUgtgulj4uCUamB071rixP8/6eKGH7ZtmT3m+XkB/zb9P7lwguivnTlB
        a14yTdjCfF3vj9GdX+XXv/kpfUjZo2bsHfj3bhBD1XyZVQee/fdmuS1r+Nb4ptAuxpMXzj6V
        OykV1fpke3lrXKzl+WWuWh8rxS52rHcXudIktLVc5Px8nk69BZKcPr+Kaya6RM7g6y9VYinO
        SDTUYi4qTgQA+7TCG7gCAAA=
X-CMS-MailID: 20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add description for imem clock in the Samsung Exynos5433. The users can use
compatibility "samsung,exynos5433-cmu-imem".

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 2131f12364cb..378cd3d87ff0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -544,6 +544,21 @@
 			power-domains = <&pd_cam1>;
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
 		pd_gscl: power-domain@105c4000 {
 			compatible = "samsung,exynos5433-pd";
 			reg = <0x105c4000 0x20>;
-- 
2.19.1

