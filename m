Return-Path: <SRS0=8ZDx=MO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0ADC43143
	for <linux-clk@archiver.kernel.org>; Tue,  2 Oct 2018 11:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 285F12089A
	for <linux-clk@archiver.kernel.org>; Tue,  2 Oct 2018 11:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MATYoSiY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285F12089A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbeJBSfS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Oct 2018 14:35:18 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45970 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727510AbeJBSfS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Oct 2018 14:35:18 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20181002115221euoutp02ebc3502223a38bc5e5e6feb3729222cb~ZyHJiGsvK2696526965euoutp02M;
        Tue,  2 Oct 2018 11:52:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20181002115221euoutp02ebc3502223a38bc5e5e6feb3729222cb~ZyHJiGsvK2696526965euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1538481141;
        bh=tkzFoqdyXUE0fEabu9IjR2ZjdeoI14v46fnrlUnf5A8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=MATYoSiYBkXYYmS8uV48wyxwx3qutcx+95cjiL+HRgXlV+NwUhu7R2Y/z60qOEsmf
         RmwxzzlcDDJ3c1/VDwwIH/811ZziumsAn7Jo86IlKaeRw8C/c3/DQKggqVKLYuFVsX
         PG/Koy+ShyVFcnEJjSQp20B1TM44f8F5D3gI+Tss=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181002115220eucas1p19c51bd9ef346a4cbdb7a6f246bff180e~ZyHJG2mi23041430414eucas1p1m;
        Tue,  2 Oct 2018 11:52:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id BE.6E.04294.4FB53BB5; Tue,  2
        Oct 2018 12:52:20 +0100 (BST)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181002115219eucas1p23816d543c4dedb233406869c22713a95~ZyHIRKW743260632606eucas1p2D;
        Tue,  2 Oct 2018 11:52:19 +0000 (GMT)
X-AuditID: cbfec7f4-c77a99c0000010c6-11-5bb35bf48404
Received: from eusync1.samsung.com ( [203.254.199.211]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 01.FF.04284.3FB53BB5; Tue,  2
        Oct 2018 12:52:19 +0100 (BST)
Received: from AMDC2765.digital.local ([106.116.147.25]) by
        eusync1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0 64bit
        (built May  5 2014)) with ESMTPA id <0PFY009KWZN48Y50@eusync1.samsung.com>;
        Tue, 02 Oct 2018 12:52:19 +0100 (BST)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: Use clk_hw API for calling clk framework from
 clk notifiers
Date:   Tue, 02 Oct 2018 13:52:10 +0200
Message-id: <20181002115210.15541-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsWy7djPc7pfojdHG+xZrmyxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3aL96UtmB3aPTas62Tz6tqxi9Pi8SS6AOYrLJiU1J7Ms
        tUjfLoEr49vMmWwF+4Qrtu95xdzAuEegi5GTQ0LAROLCgt3MXYxcHEICKxglnv86ygbhfGaU
        6Dw6nRWm6mjzTSaIxDJGiSW717BDOA1MEt1fHrGAVLEJGEp0ve1iA7FFBBwkPn96zQhSxCzw
        mFFi68mvzCAJYYEYiV97fjCB2CwCqhL3Or+D2bwCthJrZs5mgVgnL7F6wwGwoyQE7rJKHL/b
        D3WHi8TP5+1sELawxKvjW9ghbBmJzo6DTBANzYwS7TNmsUM4PUCr5+yA6rCWOHz8ItgkZgE+
        iUnbpgOt4ACK80p0tAlBlHhIfN/0E2yokECsxNGvt9kmMEosYGRYxSieWlqcm55abJSXWq5X
        nJhbXJqXrpecn7uJERhZp/8d/7KDcdefpEOMAhyMSjy8DPKbooVYE8uKK3MPMUpwMCuJ8LJa
        b44W4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrts3sZoIYH0xJLU7NTUgtQimCwTB6dUA2PBx2xt
        g9dRl3+E38lr7H7+/phaogrX4oeyJ3O71z34MfOn5/nXt7P37df+5mf24ZTe292dTy8WLNs0
        VXzllFV698903Epb7XhVM7T1bOOxeE/+2fdipoqyntB7HbzsoOIOX82MnUk+5q+62foPPS0I
        NntzK3uL+xseuQidXZpntt1dmfjvU8cfJZbijERDLeai4kQAm+poRagCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGJMWRmVeSWpSXmKPExsVy+t/xy7qfozdHG/w7ZGaxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3aL96UtmB3aPTas62Tz6tqxi9Pi8SS6AOYrLJiU1J7Ms
        tUjfLoEr49vMmWwF+4Qrtu95xdzAuEegi5GTQ0LAROJo802mLkYuDiGBJYwSWzf3M0I4TUwS
        SxYdZwepYhMwlOh628UGYosIOEh8/vQarIhZ4DGjxLnFG1hBEsICMRK/9vxgArFZBFQl7nV+
        B7N5BWwl1syczQKxTl5i9YYDzBMYuRYwMqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQI9P22
        Yz8372C8tDH4EKMAB6MSDy+D/KZoIdbEsuLK3EOMEhzMSiK8rNabo4V4UxIrq1KL8uOLSnNS
        iw8xSnOwKInznjeojBISSE8sSc1OTS1ILYLJMnFwSjUw5s1ttSrgtUwyzK6d91eh/cizY0tn
        ZKsxv96ccEE/5dGhiT3OH3nqb5+c2CzTtlzH/ayRX9uRNSf+b+qX3fplN9tTp4+Psq6kWzPP
        U376o0zF9+I26f1sM123dAjIBsx5en8dcxgfw7MWht4LkepTAy/yBViqSW425bWdZv4rRzxY
        p8V76rUnSizFGYmGWsxFxYkA6unFHPkBAAA=
X-CMS-MailID: 20181002115219eucas1p23816d543c4dedb233406869c22713a95
X-Msg-Generator: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181002115219eucas1p23816d543c4dedb233406869c22713a95
References: <CGME20181002115219eucas1p23816d543c4dedb233406869c22713a95@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_notifier_register() documentation states, that the provided notifier
callbacks associated with the notifier must not re-enter into the clk
framework by calling any top-level clk APIs. Fix this by replacing
clk_get_rate() calls with clk_hw_get_rate(), which is safe in this
context.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-cpu.c | 6 +++---
 drivers/clk/samsung/clk-cpu.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index d2c99d8916b8..a5fddebbe530 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -152,7 +152,7 @@ static int exynos_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 			struct exynos_cpuclk *cpuclk, void __iomem *base)
 {
 	const struct exynos_cpuclk_cfg_data *cfg_data = cpuclk->cfg;
-	unsigned long alt_prate = clk_get_rate(cpuclk->alt_parent);
+	unsigned long alt_prate = clk_hw_get_rate(cpuclk->alt_parent);
 	unsigned long alt_div = 0, alt_div_mask = DIV_MASK;
 	unsigned long div0, div1 = 0, mux_reg;
 	unsigned long flags;
@@ -280,7 +280,7 @@ static int exynos5433_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 			struct exynos_cpuclk *cpuclk, void __iomem *base)
 {
 	const struct exynos_cpuclk_cfg_data *cfg_data = cpuclk->cfg;
-	unsigned long alt_prate = clk_get_rate(cpuclk->alt_parent);
+	unsigned long alt_prate = clk_hw_get_rate(cpuclk->alt_parent);
 	unsigned long alt_div = 0, alt_div_mask = DIV_MASK;
 	unsigned long div0, div1 = 0, mux_reg;
 	unsigned long flags;
@@ -432,7 +432,7 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	else
 		cpuclk->clk_nb.notifier_call = exynos_cpuclk_notifier_cb;
 
-	cpuclk->alt_parent = __clk_lookup(alt_parent);
+	cpuclk->alt_parent = __clk_get_hw(__clk_lookup(alt_parent));
 	if (!cpuclk->alt_parent) {
 		pr_err("%s: could not lookup alternate parent %s\n",
 				__func__, alt_parent);
diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index d4b6b517fe1b..bd38c6aa3897 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -49,7 +49,7 @@ struct exynos_cpuclk_cfg_data {
  */
 struct exynos_cpuclk {
 	struct clk_hw				hw;
-	struct clk				*alt_parent;
+	struct clk_hw				*alt_parent;
 	void __iomem				*ctrl_base;
 	spinlock_t				*lock;
 	const struct exynos_cpuclk_cfg_data	*cfg;
-- 
2.17.1

