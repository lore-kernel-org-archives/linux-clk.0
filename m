Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0AAC282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 11:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22ADB207E0
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 11:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="G37rBXGY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfBELSx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 06:18:53 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:56508 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbfBELSx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 06:18:53 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20190205111851epoutp0149a4413bbaa8ab2e2542ba15df8f427a~Ac73XhQZp1094510945epoutp01H;
        Tue,  5 Feb 2019 11:18:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20190205111851epoutp0149a4413bbaa8ab2e2542ba15df8f427a~Ac73XhQZp1094510945epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1549365531;
        bh=IjPnEV2G3shoExWrS67epO84lD3+Rn//t7WEvoXafMs=;
        h=To:Cc:From:Subject:Date:References:From;
        b=G37rBXGYaLXj9Hx2U2dSCDVY5J8aALS/Z2++W3uX6wsmDY40zoy7eCmFN1EAWi6jd
         zYgLpbJo44GunGesJMO3Kl0E4z8b91g6ar+2I9HXTBm81soz0qOQrID+MXeMvz+8/B
         /N62yu0XVhLatIcEE0JN5qkTGUbOURR2mSESS3Jg=
Received: from epsmges2p4.samsung.com (unknown [182.195.42.72]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20190205111849epcas2p3bdd9cb3b6abaeae93513a73806b82fdf~Ac72STvwd1185211852epcas2p3K;
        Tue,  5 Feb 2019 11:18:49 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        F3.BB.04093.911795C5; Tue,  5 Feb 2019 20:18:49 +0900 (KST)
Received: from epsmgms2p2new.samsung.com (unknown [182.195.42.143]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20190205111849epcas2p4346fb8152fcbbbe799f4bc44b3eb39f7~Ac72I2FDA0812308123epcas2p4n;
        Tue,  5 Feb 2019 11:18:49 +0000 (GMT)
X-AuditID: b6c32a48-173ff70000000ffd-76-5c597119a74c
Received: from epmmp1.local.host ( [203.254.227.16]) by
        epsmgms2p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        08.D4.03689.911795C5; Tue,  5 Feb 2019 20:18:49 +0900 (KST)
Received: from [106.116.147.40] by mmp1.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PMG00GJDA3A6T70@mmp1.samsung.com>; Tue, 05 Feb 2019 20:18:49 +0900 (KST)
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 5.1
Message-id: <a6278eec-efec-7c70-42df-9adf1ef1c63b@samsung.com>
Date:   Tue, 05 Feb 2019 12:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.4.0
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsWy7bCmma5kYWSMwdcGY4uNM9azWlz/8pzV
        4mPPPVaLi6dcLf5d28jiwOrx/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZapG+XwJXx
        9eMU5oKvXBUnv4U1MP7i6GLk4JAQMJHYNN+pi5GLQ0hgB6PE7G37mCCc74wSndf7mLsYOcGK
        Hv99zgaR2M0oMevNMhYI5z6jxOHj71hAqkQEgiTu9K8Fq2IW6GSUeLF6ChtIgk3AUKL3aB8j
        iC0soC9xb+MndhCbV8BO4sDZC0wgNouAqkT3jrNg60QFIiQO975jhKgRlPgx+R7YAmYBTYkX
        XyZB2eISx+7fZISw5SU2r3kLdeoCNonmVckQv7lIdBzNgQhLSzxbtZERwq6W2LW9mxnkTgmB
        DkaJlgvboXqtgZ65yAoxk0+i4/Bfdog5vBIdbUIQJR4Sr3YcASsREoiV2LN/EfsERulZSC6d
        heTSWUgunYXk0gWMLKsYxVILinPTU4uNCkz0ihNzi0vz0vWS83M3MYIjXctjB+OBcz6HGAU4
        GJV4eH+YRMQIsSaWFVfmHmKU4GBWEuE95RsZI8SbklhZlVqUH19UmpNafIhRmoNFSZz3ofTc
        aCGB9MSS1OzU1ILUIpgsEwenVAMjW3v7skDu5+q3966Y0+TyTtN9/0ct18uNbkcUWJZsN3A9
        viA+RK/b6EqO/FmGVjbHkzfnHlfOf2HsoR6m4pf6/YrPRAv3vNXLtS1zTpVPZas1u1gpKK9Z
        WdmktHGuU7L1u8nzj/5ue1s8L8LO4pRWz16zOfeVy6Nfxnz1nVh+4egj/Yi1ES+VWIozEg21
        mIuKEwFy21l28AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsVy+t9jAV3JwsgYg89TNSw2zljPanH9y3NW
        i48991gtLp5ytfh3bSOLA6vH+xut7B6bVnWyefRtWcXo8XmTXABLFJdNSmpOZllqkb5dAlfG
        149TmAu+clWc/BbWwPiLo4uRk0NCwETi8d/nbCC2kMBORomdXSZdjFxA9kNGiTP/+plAEiIC
        ARIvp61lB0kwC3QySuxu+csIkmATMJToPdoHZgsL6Evc2/iJHcTmFbCTOHD2Algzi4CqRPeO
        s8wgtqhAhMTHp/uYIGoEJX5MvsfSxcgBNFRdYsqUXJAws4C4xLH7NxkhbHmJzWveMk9g5JuF
        pGMWQscsJB2zkHQsYGRZxSiZWlCcm55bbFRglJdarlecmFtcmpeul5yfu4kRGLDbDmv172B8
        vCT+EKMAB6MSD+8Pk4gYIdbEsuLK3EOMEhzMSiK8p3wjY4R4UxIrq1KL8uOLSnNSiw8xSnOw
        KInz8ucfixQSSE8sSc1OTS1ILYLJMnFwSjUwMnSU67E66LfOMf4Ry3do3/MNu6vcdjaJHHNZ
        OI1pV8Y05dl5f89H2KuJmz1d4MnebbXZ0zz5/+Iy9juqBb+7D2/kuBf5x9PY9nX7rKTn2yP+
        7Hwhd2/5ip63Ej+5Js29W196Ky6o8hvrZq2890tVO2bNfhhrcHpR8l3pD/ocpWv5/NnufO/+
        psRSnJFoqMVcVJwIAPuYjkZUAgAA
X-CMS-MailID: 20190205111849epcas2p4346fb8152fcbbbe799f4bc44b3eb39f7
CMS-TYPE: 102P
X-CMS-RootMailID: 20190205111849epcas2p4346fb8152fcbbbe799f4bc44b3eb39f7
References: <CGME20190205111849epcas2p4346fb8152fcbbbe799f4bc44b3eb39f7@epcas2p4.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen, Mike,

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.1-samsung

for you to fetch changes up to 81faa30df9b6e9088ea5ca488860616192e7b763:

  clk: samsung: exynos5433: Add selected IMEM clocks (2019-02-01 14:36:47 +0100)

----------------------------------------------------------------
clk/samsung updates for 5.1

Exynos5433 clock driver update adding support for selected clocks
of the IMEM CMU required for the cryptographic subsystem (SlimSS).

----------------------------------------------------------------
Kamil Konieczny (5):
      clk: samsung: dt-bindings: Add Exynos5433 IMEM CMU clock IDs
      clk: samsung: exynos5433: Fix definition of CLK_ACLK_IMEM_{200, 266} clocks
      clk: samsung: exynos5433: Fix name typo in sssx
      clk: samsung: dt-bindings: Document Exynos5433 IMEM CMU
      clk: samsung: exynos5433: Add selected IMEM clocks

 .../devicetree/bindings/clock/exynos5433-clock.txt  | 23 +++++++++++++
 drivers/clk/samsung/clk-exynos5433.c                | 38 ++++++++++++++++++++--
 include/dt-bindings/clock/exynos5433.h              |  8 ++++-
 3 files changed, 65 insertions(+), 4 deletions(-)


-- 
Regards,
Sylwester
