Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E94C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FFA3214DE
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="B6g8Pk3e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FFA3214DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbeKUWje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 17:39:34 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36807 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbeKUWjc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 17:39:32 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181121120524euoutp0189c6bf3fa826383c08235591ec165568~pIi0QjgDg1575615756euoutp01K
        for <linux-clk@vger.kernel.org>; Wed, 21 Nov 2018 12:05:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181121120524euoutp0189c6bf3fa826383c08235591ec165568~pIi0QjgDg1575615756euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1542801924;
        bh=Ym+pgePdPlyFvQ8JlJ3iKY1EQaDT7CT9H6vUTGsqhhg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=B6g8Pk3ewSedIIQK+RkGfzFUxF5PibFi/ENSfC4IQRBVH8cDCdZU7lWC61oqvuoaw
         pYsoWVh8R78SoFIE0nfZquZw3wEyoluI+U7CljnPUHmyft775sydO3qwJioZxJFkyF
         IlVScXlEO+O5iMIzQC949kxG/VWArBpS78yKd/fI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181121120523eucas1p2be1ecde376f8f610bce7035136918275~pIizwrSPJ1840618406eucas1p2a;
        Wed, 21 Nov 2018 12:05:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 2C.1D.04294.30A45FB5; Wed, 21
        Nov 2018 12:05:23 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181121120522eucas1p2ecd03f848bc4ea3be3d517b40b78b084~pIiy4-VuT1840618406eucas1p2Z;
        Wed, 21 Nov 2018 12:05:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181121120522eusmtrp10c23a0a700c8c444164977826f99dbe0~pIiypuR_k1308713087eusmtrp1F;
        Wed, 21 Nov 2018 12:05:22 +0000 (GMT)
X-AuditID: cbfec7f4-84fff700000010c6-15-5bf54a03d147
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.F2.04128.20A45FB5; Wed, 21
        Nov 2018 12:05:22 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181121120521eusmtip29314d19d1397366ddf98f37261587c18~pIiyF9lc21639716397eusmtip2N;
        Wed, 21 Nov 2018 12:05:21 +0000 (GMT)
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
Subject: [PATCH 0/4] Add imem clock for Exynos 5433
Date:   Wed, 21 Nov 2018 13:05:05 +0100
Message-Id: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zlnO4qz42b64tJiYJAwtRsdScJC5GBEEQWVla48qLRN26Zm
        EYzSpaZTNPDaLDWseSvzxsxVai3TXP4IDVG00sguJmohrMx5Zvnv+Z7L+z4vfCQmaiV8yASV
        llWr5Aop3xVvfbFok2GRC1HBGTYJ/bC4kaCH5j8RdEXPAEEbLEuIzvvwBaNttgcCejZnjKCL
        bRYeXd8zKqDvDg3y6IzOHgHd/fU6EebG1BnrENNkyuIzz74/5jGGZhNi5pr8DhMnXUNjWUVC
        CqsO2hvjGm98EpJkxy+OVZfjOrSAZSMXEqidUFR+h8hGrqSIuofAUF3A4x7zCDr1b53KHIK+
        jCrBasSim3AKNQh+5jYS/yKNRivucPGp3fC+rZ/nwJ5UBBgKy/gOE0bpMZgsy14WSFJM7YDK
        2Q0OiFP+UFWT4LALqXAosekRt2wT6MyPBBzvAb0lH1fGY8v8tZYyzDESKKMAZvqGne3CoXf0
        NZ/DYpi2Njv5jdBXmINzOBU6WqYEXDgdwa3CSh4n7IFu6yDhKIRRW6HRHMTR+6C/PpPvoIFy
        h+FvHlwHdyhoLcI4WgiZehHnloFxqZ/gsASylxqcmIHCyvsrzUTUaRjJG8Lz0ebSNZeVrrms
        9H+H2wgzIW82WaOMYzXbVWxqoEau1CSr4gLPJSqb0PJv6vtjnW9HZvvZLkSRSOomjBHPR4kI
        eYomTdmFgMSknsIToQtRImGsPO0Sq06MVicrWE0XkpC41Ft4ed14lIiKk2vZ8yybxKpXVR7p
        4qNDSrcIwu/lFQ+id/xGWvCpaVn0yC7tK8bi2bDpSLSS9Aoxp99c4psqZjpyy8MkvsclP2rt
        xin/N1X5SRcU68WWhd7FIkNqVtvAKEqsPTDq9fuM+VC7n4evOjJXF9IWf1DG+ASnT1mf2p/X
        B0x8jtivmrz6q1x7TP9ODv5M69EtUlwTL98WgKk18r/EL1QnSQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42I5/e/4PV0mr6/RBl9XKFhsnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
        xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2PefsuCPywV95bMYWlg/MrcxcjJISFgIrGv4SFr
        FyMXh5DAUkaJl/M3sEMkpCUaT69mgrCFJf5c62IDsYUEPjFKfLicDGKzCZhLPNp+BqxGRMBD
        YsbExWCDmAX6mCU+HzwPNIiDQ1jAWGLRR1EQk0VAVWLx8kyQcl4BF4mZ59sYIcbLSzTs2swO
        EReUODnzCQuIzQwUb946m3kCI98sJKlZSFILGJlWMYqklhbnpucWG+kVJ+YWl+al6yXn525i
        BEbEtmM/t+xg7HoXfIhRgINRiYc3QfhLtBBrYllxZe4hRgkOZiUR3kibr9FCvCmJlVWpRfnx
        RaU5qcWHGE2Bbp3ILCWanA+M1rySeENTQ3MLS0NzY3NjMwslcd7zBpVRQgLpiSWp2ampBalF
        MH1MHJxSDYzF/Ip/pH026ie/Z+qsuljdk1MrK2GjqKmx0FXbMH35/f87LJ1OabwQP1jcvEko
        90KN5K6I2fXcRoxFJj+nztp84uG0WR26GjuDCpe82p2gz601w+87b/+8Cb5fNE5PZP6+UtFx
        AoNbQM+5vxv/PJXaPivr0kLhZTvZ2nQ1S/8ptGVFLn8b7KLEUpyRaKjFXFScCAC7BkvbngIA
        AA==
X-CMS-MailID: 20181121120522eucas1p2ecd03f848bc4ea3be3d517b40b78b084
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181121120522eucas1p2ecd03f848bc4ea3be3d517b40b78b084
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181121120522eucas1p2ecd03f848bc4ea3be3d517b40b78b084
References: <CGME20181121120522eucas1p2ecd03f848bc4ea3be3d517b40b78b084@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imem clock for Exynos 5433. This will allow to use SSS and SlimSSS
(Security SubSystem) with crypto functions.

Kamil Konieczny (4):
  clk: samsung: exynos5433: fix name typos
  arm64: dts: bindings: document imem clock
  arm64: dts: exynos: add imem clock
  clk: samsung: exynos5433: add imem clock

 .../bindings/clock/exynos5433-clock.txt       |  23 ++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  15 ++
 drivers/clk/samsung/clk-exynos5433.c          | 129 +++++++++++++++++-
 include/dt-bindings/clock/exynos5433.h        |  57 +++++++-
 4 files changed, 220 insertions(+), 4 deletions(-)

-- 
2.19.1

