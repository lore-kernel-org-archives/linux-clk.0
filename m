Return-Path: <SRS0=hvdj=P2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C11C43387
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5152F208E4
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 13:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mJkYQSN3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfARNRP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jan 2019 08:17:15 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60147 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfARNRO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jan 2019 08:17:14 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190118131712euoutp019ab07ea0be8d340530b26162e7f93479~688EMHEOb1775617756euoutp01J
        for <linux-clk@vger.kernel.org>; Fri, 18 Jan 2019 13:17:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190118131712euoutp019ab07ea0be8d340530b26162e7f93479~688EMHEOb1775617756euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1547817432;
        bh=HxNjjUH0dy5OUDmDqQnZovTMvUqO83p0U2Td8KAVE70=;
        h=From:To:Cc:Subject:Date:References:From;
        b=mJkYQSN3BDOBJn2dThGf9WAiOTx1hlUVtO524XD5C0OWakl7QELjGEMhiJ5hxogG4
         pgDYbLRyFhMjIK6BGe2XTUNBrhbOGva6ytm9mtM3l8ISCdfyFe/p+WbB1hT4QT81Tl
         ConZjZWQjvYyym0pm0/BqYX7Y2ojW9raXvtQHGNQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190118131711eucas1p29fcf06afaedd974209f3775dac3ab214~688DY85h81558215582eucas1p2V;
        Fri, 18 Jan 2019 13:17:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id BE.B0.04441.7D1D14C5; Fri, 18
        Jan 2019 13:17:11 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190118131710eucas1p1b4d7f67c5aa2832b669b1f3cff0235aa~688CsZTPt1004810048eucas1p1B;
        Fri, 18 Jan 2019 13:17:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190118131710eusmtrp1aeb1fa4cf217b1b12ab77b158ebdf72b~688CdP8Fs1588415884eusmtrp1G;
        Fri, 18 Jan 2019 13:17:10 +0000 (GMT)
X-AuditID: cbfec7f2-5e3ff70000001159-1e-5c41d1d74da1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DA.0F.04284.6D1D14C5; Fri, 18
        Jan 2019 13:17:10 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190118131709eusmtip155f7ebe171d5903c44e0422ef9468923~688B6iyNZ2065420654eusmtip1O;
        Fri, 18 Jan 2019 13:17:09 +0000 (GMT)
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
Subject: [PATCH v4 0/5] Add imem clock for Exynos 5433
Date:   Fri, 18 Jan 2019 14:16:34 +0100
Message-Id: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7rXLzrGGHzcJWSxccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoLpuU1JzMstQifbsEroxv550LNvNWLHv8
        kqmB8RZXFyMHh4SAiURvW1YXIxeHkMAKRok/T5ayQDhfGCX+LpvHCuF8ZpSY/+YrkMMJ1nHr
        /ix2iMRyRomnjY1scC3HP81hB6liEzCXeLT9DBOILSLgJtE3eTZYEbNAG7PE09ldYAlhATOJ
        a4/WgjWwCKhK7Nn+khHE5hVwkdh86yEbxDp5iWmrIep5BQQlTs58wgJiMwPFm7fOZgYZKiEw
        nV1i7uvzjBAfuUgsmeUM0Sss8er4FnYIW0bi9OQeFgi7XGL31mfsEL0tjBJzJy9igkhYSxw+
        fpEVZA6zgKbE+l36EGFHiT+3r7JDjOeTuPFWEOIEPolJ26YzQ4R5JTrahCCqdSXm/T8DDSxp
        ia7/66BsD4mzH3aD2UICsRJbfx1mmsCoMAvJY7OQPDYL4YYFjMyrGMVTS4tz01OLDfNSy/WK
        E3OLS/PS9ZLzczcxAlPT6X/HP+1g/Hop6RCjAAejEg/vi20OMUKsiWXFlbmHGCU4mJVEeLlW
        OMYI8aYkVlalFuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYOQu4Wz7
        wxzb6bDugMOdgIAVEr8MvKzP3VLnirqRZh31QaGkg7PofZ7Wj9yf2xw3+34L3B//6tOfFY4H
        Lz+2aZuh2xfw9dSpG4tyjyhuu2s+15f7WYhJ8JQjZzMidY40l71edHfSoXdhhdzvLylpFv5J
        nhb1cZ2I3/WKwiOLFA2kp5uteOrbd1SJpTgj0VCLuag4EQDAd/7cSQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e/4Xd1rFx1jDNafk7fYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8HismbeG0WPTqk42j4Pv9jB59G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsa3884Fm3krlj1+ydTAeIuri5GTQ0LAROLW/Vns
        ILaQwFJGibvbxSHi0hKNp1czQdjCEn+udbF1MXIB1XxilLjT9p4NJMEmYC7xaPsZsCIRAQ+J
        GRMXs4IUMQv0MUt8PngebKqwgJnEtUdrwWwWAVWJPdtfMoLYvAIuEptvPWSD2CAvMW11FxNE
        XFDi5MwnLCA2M1C8eets5gmMfLOQpGYhSS1gZFrFKJJaWpybnltsqFecmFtcmpeul5yfu4kR
        GBXbjv3cvIPx0sbgQ4wCHIxKPLwvtjnECLEmlhVX5h5ilOBgVhLh5VrhGCPEm5JYWZValB9f
        VJqTWnyI0RTo2InMUqLJ+cCIzSuJNzQ1NLewNDQ3Njc2s1AS5z1vUBklJJCeWJKanZpakFoE
        08fEwSnVwNj5JYZj6a7D5udvqy43MmRhlb+mFb/fjL0ibm/VoYLjtV6nH7294calvGKN5KS5
        b08UGU95ZOetpHEqJUHm81Zu7vJfymlZTNlnmG+v3bEnWSSty1vFUSlDqtmsWqA382XEBM00
        xd9tp1WlGfhkHTLWf/GwcO9iXJskeTvS89PMRKVzQpuOK7EUZyQaajEXFScCAFoXAS6gAgAA
X-CMS-MailID: 20190118131710eucas1p1b4d7f67c5aa2832b669b1f3cff0235aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190118131710eucas1p1b4d7f67c5aa2832b669b1f3cff0235aa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190118131710eucas1p1b4d7f67c5aa2832b669b1f3cff0235aa
References: <CGME20190118131710eucas1p1b4d7f67c5aa2832b669b1f3cff0235aa@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imem clock for Exynos 5433. This will allow to use SlimSSS (Slim
Security SubSystem) with crypto functions.

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

 .../bindings/clock/exynos5433-clock.txt       | 23 ++++++++
 drivers/clk/samsung/clk-exynos5433.c          | 38 ++++++++++++-
 include/dt-bindings/clock/exynos5433.h        | 57 ++++++++++++++++++-
 3 files changed, 114 insertions(+), 4 deletions(-)

-- 
2.20.0

