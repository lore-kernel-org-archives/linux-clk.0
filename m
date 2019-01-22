Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C0DC282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54C4421019
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fVgdAh/b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfAVJDC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:03:02 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51430 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbfAVJCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 04:02:54 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190122090252euoutp0219eb52ccff176f62e322d950b605c475~8IDJkfbQV0896308963euoutp02a
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 09:02:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190122090252euoutp0219eb52ccff176f62e322d950b605c475~8IDJkfbQV0896308963euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548147772;
        bh=4Emby0cxzZ3GtnFFpd2my2pacgDv3hyDGGWWlsK1BYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fVgdAh/bAueR0NtBPiKqTAxNNofkYOv8os4LRVJxh/w6SGkI441u7xcMIfIyLAOSY
         6T1YO5dMrQOWkP7CBYq0ZgIoYfthoZUSl7KG3ULLplu7BZNU/qRg+nmZlxdJTtuUiM
         M0MY5JV3H1jTQVG9lj4bSGTTS2h+rS7U0jy/gCBw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190122090252eucas1p152d98a549c132dcdeceec9ab837c0f26~8IDI-s38k2542325423eucas1p1f;
        Tue, 22 Jan 2019 09:02:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 03.ED.04294.B3CD64C5; Tue, 22
        Jan 2019 09:02:51 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190122090251eucas1p2db2f383c0b8b4034f66b6a82b0a22d67~8IDIQgcno2908029080eucas1p2j;
        Tue, 22 Jan 2019 09:02:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190122090251eusmtrp1604fd8615ffd46884b365fc3ded392f1~8IDIBpIqr2578625786eusmtrp1s;
        Tue, 22 Jan 2019 09:02:51 +0000 (GMT)
X-AuditID: cbfec7f4-c77a99c0000010c6-5b-5c46dc3b3f80
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7D.E2.04284.A3CD64C5; Tue, 22
        Jan 2019 09:02:50 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090250eusmtip1913c40601868a208a702f74fb240ecb2~8IDHPUyss2864328643eusmtip1M;
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
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 3/5] dt-bindings: clk: exynos5433: document imem clock
Date:   Tue, 22 Jan 2019 10:02:30 +0100
Message-Id: <20190122090232.29194-4-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7rWd9xiDJYtNrbYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFv/37GC3
        OPymndXi37WNLA58HmvmrWH02LSqk83j4Ls9TB59W1YxenzeJBfAGsVlk5Kak1mWWqRvl8CV
        sbJnAXvBKsGKd0c3szcwLufrYuTkkBAwkTj+bQtzFyMXh5DACkaJBRs3skI4XxglVnzdwQjh
        fGaU+H36EyNMy7Z9H6ASyxklOh40McO1nO7sYQGpYhMwl3i0/QwTiC0i4CbRN3k2G0gRs8AJ
        ZomvDfNZQRLCAp4Smx60M4PYLAKqEkd3TgFr5hVwkfgy8RIrxDp5iWmru8AGcQq4Ssx6tYMN
        okZQ4uTMJ2D1zEA1zVtng10hIXCMXeLc6w8sEM0uEhcnvWGDsIUlXh3fwg5hy0icntwDVVMu
        sXvrM3aI5hZGibmTFzFBJKwlDh+/CHQFB9AGTYn1u/Qhwo4S/Yd3goUlBPgkbrwVhLiBT2LS
        tunMEGFeiY42IYhqXYl5/89AvSIt0fV/HZTtIXHq9j7mCYyKs5B8MwvJN7MQ9i5gZF7FKJ5a
        WpybnlpslJdarlecmFtcmpeul5yfu4kRmLRO/zv+ZQfjrj9JhxgFOBiVeHgTLrjGCLEmlhVX
        5h5ilOBgVhLhdb3oFiPEm5JYWZValB9fVJqTWnyIUZqDRUmct5rhQbSQQHpiSWp2ampBahFM
        lomDU6qBsWynS/6Cw0fvmN42MzYoPs27Rehswup43xMJDw7JCtxSX2TRddipvqJTMFjYqWhh
        YfTPnXN3XBXg9nLc/kKYa80ZwYYLPdaaL4OcvmxhkfNmMPHymp5wTfux/clJ9jkzw/+c4c1+
        bzrnyuQZF09kFCQ5+ChqLDbhXMov3b+gLJr1SHsEy78sJZbijERDLeai4kQA11NLp1YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7pWd9xiDL4cNbTYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFv/37GC3
        OPymndXi37WNLA58HmvmrWH02LSqk83j4Ls9TB59W1YxenzeJBfAGqVnU5RfWpKqkJFfXGKr
        FG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsbJnAXvBKsGKd0c3szcwLufr
        YuTkkBAwkdi27wNjFyMXh5DAUkaJL8t2MkEkpCUaT6+GsoUl/lzrYoMo+sQocfX7TGaQBJuA
        ucSj7WfAikQEPCRmTFzMClLELHCJWeLB4aksIAlhAU+JTQ/awRpYBFQlju6cAhbnFXCR+DLx
        EivEBnmJaau7wAZxCrhKzHq1gw3EFgKqudp5mRWiXlDi5MwnYL3MQPXNW2czT2AUmIUkNQtJ
        agEj0ypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA6Np27OfmHYyXNgYfYhTgYFTi4eU45xoj
        xJpYVlyZe4hRgoNZSYTX9aJbjBBvSmJlVWpRfnxRaU5q8SFGU6AnJjJLiSbnAyM/ryTe0NTQ
        3MLS0NzY3NjMQkmc97xBZZSQQHpiSWp2ampBahFMHxMHp1QDo8oqv1tGr17l3DHY47Vej3t5
        9WSB+/8rEpj2adsoad0Rv721IP3ueZf/tvy2c/JtO/1kIxu2vD/7Ysruc4ph52bP+7CIhSHh
        7KbwoOT0V5slzqmzvVps8josd2WHmYH0KZ2Pt8znPv7YEHzvSsOMlVduqE2vvv6Ca61zS0FB
        +Ka5gnK/N2eGHlViKc5INNRiLipOBADgt3WtxAIAAA==
X-CMS-MailID: 20190122090251eucas1p2db2f383c0b8b4034f66b6a82b0a22d67
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190122090251eucas1p2db2f383c0b8b4034f66b6a82b0a22d67
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190122090251eucas1p2db2f383c0b8b4034f66b6a82b0a22d67
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090251eucas1p2db2f383c0b8b4034f66b6a82b0a22d67@eucas1p2.samsung.com>
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

