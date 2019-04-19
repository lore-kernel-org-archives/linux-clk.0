Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2611C282E0
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 19:22:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E7AF20821
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 19:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s5VSiigO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfDSTW5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:22:57 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55882 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfDSTWw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Apr 2019 15:22:52 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190419095541euoutp02722360bdd094b510f0d617ae6bdf81b0~W15GgTT9T2699426994euoutp02Y
        for <linux-clk@vger.kernel.org>; Fri, 19 Apr 2019 09:55:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190419095541euoutp02722360bdd094b510f0d617ae6bdf81b0~W15GgTT9T2699426994euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1555667741;
        bh=WzCmck4l1r9bpsIKpbdBSePGNz5XUpJlRMzWZpV+qfU=;
        h=To:Cc:From:Subject:Date:References:From;
        b=s5VSiigOQIhhpQY7zOP81PMKBwzJ2VjpgRVZ/KgD3KDdlY/0pGoQZDjEz1ARRURR/
         0EOqByq7ItDGm7rRspyMoMkt3vYAc4WrdUd4+9281gUzqCPpU9vmqFviv0q3vglgHz
         nhZhoTY+lVMUAYpk/LekglQLvSDrR6koqNEj/iNM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190419095541eucas1p18d686b796a2bcdc5abf8c9d40691faa3~W15F7Xakx1395913959eucas1p1U;
        Fri, 19 Apr 2019 09:55:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 91.41.04325.C1B99BC5; Fri, 19
        Apr 2019 10:55:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190419095540eucas1p2cb1615ec28faa8aa58065f684677bd9b~W15FIl_3J1178211782eucas1p2-;
        Fri, 19 Apr 2019 09:55:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190419095540eusmtrp1344502db58984e42f1b6c38d809cf27b~W15E6n1ZA2869928699eusmtrp1D;
        Fri, 19 Apr 2019 09:55:40 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-6f-5cb99b1ce241
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 89.11.04146.B1B99BC5; Fri, 19
        Apr 2019 10:55:40 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190419095539eusmtip1f16285f2cfc8d639514b0cc5fc7830ad~W15EmmCpB1852518525eusmtip1Y;
        Fri, 19 Apr 2019 09:55:39 +0000 (GMT)
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 5.2
Message-ID: <0e9089fc-7497-ae52-a27f-515d2f9a0ecb@samsung.com>
Date:   Fri, 19 Apr 2019 11:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djP87oys3fGGBzdaWaxccZ6VovrX56z
        WnzsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZa
        pG+XwJVx5p5ywTyOigd/PrI3ML5l62Lk5JAQMJGYfeQ+C4gtJLCCUeL87LIuRi4g+wujxKLH
        j6ASnxklnndJdjFygDUsbDGHqFnOKLHg7Hl2COcto8S+fW2MIA0iAkESd/rXsoEkmAXWMEo0
        T7nMCpJgEzCU6D3aB1YkLKAvMWF5H9gZvAJ2Ej/WPmEE2cAioCox66oHSFhUIELi/rENrBAl
        ghInZz4BO4hZQFyi6ctKVghbXmL72znMILskBNrZJR49bWeGeM1FYsPaTnYIW1ji1fEtULaM
        xOnJPSwQDc2MEj27b7NDOBMYJe4fX8AIUWUtcfj4RVaQi5gFNCXW79KHCDtKXDl3lg0SFHwS
        N94KQhzBJzFp23RmiDCvREebEES1isTvVdOZIGwpie4n/1kgbA+JxQeb2CYwKs5C8tosJK/N
        QvLaLIQbFjCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMNKf/Hf+6g3Hfn6RDjAIc
        jEo8vAcm7YwRYk0sK67MPcQowcGsJMLrmLIlRog3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcOD
        aCGB9MSS1OzU1ILUIpgsEwenVAPj3FyZVUumffpj9dlb+ZzPnD2b7/HoB91/cWxqII9SUPQ0
        7vDJf2M7Fycsu7VhCsPRyDTlAmd7V8OM48yBS1edvLqgzj+f50PdX756lYoOtbnHzoac/SC/
        lkVXbo9i/1bx7/z/lhf0rzp/8rmpQtkJ7xTTBzyLJrTxnrzwoa1l9ikFFl/ThD4mJZbijERD
        Leai4kQALfOVlzADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsVy+t/xu7oys3fGGEz3tNg4Yz2rxfUvz1kt
        PvbcY7WYcX4fk8XFU64W/65tZHFg83h/o5XdY9OqTjaPvi2rGD0+b5ILYInSsynKLy1JVcjI
        Ly6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQyzhzT7lgHkfFgz8f2RsY
        37J1MXJwSAiYSCxsMe9i5OQQEljKKHF8eh5EWEpifosSSFhCQFjiz7UuoGouoJLXjBJvDlxn
        BUmICARJ/NpzjxUkwSywjlFi/ua9jCAJNgFDid6jfWC2sIC+xITlfWwgNq+AncSPtU8YQRaw
        CKhKzLrqARIWFYiQOPN+BQtEiaDEyZlPwGxmAXWJP/MuMUPY4hJNX1ayQtjyEtvfzmGewCgw
        C0nLLCQts5C0zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZglGw79nPzDsZLG4MP
        MQpwMCrx8B6YtDNGiDWxrLgy9xCjBAezkgivY8qWGCHelMTKqtSi/Pii0pzU4kOMpkD/TGSW
        Ek3OB0ZwXkm8oamhuYWlobmxubGZhZI473mDyighgfTEktTs1NSC1CKYPiYOTqkGxukaKwva
        wlvsfulJTeb/3HhbLTFYL2urWC6XyzyB6gsBMjKPlx5/s1Rzx4oVR39ycWgFW3Z/2qfwYrrL
        qlkX58SuPPmhVPrq1N0BUXJh6/y+5b+bovv2U1z7q4XcrafWhi3iW/XOP607PsMxmmuHR/6N
        zk7/h12ZXKpHg268bl7AvGNr1EPPWCWW4oxEQy3mouJEALVCgwqoAgAA
X-CMS-MailID: 20190419095540eucas1p2cb1615ec28faa8aa58065f684677bd9b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190419095540eucas1p2cb1615ec28faa8aa58065f684677bd9b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190419095540eucas1p2cb1615ec28faa8aa58065f684677bd9b
References: <CGME20190419095540eucas1p2cb1615ec28faa8aa58065f684677bd9b@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen, Mike,

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.2-samsung

for you to fetch changes up to 691dc382769e350d4bc6f90a8edcacf7f8863d70:

  clk: samsung: exynos5410: Add gate clock for ADC (2019-03-22 12:41:57 +0100)

----------------------------------------------------------------
clk/samsung updates for 5.2

Addition of ADC clock definition for Exynos 5410 SoC (Odroid XU).

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      clk: samsung: dt-bindings: Put CLK_UART3 in order
      clk: samsung: dt-bindings: Add ADC clock ID to Exynos5410
      clk: samsung: exynos5410: Add gate clock for ADC

 drivers/clk/samsung/clk-exynos5410.c   | 1 +
 include/dt-bindings/clock/exynos5410.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
Regards,
Sylwester
