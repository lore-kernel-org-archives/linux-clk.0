Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE3BC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85D5E2082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C3dDy29a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85D5E2082B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbeLDQxz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 11:53:55 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53911 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbeLDQxT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 11:53:19 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181204165318euoutp01f365c218bdd6b87583efc6bc3f9e6961~tL25QsdI70146001460euoutp01W
        for <linux-clk@vger.kernel.org>; Tue,  4 Dec 2018 16:53:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181204165318euoutp01f365c218bdd6b87583efc6bc3f9e6961~tL25QsdI70146001460euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543942398;
        bh=dvP3hUzVqbUBTd3iZLpPK93lg0N/eXVHBgP+oHshlpI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=C3dDy29aMMnPjiZRqJC6W0SPE8qjeLnYPbFlDOtFXM1qZJEjWo/L/EiAyElbdWLX4
         X6X2vx4jdIFffEPwkksFqW3Y1/K1WdFT9O1J1ReDxF5GuNcui47bigSY/WAnXcNvA0
         2pU4RczUY6hijBJBvb1E526KD7+zu+ukQ8g78Q+E=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181204165316eucas1p1add5c2e268780bbddf2dd98770129612~tL2366oca1598415984eucas1p1i;
        Tue,  4 Dec 2018 16:53:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 82.57.04441.CF0B60C5; Tue,  4
        Dec 2018 16:53:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165315eucas1p1693a3d349f39c272297e5d1902c905ca~tL23AYDCV0387303873eucas1p1B;
        Tue,  4 Dec 2018 16:53:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181204165315eusmtrp1009cc98dd7a986a9cf87e27905870fad~tL22j_y5H1368313683eusmtrp1k;
        Tue,  4 Dec 2018 16:53:15 +0000 (GMT)
X-AuditID: cbfec7f2-5c9ff70000001159-6b-5c06b0fc372b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 42.48.04284.BF0B60C5; Tue,  4
        Dec 2018 16:53:15 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20181204165314eusmtip112e139d450887040f612688c1e49721e~tL21-NCN72005320053eusmtip17;
        Tue,  4 Dec 2018 16:53:14 +0000 (GMT)
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
Subject: [PATCH v3 0/5] Add imem clock for Exynos 5433
Date:   Tue,  4 Dec 2018 17:52:43 +0100
Message-Id: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7p/NrDFGFz6KmaxccZ6VovrX56z
        Wsw/co7Vom/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd1
        4PFYM28No8emVZ1sHgff7WHy6NuyitHj8ya5ANYoLpuU1JzMstQifbsEroxNa1YwFyzkqmg4
        sYm1gXEmRxcjJ4eEgInEkyV72bsYuTiEBFYwSpx6sosNwvnCKPF82w9mCOczo8TcO4dZYFq+
        dk9jgUgsZ5Q43bOBHSQB1vJrhhiIzSZgLvFo+xkmEFtEwE2ib/JssLHMAm3MEk9nd4ElhAXM
        JO68/8MIYrMIqEq0/lsGFucVcJF43NjODLFNXqJh12Z2iLigxMmZT8CuYAaKN2+dDXaehMB0
        domuGTegznORaGyfBmULS7w6voUdwpaROD25BypeLrF76zN2iOYWoN8mL2KCSFhLHD5+kbWL
        kQNog6bE+l36EGFHiZ0fdzGBhCUE+CRuvBWEuIFPYtK26cwQYV6JjjYhiGpdiXn/z7BC2NIS
        Xf/XQdkeEgu3/2WGhFWsxNKFfcwTGBVmIflsFpLPZiHcsICReRWjeGppcW56arFhXmq5XnFi
        bnFpXrpecn7uJkZgejr97/inHYxfLyUdYhTgYFTi4ZWYwhYjxJpYVlyZe4hRgoNZSYT3jhpQ
        iDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA6NUynm1rutz
        rh6qyTswVZbT9M1d44dneVfnFna+YrCzij33+lHN1yPla66c2lCj/1Rv29TKrfcDpJb8uTNl
        psv3QnXhqDM5nnuP/Vyy6pqLzfJMkXqGHxX3qu9UbvZvuzRl+/87N99fyn+ycOGzrU/nTwsO
        742c+k9XxrDEIkjJf2XNr/lyfIf3KrEUZyQaajEXFScCALp0R1pLAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4Xd3fG9hiDGZ+ZrfYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8HismbeG0WPTqk42j4Pv9jB59G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsamNSuYCxZyVTSc2MTawDiTo4uRk0NCwETia/c0
        li5GLg4hgaWMEtOWfGOFSEhLNJ5ezQRhC0v8udbFBlH0iVFiwslWdpAEm4C5xKPtZ8CKRAQ8
        JGZMXMwKUsQs0Mcs8fngebAiYQEziTvv/zCC2CwCqhKt/5aBNfAKuEg8bmxnhtggL9GwazM7
        RFxQ4uTMJywgNjNQvHnrbOYJjHyzkKRmIUktYGRaxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJ
        ERgZ24793LyD8dLG4EOMAhyMSjy8klPYYoRYE8uKK3MPMUpwMCuJ8N5RAwrxpiRWVqUW5ccX
        leakFh9iNAU6diKzlGhyPjBq80riDU0NzS0sDc2NzY3NLJTEec8bVEYJCaQnlqRmp6YWpBbB
        9DFxcEo1MBZfZ45UD/RgPXe1TjZBY7q06ueTexIY3q/bLcYYd+dOONvnXN/cyGcl1ZYuaXlm
        CqfnuXtfu1FS6mbe87tKbk18qPEUngdeXDUcrZcfF/fahYqvDl2ToehWKx0vZLjJRUX8/fdv
        G9+pq4jtEDVQi3e23s/lW/JpHf+kecVdSesctkw9d+CuEktxRqKhFnNRcSIADxVSM6ICAAA=
X-CMS-MailID: 20181204165315eucas1p1693a3d349f39c272297e5d1902c905ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181204165315eucas1p1693a3d349f39c272297e5d1902c905ca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181204165315eucas1p1693a3d349f39c272297e5d1902c905ca
References: <CGME20181204165315eucas1p1693a3d349f39c272297e5d1902c905ca@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imem clock for Exynos 5433. This will allow to use SSS and SlimSSS
(Security SubSystem) with crypto functions.

Changes since v2:
- added Reviewed-by to two first patches
- fixed subject for 3rd patch and commit message
- in patch 3 moved documentation of imem to end of clocks after CMU_CAM1
- in patch 4 moved cmu_imem declarations after cmu_cam1
- in patch 5 added newlines after clock registers, moved code after cmu_cam1,
  removed CLK_OF_DECLARE and exynos5433_cmu_imem_init, moved cmu_imem
  compatible to the end of exynos5433_cmu_of_match

Changes since v1:
- splitted typo patch into two, one of them for stable, suggested by Krzystof
  Kozlowski
- added more registers as suggested by Chanwoo Choi

Kamil Konieczny (5):
  clk: samsung: exynos5433: fix typo in imem divider
  clk: samsung: exynos5433: fix name typo in sssx
  dt-bindings: clk: exynos5433: document imem clock
  arm64: dts: exynos: add imem clock
  clk: samsung: exynos5433: add imem clocks

 .../bindings/clock/exynos5433-clock.txt       |  23 ++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  15 ++
 drivers/clk/samsung/clk-exynos5433.c          | 199 +++++++++++++++++-
 include/dt-bindings/clock/exynos5433.h        |  57 ++++-
 4 files changed, 290 insertions(+), 4 deletions(-)

-- 
2.19.1

