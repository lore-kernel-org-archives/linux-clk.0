Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360A6C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED81E20870
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DV6X7rAG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfAVJCx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:02:53 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46969 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfAVJCw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 04:02:52 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190122090251euoutp01d96e4eb0726d00c9097b7bbe2d4477a1~8IDIL2aHA2247922479euoutp01F
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 09:02:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190122090251euoutp01d96e4eb0726d00c9097b7bbe2d4477a1~8IDIL2aHA2247922479euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548147771;
        bh=EcRhICI7w1y0026JffovH1g1h9IvNeuUkqkLvBr1kKY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=DV6X7rAG2fbE5IuAYH2xkjNG+9Phcn3g+5peGr2cSWzASTM0CWRjF4FInkoMRuB+w
         C+FaFO0XiL7nXXfSURWTfKLuYiJER4Jks2D+AfHGOY/8r1VdYEgOlNPCh03/nvLpyN
         GdQaMyDVLt0zWHK35V/ISsZS8Kw/2RR+xX5pcuqw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190122090250eucas1p2fd1339fbd94abb6b87a63d90910eb057~8IDHZex2w2900229002eucas1p2d;
        Tue, 22 Jan 2019 09:02:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 33.86.04806.A3CD64C5; Tue, 22
        Jan 2019 09:02:50 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500~8IDGZ8tqj0659606596eucas1p1H;
        Tue, 22 Jan 2019 09:02:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190122090249eusmtrp2c2957c82ac608f529eaaa09507dce27c~8IDGK08z92915029150eusmtrp2i;
        Tue, 22 Jan 2019 09:02:49 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-05-5c46dc3ab8cd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4C.F8.04128.83CD64C5; Tue, 22
        Jan 2019 09:02:48 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190122090248eusmtip1d13db4a5423077bbd28d0c5c1c659d90~8IDFmVWle2863028630eusmtip1x;
        Tue, 22 Jan 2019 09:02:48 +0000 (GMT)
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
Subject: [PATCH v5 0/5] Add imem clock for Exynos 5433
Date:   Tue, 22 Jan 2019 10:02:27 +0100
Message-Id: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87pWd9xiDPr62Cw2zljPanH9y3NW
        i/lHzrFa9O37z2jR//g1s8X58xvYLT723GO1mHF+H5PF2iN32S2WXr/IZNG69wi7xeE37awO
        PB5r5q1h9Ni0qpPN4+C7PUwefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlbGx9T5bwSG+iteH
        DzI1MJ7h7mLk5JAQMJE4OuM7cxcjF4eQwApGiZsb17BAOF8YJU7NeQOV+cwosWztcfYuRg6w
        lp676hDx5YwSry7uZYfrOHZyBRPIXDYBc4lH28+A2SICbhJ9k2ezgRQxC7QxSzyd3QWWEBYw
        k9i2dCuYzSKgKrH58D2wDbwCLhKPNvhD3CcvMW01RDmvgKDEyZlPWEBsZqB489bZYNdJCMxj
        lzh64DQTRIOLRNuClcwQtrDEq+Nb2CFsGYn/O+dD1ZRL7N76jB2iuYVRYu7kRVAJa4nDxy+y
        ghzBLKApsX6XPkTYUWL+jiVsEN/zSdx4KwhxA5/EpG3TmSHCvBIdbUIQ1boS8/6fYYWwpSW6
        /q+Dsj0kDh7ZxwZiCwnESrxrvMA8gVFhFpLPZiH5bBbCDQsYmVcxiqeWFuempxYb56WW6xUn
        5haX5qXrJefnbmIEJqfT/45/3cG470/SIUYBDkYlHl6Oc64xQqyJZcWVuYcYJTiYlUR4XS+6
        xQjxpiRWVqUW5ccXleakFh9ilOZgURLnrWZ4EC0kkJ5YkpqdmlqQWgSTZeLglGpg3LTq+oSP
        3ZrVEVsNBB45vQl2K78UaWGz/s63W8r75qz1iOx5cf3iukqOv0lJ7AZTQg3narbw/wt8XnlI
        NT/lIcO7joXGE12e6Sqze4urOMySyTqrKPtD/2mye9vJc/U8IdL93tKFipVVE1eJhHxp1br5
        ZefypPdBL1On2jeLpsYvM4zbXfRNiaU4I9FQi7moOBEAMy9bZ0oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e/4XV2LO24xBtPX2VhsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
        xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2Nj6322gkN8Fa8PH2RqYDzD3cXIwSEhYCLRc1e9
        i5GLQ0hgKaPE0fXNTF2MnEBxaYnG06uhbGGJP9e62CCKPjFKfFz2iAUkwSZgLvFo+xmwIhEB
        D4kZExezghQxC/QxS3w+eJ4dJCEsYCaxbelWsCIWAVWJzYfvsYNs5hVwkXi0wR9igbzEtNVd
        YCW8AoISJ2c+AZvPDBRv3jqbeQIj3ywkqVlIUgsYmVYxiqSWFuem5xYb6RUn5haX5qXrJefn
        bmIERsW2Yz+37GDsehd8iFGAg1GJhzfhgmuMEGtiWXFl7iFGCQ5mJRFe14tuMUK8KYmVValF
        +fFFpTmpxYcYTYFuncgsJZqcD4zYvJJ4Q1NDcwtLQ3Njc2MzCyVx3vMGlVFCAumJJanZqakF
        qUUwfUwcnFINjMrH0pimvud8tDR6JvvsxnJBvj1ljWKXJsYnh/85yPa163HuFt24s+dmMU19
        mf9UekGL2MFvH4PSaiqMXjR77tSxPhD14FvAlJx4TrFXcdu3Tb0odKTsVjhz31Zem1Mrpvo9
        NMve+EZ6t/wuIed7KQ3OuqH5TiZbYpt6VxWdCbl0d0/Za6Z6FyWW4oxEQy3mouJEADG1AeGg
        AgAA
X-CMS-MailID: 20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500
References: <CGME20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imem clock for Exynos 5433. This will allow to use SlimSSS (Slim
Security SubSystem) with crypto functions.

Changes since v4:
- added Acked-by to 5th patch,
- removed all clock ids except CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS and rewrite
  commit message.

Changes since v3:
- added Acked-by and Reviewed-by to patches 2 and 3
- dropped "[PATCH v3 4/5] arm64: dts: exynos: add imem clock" because it
  was already applied
- split "[PATCH v3 5/5] clk: samsung: exynos5433: add imem clocks"
  into two parts, first for DT bindings and second for clock driver. In
  clock driver I dropped all SSS clocks and left only two slimSSS, as I
  was unable to test SSS with crypto driver s5p-sss.

Changes since v2:
- added Reviewed-by to two first patches
- fixed subject for 3rd patch and commit message
- in patch 3 moved documentation of imem to end of clocks after CMU_CAM1
- in patch 4 moved cmu_imem declarations after cmu_cam1
- in patch 5 added newlines after clock registers, moved code after cmu_cam1,
  removed CLK_OF_DECLARE and exynos5433_cmu_imem_init, moved cmu_imem
  compatible to the end of exynos5433_cmu_of_match

Changes since v1:
- splitted typo patch into two, one of them for stable, suggested by Krzysztof
  Kozlowski
- added more registers as suggested by Chanwoo Choi

Kamil Konieczny (5):
  clk: samsung: exynos5433: fix typo in imem divider
  clk: samsung: exynos5433: fix name typo in sssx
  dt-bindings: clk: exynos5433: document imem clock
  dt-bindings: clk: exynos5433: add imem clock
  clk: samsung: exynos5433: add imem clocks

 .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++
 drivers/clk/samsung/clk-exynos5433.c          | 38 +++++++++++++++++--
 include/dt-bindings/clock/exynos5433.h        |  8 +++-
 3 files changed, 65 insertions(+), 4 deletions(-)

-- 
2.20.0

