Return-Path: <SRS0=rhXi=UU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0964CC43613
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jun 2019 14:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB9882083B
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jun 2019 14:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j3o5a9cs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfFUOR3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jun 2019 10:17:29 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42792 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfFUOR3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jun 2019 10:17:29 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190621141727euoutp01ebe3bedae6db1b54d0a1adbf9bc81158~qPGo2eJ2Y0073900739euoutp01i
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2019 14:17:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190621141727euoutp01ebe3bedae6db1b54d0a1adbf9bc81158~qPGo2eJ2Y0073900739euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561126647;
        bh=kXq7bwNudRYNamq52oyDf4PRiEDnKOARNpQai9O0e5M=;
        h=To:Cc:From:Subject:Date:References:From;
        b=j3o5a9csLXwSNlHVES1PFqc8yrfDpe4OB3FDtEBzZcV0bIMLkiw2yj9KVDoWz2Wyh
         sDbJJb12T/tRbWmgOtPI4Z6mcnOaw6GXwuHbhsZcLqsjjQC9wud4bhu+lSOj7Hu47V
         p6ej8xdRzF0nQfUJwkHXiLUTZ2xQW1ekG8P1OWGs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190621141727eucas1p1784be65533b5e25fc7e2b01aae9b6798~qPGocM5FO3134731347eucas1p1Z;
        Fri, 21 Jun 2019 14:17:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F3.21.04325.6F6EC0D5; Fri, 21
        Jun 2019 15:17:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190621141726eucas1p2ed6b0c1468f67ab32bd4b1e67d0b3424~qPGnvZKQc0204802048eucas1p2h;
        Fri, 21 Jun 2019 14:17:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190621141726eusmtrp14ed6990f2f13ed5464ade36357fba0e3~qPGnhVNAM2561525615eusmtrp1K;
        Fri, 21 Jun 2019 14:17:26 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-40-5d0ce6f6995e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.A8.04140.6F6EC0D5; Fri, 21
        Jun 2019 15:17:26 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190621141725eusmtip1b2c2acf774f82efc269cd509e20dc6a3~qPGnJ2UoO2022820228eusmtip1S;
        Fri, 21 Jun 2019 14:17:25 +0000 (GMT)
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 5.3
Message-ID: <dce2e440-130f-3d71-e518-b251cb0cc61e@samsung.com>
Date:   Fri, 21 Jun 2019 16:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7rfnvHEGnxeYWWxccZ6VovrX56z
        WnzsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZa
        pG+XwJXx8Mk6poLb3BXX35g2MF7k7GLk5JAQMJG483oeYxcjF4eQwApGiUcN51hAEkICXxgl
        +tfEQSQ+M0rs+tjIDtPRdrSbCaJoOaPE4sV2EEVvGSWebe0CKxIRCJK407+WDSTBLHCIUWLN
        oqdsIAk2AUOJ3qN9jCC2sIC+xN2tv8FsXgE7iT3ze1hBbBYBVYllHdfBNogKREh82bkJqkZQ
        4uTMJ2DnMQuISzR9WckKYctLbH87hxlkmYRAN7vE16ebgRo4gBwXiTP3KyGuFpZ4dXwL1Acy
        Eqcn97BA1DczSvTsvs0O4UxglLh/fAEjRJW1xOHjF1lBBjELaEqs36UPEXaUePp6ByvEfD6J
        G28FIW7gk5i0bTozRJhXoqNNCKJaReL3qulMELaURPeT/ywQJR4Sb+eYT2BUnIXksVlIHpuF
        5LFZCCcsYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZhoTv87/nUH474/SYcYBTgY
        lXh4D8zijhViTSwrrswFRgQHs5IIL08OT6wQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FC
        AumJJanZqakFqUUwWSYOTqkGxukr8mzYQyvE9WNrl6zwOfIs6tynGWL/L3dFmKW1vLBYbHzN
        qSX0qUdYbG+SyOLj1a5vL+m5KfgLc9pJH2HkuvT++N9vLFZ2j/7IKHH9alu9tHGj/cVfkgo3
        H6uF2OV+zH/QfP99nr72gt/LuP8Jp/Y6buaM+PzC6eVx8a+pIv3P0rw3yDl8UGIpzkg01GIu
        Kk4EAHewxSQwAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7rfnvHEGnyfyWOxccZ6VovrX56z
        WnzsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASpWdTlF9akqqQ
        kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfx8Mk6poLb3BXX35g2
        MF7k7GLk5JAQMJFoO9rN1MXIxSEksJRR4syHZaxdjBxACSmJ+S1KEDXCEn+udbFB1LxmlNj9
        p50FJCEiECTxa889VpAEs8AhRon/O14wgyTYBAwleo/2MYLYwgL6Ene3/gazeQXsJPbM72EF
        sVkEVCWWdVxnArFFBSIkZu9qYIGoEZQ4OfMJmM0soC7xZ94lZghbXKLpy0pWCFteYvvbOcwT
        GAVmIWmZhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMlm3Hfm7Zwdj1
        LvgQowAHoxIP74FZ3LFCrIllxZW5QA9yMCuJ8PLk8MQK8aYkVlalFuXHF5XmpBYfYjQFemgi
        s5Rocj4wkvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDmO/tP
        /B04Z9Pmrhkp/8ry7XuSP7sJCDqaKLwN13aa+OTL+dRezfnNgWpn6iJ/J3n8uxPv75Kyx3Hm
        8TOaX5o83zxvEchY3TjldatNn/uzaQderO7VP8KaWFcVsmv5uuQoxT6ZH07C76X7uvycPhcm
        7YrNPfPyvvZKr1q5hHMCKzrrRTknGCuxFGckGmoxFxUnAgBpW2WkrAIAAA==
X-CMS-MailID: 20190621141726eucas1p2ed6b0c1468f67ab32bd4b1e67d0b3424
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190621141726eucas1p2ed6b0c1468f67ab32bd4b1e67d0b3424
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190621141726eucas1p2ed6b0c1468f67ab32bd4b1e67d0b3424
References: <CGME20190621141726eucas1p2ed6b0c1468f67ab32bd4b1e67d0b3424@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen, Mike,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.3-samsung

for you to fetch changes up to 7ef91224c4864202958b018cd5612db5cc9dc67d:

  clk: samsung: Add bus clock for GPU/G3D on Exynos4412 (2019-06-19 10:50:51 +0200)

----------------------------------------------------------------
clk/samsung updates for 5.3

Addition of clocks required for new Exynos5422 Dynamic Memory
Controller driver, clock definition for Exynos4412 Mali, minor
clean up of clk-exynos5433.c.

----------------------------------------------------------------
Kefeng Wang (1):
      clk: samsung: exynos5433: Use of_clk_get_parent_count()

Krzysztof Kozlowski (1):
      clk: samsung: Add bus clock for GPU/G3D on Exynos4412

Lukasz Luba (3):
      clk: samsung: add needed IDs for DMC clocks in Exynos5420
      clk: samsung: add BPLL rate table for Exynos 5422 SoC
      clk: samsung: add new clocks for DMC for Exynos5422 SoC

 drivers/clk/samsung/clk-exynos4.c      |  1 +
 drivers/clk/samsung/clk-exynos5420.c   | 78 +++++++++++++++++++++++++---
 drivers/clk/samsung/clk-exynos5433.c   |  4 +-
 include/dt-bindings/clock/exynos4.h    |  1 +
 include/dt-bindings/clock/exynos5420.h | 18 ++++++-
 5 files changed, 92 insertions(+), 10 deletions(-)


Thanks
Sylwester
