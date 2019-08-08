Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38278C433FF
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 12:18:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 020BD21881
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 12:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pJEYtsIC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbfHHMSu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 08:18:50 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44306 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbfHHMSu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Aug 2019 08:18:50 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190808121848euoutp019bc0cce36b8383d160bfec66d4d4b5bb~48cvQwxm10371903719euoutp01D
        for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2019 12:18:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190808121848euoutp019bc0cce36b8383d160bfec66d4d4b5bb~48cvQwxm10371903719euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565266728;
        bh=y8i37Y/H5dBf9+Gnj7ZmjwUKzcNbsEEyTTJGi/7kLTg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=pJEYtsIC6mjwvkveT88WWAoXS5GXATakAKkEw7SyD7BqLvVfNfK7YzfJmEXnv8LtY
         PolWpc/kaPAxsn5/R02BdJH86VdCkSUz1lLIc3DpRLfKuqC10IL/63zOW+iZKtgz/Y
         mB1hfbduBh7hhvqeChi3jo6ektGAXWGjKn6b6jPc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190808121847eucas1p1edb3ab6608fb7af0866e958609708762~48cuzOv7B0161901619eucas1p1D;
        Thu,  8 Aug 2019 12:18:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B9.08.04374.7231C4D5; Thu,  8
        Aug 2019 13:18:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746~48ctzClXn0162301623eucas1p1B;
        Thu,  8 Aug 2019 12:18:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190808121846eusmtrp2034067aa5781c2d1d013e0b2dcf499f5~48ctkbFdF1089510895eusmtrp2C;
        Thu,  8 Aug 2019 12:18:46 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-6b-5d4c132703a3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D9.78.04166.6231C4D5; Thu,  8
        Aug 2019 13:18:46 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190808121845eusmtip1ba406be6dd0bee1060a585872f18d28e~48ctLBZKE0828108281eusmtip1I;
        Thu,  8 Aug 2019 12:18:45 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: exynos542x: Move MSCL subsystem clocks to its
 sub-CMU
Date:   Thu,  8 Aug 2019 14:18:39 +0200
Message-Id: <20190808121839.23892-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7djP87rqwj6xBlNXS1hsnLGe1eL6l+es
        FufPb2C3+Nhzj9Vixvl9TBZrj9xlt2h/+pLZgd1j06pONo++LasYPT5vkgtgjuKySUnNySxL
        LdK3S+DKeLuIt6BBpaJp+XW2BsZdcl2MnBwSAiYSHTvWsXUxcnEICaxglDj+cyMThPOFUeLx
        lXUsIFVCAp8ZJbbe9IfpuLi4ix2iaDmjxOzpN1nhOg7NnswMUsUmYCjR9baLDcQWEXCQ+Pzp
        NSNIEbPAY6BJJ7+CFQkLhEls7n7JCmKzCKhKdCztYQKxeQVsJZ5f+cQKsU5eYvWGA8wgzRIC
        B9gklj89ArSbA8hxkbj62RqiRlji1fEt7BC2jMT/nfOZIOqbGSUenlvLDuH0MEpcbprBCFFl
        LXH4+EVWkEHMApoS63fpQ4QdJS5/X8UGMZ9P4sZbQZAwM5A5adt0Zogwr0RHmxBEtZrErOPr
        4NYevHCJGcL2kDiycyIbJORiJW58vsQ6gVFuFsKuBYyMqxjFU0uLc9NTi43zUsv1ihNzi0vz
        0vWS83M3MQLj/vS/4193MO77k3SIUYCDUYmH98Qp71gh1sSy4srcQ4wSHMxKIrz3yjxjhXhT
        EiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5NLUgtgskycXBKNTBOneL6PoJHbqfD
        Vz2z4KWzq7nmaBXe61WPrdkQY8Xr+Ljv+dvfpumftku1T/LlutbjXdDlJa+8/uuhUkMPm/Vl
        P7lnv7uy1rvdS0CpSDRmU5T2Ppn2XJUlm64elg5/7ap47NDliBm1bmISGmvWTri136rxGLd1
        YryYTexvodPd88UMV91+Z6vEUpyRaKjFXFScCABkdk4H9wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsVy+t/xu7pqwj6xBj+ahC02zljPanH9y3NW
        i/PnN7BbfOy5x2ox4/w+Jou1R+6yW7Q/fcnswO6xaVUnm0ffllWMHp83yQUwR+nZFOWXlqQq
        ZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlvF3EW9CgUtG0/Dpb
        A+MuuS5GTg4JAROJi4u72LsYuTiEBJYySrw7N4cRIiEjcXJaAyuELSzx51oXG0TRJ0aJjy13
        2UASbAKGEl1vu8BsEQEniQfr3oBNYhZ4yihxfUMjWLewQIjE8dc/mEBsFgFViY6lPWA2r4Ct
        xPMrn6A2yEus3nCAeQIjzwJGhlWMIqmlxbnpucWGesWJucWleel6yfm5mxiBAbft2M/NOxgv
        bQw+xCjAwajEw1twwjtWiDWxrLgy9xCjBAezkgjvvTLPWCHelMTKqtSi/Pii0pzU4kOMpkDL
        JzJLiSbnA6MhryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDI+ff
        fWsenuZNOaikVa92bN9uJ5G1HQd9dDczfpDbM8/9zokFfta7fdkMT/SknC8zLLV8+G5Z40nZ
        y72G4dce2/MqpidXv2/V9nz4qtvorGFJDHvJYrncZN6bL7Yv9P778ob279CV94XNlsxsub7A
        +fdSGUWLM/X9fVNeGYss51oi11F7I1HJR4mlOCPRUIu5qDgRADJX/RFOAgAA
X-CMS-MailID: 20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746
References: <CGME20190808121846eucas1p12022cc4a5c23af44e46c459a0c3c5746@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

M2M scaler clocks require special handling of their parent bus clock during
power domain on/off sequences. MSCL clocks were not initially added to the
sub-CMU handler, because that time there was no driver for the M2M scaler
device and it was not possible to test it.

This patch fixes this issue. Parent clock for M2M scaler devices is now
properly preserved during MSC power domain on/off sequence. This gives M2M
scaler devices proper performance: fullHD XRGB32 image 1000 rotations test
takes 3.17s instead of 45.08s.

Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 48 ++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index b52daf5aa755..ec0515d7f627 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -893,9 +893,6 @@ static const struct samsung_div_clock exynos5x_div_clks[] __initconst = {
 	/* GSCL Block */
 	DIV(0, "dout_gscl_blk_333", "aclk333_432_gscl", DIV2_RATIO0, 6, 2),
 
-	/* MSCL Block */
-	DIV(0, "dout_mscl_blk", "aclk400_mscl", DIV2_RATIO0, 28, 2),
-
 	/* PSGEN */
 	DIV(0, "dout_gen_blk", "mout_user_aclk266", DIV2_RATIO0, 8, 1),
 	DIV(0, "dout_jpg_blk", "aclk166", DIV2_RATIO0, 20, 1),
@@ -1159,17 +1156,6 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(CLK_FIMC_LITE3, "fimc_lite3", "aclk333_432_gscl",
 			GATE_IP_GSCL1, 17, 0, 0),
 
-	/* MSCL Block */
-	GATE(CLK_MSCL0, "mscl0", "aclk400_mscl", GATE_IP_MSCL, 0, 0, 0),
-	GATE(CLK_MSCL1, "mscl1", "aclk400_mscl", GATE_IP_MSCL, 1, 0, 0),
-	GATE(CLK_MSCL2, "mscl2", "aclk400_mscl", GATE_IP_MSCL, 2, 0, 0),
-	GATE(CLK_SMMU_MSCL0, "smmu_mscl0", "dout_mscl_blk",
-			GATE_IP_MSCL, 8, 0, 0),
-	GATE(CLK_SMMU_MSCL1, "smmu_mscl1", "dout_mscl_blk",
-			GATE_IP_MSCL, 9, 0, 0),
-	GATE(CLK_SMMU_MSCL2, "smmu_mscl2", "dout_mscl_blk",
-			GATE_IP_MSCL, 10, 0, 0),
-
 	/* ISP */
 	GATE(CLK_SCLK_UART_ISP, "sclk_uart_isp", "dout_uart_isp",
 			GATE_TOP_SCLK_ISP, 0, CLK_SET_RATE_PARENT, 0),
@@ -1278,6 +1264,28 @@ static struct exynos5_subcmu_reg_dump exynos5x_mfc_suspend_regs[] = {
 	{ DIV4_RATIO, 0, 0x3 },			/* DIV dout_mfc_blk */
 };
 
+static const struct samsung_gate_clock exynos5x_mscl_gate_clks[] __initconst = {
+	/* MSCL Block */
+	GATE(CLK_MSCL0, "mscl0", "aclk400_mscl", GATE_IP_MSCL, 0, 0, 0),
+	GATE(CLK_MSCL1, "mscl1", "aclk400_mscl", GATE_IP_MSCL, 1, 0, 0),
+	GATE(CLK_MSCL2, "mscl2", "aclk400_mscl", GATE_IP_MSCL, 2, 0, 0),
+	GATE(CLK_SMMU_MSCL0, "smmu_mscl0", "dout_mscl_blk",
+			GATE_IP_MSCL, 8, 0, 0),
+	GATE(CLK_SMMU_MSCL1, "smmu_mscl1", "dout_mscl_blk",
+			GATE_IP_MSCL, 9, 0, 0),
+	GATE(CLK_SMMU_MSCL2, "smmu_mscl2", "dout_mscl_blk",
+			GATE_IP_MSCL, 10, 0, 0),
+};
+
+static const struct samsung_div_clock exynos5x_mscl_div_clks[] __initconst = {
+	DIV(0, "dout_mscl_blk", "aclk400_mscl", DIV2_RATIO0, 28, 2),
+};
+
+static struct exynos5_subcmu_reg_dump exynos5x_mscl_suspend_regs[] = {
+	{ GATE_IP_MSCL, 0xffffffff, 0xffffffff }, /* MSCL gates */
+	{ SRC_TOP3, 0, BIT(4) },		/* MUX mout_user_aclk400_mscl */
+	{ DIV2_RATIO0, 0, 0x30000000 },		/* DIV dout_mscl_blk */
+};
 
 static const struct samsung_gate_clock exynos5800_mau_gate_clks[] __initconst = {
 	GATE(CLK_MAU_EPLL, "mau_epll", "mout_user_mau_epll",
@@ -1322,6 +1330,16 @@ static const struct exynos5_subcmu_info exynos5x_mfc_subcmu = {
 	.pd_name	= "MFC",
 };
 
+static const struct exynos5_subcmu_info exynos5x_mscl_subcmu = {
+	.div_clks	= exynos5x_mscl_div_clks,
+	.nr_div_clks	= ARRAY_SIZE(exynos5x_mscl_div_clks),
+	.gate_clks	= exynos5x_mscl_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(exynos5x_mscl_gate_clks),
+	.suspend_regs	= exynos5x_mscl_suspend_regs,
+	.nr_suspend_regs = ARRAY_SIZE(exynos5x_mscl_suspend_regs),
+	.pd_name	= "MSC",
+};
+
 static const struct exynos5_subcmu_info exynos5800_mau_subcmu = {
 	.gate_clks	= exynos5800_mau_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(exynos5800_mau_gate_clks),
@@ -1334,12 +1352,14 @@ static const struct exynos5_subcmu_info *exynos5x_subcmus[] = {
 	&exynos5x_disp_subcmu,
 	&exynos5x_gsc_subcmu,
 	&exynos5x_mfc_subcmu,
+	&exynos5x_mscl_subcmu,
 };
 
 static const struct exynos5_subcmu_info *exynos5800_subcmus[] = {
 	&exynos5x_disp_subcmu,
 	&exynos5x_gsc_subcmu,
 	&exynos5x_mfc_subcmu,
+	&exynos5x_mscl_subcmu,
 	&exynos5800_mau_subcmu,
 };
 
-- 
2.17.1

