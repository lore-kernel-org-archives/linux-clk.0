Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41838C04EBA
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BD8220868
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 15:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y36Dib6h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD8220868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbeK3C6Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 21:58:25 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47206 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbeK3C5g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 21:57:36 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20181129155147euoutp02f6cdf3e5a15dfa5664a1a666c18099e1~royw3HE_X1074810748euoutp02_
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 15:51:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20181129155147euoutp02f6cdf3e5a15dfa5664a1a666c18099e1~royw3HE_X1074810748euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543506707;
        bh=rVJAduIbopWMzM6PEOT3V2hQKp6AHEGYmVz4oH3laT8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Y36Dib6hA+PwklLBCJffwvb0gywONlM8pMvMyTHTWuKYJNQ93HdYlbKFmtWW/CYCJ
         cvBRBF7Xh2LDkBg79xw5iylvaH7TgZQiuEn6LWg+4xc49Wj3yb1noY5nmu/boHoiCq
         AGQhvDkbc21scGRVY5peH3phvjGH8dHkv7932D0g=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181129155145eucas1p294eb5e48028b34f5e15bf4def86a78c8~royunNDkY1778817788eucas1p2N;
        Thu, 29 Nov 2018 15:51:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id CB.4F.04806.01B000C5; Thu, 29
        Nov 2018 15:51:44 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181129155144eucas1p25ff3b4c969bd61830befd975ed5085ce~royt1nvBW1780717807eucas1p2Z;
        Thu, 29 Nov 2018 15:51:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181129155144eusmtrp1962835521a8f48ea2efefad13eef592b~roytmbrnU3243432434eusmtrp1W;
        Thu, 29 Nov 2018 15:51:44 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-aa-5c000b10dbd2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.E2.04284.F0B000C5; Thu, 29
        Nov 2018 15:51:44 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181129155143eusmtip2a9af7cc76c652f905df57c23f16a1366~roytB3MqY2940129401eusmtip2A;
        Thu, 29 Nov 2018 15:51:43 +0000 (GMT)
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
Subject: [PATCH v2 0/5] Add imem clock for Exynos 5433
Date:   Thu, 29 Nov 2018 16:51:29 +0100
Message-Id: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7oC3AwxBo9mW1psnLGe1eL6l+es
        FvOPnGO16Nv3n9Gi//FrZovz5zewW3zsucdqMeP8PiaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK2PJ+h2MBbfZKron
        z2ZuYFzC2sXIySEhYCJx7c9Hti5GLg4hgRWMEssmXGKEcL4wSnzZN50JwvnMKHF+w3wmmJbv
        3xdCVS1nlLjd+Z0drqV52zFmkCo2AXOJR9vPgHWICLhJ9E2eDbaEWaCNWeLp7C6whLCAmcSF
        Ex8YQWwWAVWJMwung13FK+Ai0bPhDDPEOnmJhl2b2SHighInZz5hAbGZgeLNW2dD1cxjl1h0
        MQTCdpHYvLAB6lRhiVfHt7BD2DISpyf3sEDY5RK7tz4Du1pCoIVRYu7kRVAN1hKHj18EOoID
        aIGmxPpd+hBhR4mDU0HmcADZfBI33gpCnMAnMWnbdGaIMK9ER5sQRLWuxLz/Z6DhKy3R9X8d
        lO0h0X75M9i3QgKxEtOaG9gmMCrMQvLYLCSPzUK4YQEj8ypG8dTS4tz01GLjvNRyveLE3OLS
        vHS95PzcTYzA9HT63/GvOxj3/Uk6xCjAwajEw+vw63+0EGtiWXFl7iFGCQ5mJRHewxwMMUK8
        KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJpCeWpGanphakFsFkmTg4pRoYc6684rzmdaCp
        T+PBy9yjLssPt1Revstm+X//q02s01sTlp66eDUo87mLp82aDUlLjsWK7l2htv5XecTu7Q68
        kUFzRK7crF13N/A5/4WMBxdvx/9eYF2TITRrnbrp/7LOje5BVgdkMo2fl5962LCS4yTrwtt7
        37IeW7d+/rcbT07N3F10V0z2sbcSS3FGoqEWc1FxIgBzFoNSSwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4PV0BboYYgzWvGS02zljPanH9y3NW
        i/lHzrFa9O37z2jR//g1s8X58xvYLT723GO1mHF+H5PF2iN32S2WXr/IZNG69wi7xeE37awO
        PB5r5q1h9Ni0qpPN4+C7PUwefVtWMXp83iQXwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdk
        YqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl7Fk/Q7GgttsFd2TZzM3MC5h7WLk5JAQMJH4/n0h
        YxcjF4eQwFJGiU0fjzFDJKQlGk+vZoKwhSX+XOtigyj6xCixYNFeNpAEm4C5xKPtZ8CKRAQ8
        JGZMXMwKUsQs0Mcs8fngeXaQhLCAmcSFEx8YQWwWAVWJMwung63mFXCR6NlwBmqbvETDrs3s
        EHFBiZMzn7CA2MxA8eats5knMPLNQpKahSS1gJFpFaNIamlxbnpusaFecWJucWleul5yfu4m
        RmBkbDv2c/MOxksbgw8xCnAwKvHwOvz6Hy3EmlhWXJl7iFGCg1lJhPcwB0OMEG9KYmVValF+
        fFFpTmrxIUZToGMnMkuJJucDozavJN7Q1NDcwtLQ3Njc2MxCSZz3vEFllJBAemJJanZqakFq
        EUwfEwenVAPjnMf6trtKX0uq5KmXv+TKDVs3T22Gr+fqg3r5O0z+W/x/vlv0q+3NmswU2Rtn
        jt5Jj1l07ui8pmTBdKPWg1OzNZg0zO4tXHyjc09y4I+cXJN9l9avP9a++511WJDlk/Vt9293
        dNre7BH8LxPwqi7J5prQfct5M4WT2kSiZwgnln8oWZgm4+CuxFKckWioxVxUnAgAOlfydKIC
        AAA=
X-CMS-MailID: 20181129155144eucas1p25ff3b4c969bd61830befd975ed5085ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181129155144eucas1p25ff3b4c969bd61830befd975ed5085ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181129155144eucas1p25ff3b4c969bd61830befd975ed5085ce
References: <CGME20181129155144eucas1p25ff3b4c969bd61830befd975ed5085ce@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imem clock for Exynos 5433. This will allow to use SSS and SlimSSS
(Security SubSystem) with crypto functions.

Changes since v1:
- splitted typo patch into two, one of them for stable, suggested by Krzystof
  Kozlowski
- added more registers as suggested by Chanwoo Choi

Kamil Konieczny (5):
  clk: samsung: exynos5433: fix typo in imem divider
  clk: samsung: exynos5433: fix name typo in sssx
  arm64: dts: bindings: document imem clock
  arm64: dts: exynos: add imem clock
  clk: samsung: exynos5433: add imem clock

 .../bindings/clock/exynos5433-clock.txt       |  23 +++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  15 ++
 drivers/clk/samsung/clk-exynos5433.c          | 195 +++++++++++++++++-
 include/dt-bindings/clock/exynos5433.h        |  57 ++++-
 4 files changed, 286 insertions(+), 4 deletions(-)

-- 
2.19.1

