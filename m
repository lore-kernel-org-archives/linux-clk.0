Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89161C282C5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5009D21850
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D/DtEGSU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfAVJCz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:02:55 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51421 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfAVJCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 04:02:54 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190122090252euoutp0299ed4312b4da4b7fedfaf4ac2d5bf43b~8IDJJ9EUW0896308963euoutp02Y
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 09:02:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190122090252euoutp0299ed4312b4da4b7fedfaf4ac2d5bf43b~8IDJJ9EUW0896308963euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548147772;
        bh=v259pxNOA+ldScCU2PS9WMmlIqLRFNp7CjAhA2pWsL8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D/DtEGSUVD5xxowcC2+tYYk/cuJ+xFJ7aXJP9nF+DotqWIyFAGk1DKbu9nZQGzjq7
         V/lvOGRXFa+iMGNzBi++ebWbMzcuP2XvIy+5on9L5lz5cwIR6pJBQZ/u9TRvT3SsDZ
         etPLVvMvE0GLuvJZhSYvW20cV7QmzvsR1uacDPOk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190122090251eucas1p25a19f8122d0a0be28a4e76ef83d55c70~8IDIV6TW-2898828988eucas1p2e;
        Tue, 22 Jan 2019 09:02:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E0.ED.04294.B3CD64C5; Tue, 22
        Jan 2019 09:02:51 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190122090250eucas1p246a6a567d77d075716fc9f257f72a26e~8IDHrG7tp2673626736eucas1p2s;
        Tue, 22 Jan 2019 09:02:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190122090250eusmtrp1e19f15a07961e0e64815740fb04ec8e2~8IDHcDh6J2578625786eusmtrp1p;
        Tue, 22 Jan 2019 09:02:50 +0000 (GMT)
X-AuditID: cbfec7f4-c77a99c0000010c6-55-5c46dc3b4bfd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DD.F8.04128.A3CD64C5; Tue, 22
        Jan 2019 09:02:50 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090249eusmtip1041f872098925df48426c86e9b684ee2~8IDGrw03j2866828668eusmtip1u;
        Tue, 22 Jan 2019 09:02:49 +0000 (GMT)
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
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/5] clk: samsung: exynos5433: fix name typo in sssx
Date:   Tue, 22 Jan 2019 10:02:29 +0100
Message-Id: <20190122090232.29194-3-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj229nZOQ5nx2n4plY0E0xSu0GHlEjQtaLAP/4olVx6UMmpbV6y
        EITUdMx5i6aT1DQxvCfqxCvqaoTaEolVaFiKwlIpXYSXWm5Hy3/P+1y+93nhIzHhIO5BJian
        MfJkaZKIx+f2vN4w+gfNiKNOLc8R9MuKdpw2WZZwukb/FqfVQ1ZEF89/w2ijsYOgf6g+43SF
        cYhDt+pnCbrBNMWh8wb1BG0d6CXoseVH+CWBpKW6BUk6mwp5kpHVAY5E3dWEJOudR8Lxm/zg
        OCYpMYORB16M4ScoF1bw1FGne2XPdUQOWucrkSMJ1DnQtPcjJeKTQuoFgslnuTg7WBDUrBXv
        DusIlnSfeHuRn6VdGCs0Iijqm+P8izSWb2E2F486D191ExwbdqPEoC6v4tlMGNWAQd5WAW4T
        XKnLoJte2sEkyaV8YKTjgo0WUKHwfqSQy247Ck+alfZ3HKkw0Jp7eazHBd5ULtg92I7nYXeV
        vRFQfQR0rK/ibDgUtheHEYtdwWzoIljsBePlqt0FmdDfvUiw4VwET8vrOKwQBGOGKXs5jDoB
        7X2BLB0Cr2b7uTYaKGf4sOLCdnCGsh4NxtICKMgXsm5/qLZO7LbxBKW1bRdLYFLTikrQMe2+
        a7T7rtH+31uLsCbkzqQrZPGM4kwykxmgkMoU6cnxAbEpsk6086nG/xgsvahv+/YookgkchLE
        vAuLEuLSDEWWbBQBiYncBGFT4iihIE6adZ+Rp9ySpycxilHkSXJF7oIHDnORQipemsbcYZhU
        Rr6nckhHjxxUe+N3nCwzsM00vemdr0pr3FzJ7FBXTV6t6Lpiqj8ellc5EzFOniRUdcNe2QUH
        m7t9v4d0J16rz6YcSofqoqPFnMkin+Im3V0Hv8f9+Rv+3mvhufIlc+THiFiJpnQsfsPLal3Z
        NpQszqNDHsTq4bMGc7DxWNYB/XWLr/5X6xc3EVeRID3th8kV0r+aj8PKUAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7pWd9xiDDrvcllsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i/97drBb
        HH7TzurA67Fm3hpGj02rOtk8Dr7bw+TRt2UVo8fnTXIBrFF6NkX5pSWpChn5xSW2StGGFkZ6
        hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GV1P3rIWHOKpmLRkO3sD42euLkZODgkB
        E4mvE7cwdzFycQgJLGWU2Nb8gQkiIS3ReHo1lC0s8edaFxtE0SdGifnrbrCDJNgEzCUebT8D
        ViQi4CExY+JiVpAiZoH1zBJ3u5oYQRLCAu4S2y8/B0pwcLAIqEoc3GAFEuYVcJG4erCTBWKB
        vMS01V1gczgFXCVmvdrBBmILgdR0XmaFqBeUODnzCVg9M1B989bZzBMYBWYhSc1CklrAyLSK
        USS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMKK2Hfu5ZQdj17vgQ4wCHIxKPLwJF1xjhFgTy4or
        cw8xSnAwK4nwul50ixHiTUmsrEotyo8vKs1JLT7EaAr0w0RmKdHkfGC055XEG5oamltYGpob
        mxubWSiJ8543qIwSEkhPLEnNTk0tSC2C6WPi4JRqYPSWWxV4uC/gjfuMVQI682cc1Tn0JOQC
        87d112ctF/HgExfdz1y4QPB3W8lTdzPJTUwvPu16r6Aoceqah6VP23Z2o3uP401fK2e3xhjq
        HPST3cS5k3fP9XAhi192LiuviTYVOng1si4zkDn3WdzgXe8aQb1VEYtW5ym9tHM0K7xstPa5
        c6e2pRJLcUaioRZzUXEiAI6iX6m+AgAA
X-CMS-MailID: 20190122090250eucas1p246a6a567d77d075716fc9f257f72a26e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190122090250eucas1p246a6a567d77d075716fc9f257f72a26e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190122090250eucas1p246a6a567d77d075716fc9f257f72a26e
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090250eucas1p246a6a567d77d075716fc9f257f72a26e@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix typo in sssx name, there should be three letters 's'.

Acked-by: Rob Herring <robh@kernel.org>
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
2.20.0

