Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B084EC282DB
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 08:08:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F04B214C6
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 08:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="W6HpM70G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbfAUIIn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 03:08:43 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32815 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728328AbfAUIIf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 03:08:35 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190121080834euoutp022c2ea93a90efa9bad365de5261cb7f4f~7zqcZrPoI3208032080euoutp02B
        for <linux-clk@vger.kernel.org>; Mon, 21 Jan 2019 08:08:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190121080834euoutp022c2ea93a90efa9bad365de5261cb7f4f~7zqcZrPoI3208032080euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548058114;
        bh=4Nus8gGK1A1XJ0Kj8gZ2vgQLPiOqsqHC9ZqLr3kKPeA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=W6HpM70GS7qs1J2ejxbRvoyUdk1pMTrqHAKcApmaXhUdoTpvCrcGoxaNrzlfEjwV9
         cHzW2PVNACkk+TWFXf3s6wSfR0URY0vtqXLatpPoVPGvTXH5crfRFKelaLyt3KEKdT
         0Yl29uIiQwQ4HxtiQMuM4KO+aL/wmvh0MSrKs43M=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190121080832eucas1p2b34d6e92a079d65a7b97961e684d490d~7zqba5W9W1436514365eucas1p2k;
        Mon, 21 Jan 2019 08:08:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 85.08.04294.00E754C5; Mon, 21
        Jan 2019 08:08:32 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190121080832eucas1p2aa0c22a6c4f8291388b9044e91a21477~7zqamwvKk2792127921eucas1p2-;
        Mon, 21 Jan 2019 08:08:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190121080831eusmtrp238195fc4ef9d61d5e51864935b9d8fcd~7zqaX9gHs1012510125eusmtrp2B;
        Mon, 21 Jan 2019 08:08:31 +0000 (GMT)
X-AuditID: cbfec7f4-84fff700000010c6-04-5c457e0018c3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 92.3B.04128.FFD754C5; Mon, 21
        Jan 2019 08:08:31 +0000 (GMT)
Received: from [106.120.51.18] (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190121080831eusmtip29a8bba0564ed580d9958c8391f2c9224~7zqZ3BCkK3191431914eusmtip2f;
        Mon, 21 Jan 2019 08:08:31 +0000 (GMT)
Subject: Re: [PATCH v3 4/5] arm64: dts: exynos: add imem clock
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Kamil Konieczny <k.konieczny@partner.samsung.com>
Message-ID: <3ca730b9-3cad-4e98-1e3b-19aca71863d5@partner.samsung.com>
Date:   Mon, 21 Jan 2019 09:08:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213211009.GA5444@kozik-lap>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7oMda4xBm/uaFhsnLGe1eL6l+es
        FvOPnGO16H/8mtni/PkN7BYfe+6xWsw4v4/JYu2Ru+wWS69fZLJo3XuE3eLwm3ZWB26PNfPW
        MHpsWtXJ5tG3ZRWjx+dNcgEsUVw2Kak5mWWpRfp2CVwZb6btYylYxV7x43UTawPjF9YuRk4O
        CQETiQ8/Wlm6GLk4hARWMEpMPr6NDcL5wijxY+odVgjnM6PEorsb4VpunN0M1bKcUWLmqQfs
        IAkhgbeMEicf1HcxcnAIC9hJdO7LBgmLCGhKXP/7HWwQs0ATs8Sb+xvB6tkEzCUebT/DBFLP
        K+AmsXBTJUiYRUBV4u3TtywgtqhAhETH/dVsIDavgKDEyZlPwOKcAnoSxw/sZASxmQXEJW49
        mc8EYctLbH87hxlkl4TAJXaJBTcmskMc7SLR2ruVDcIWlnh1fAtUXEbi/06IZgmBcondW5+x
        QzS3MErMnbwIKmEtcfj4RVaQQ5mBvlm/Sx8i7CjxePlXZpCwhACfxI23ghA38ElM2jYdKswr
        0dEmBFGtKzHv/xloEEpLdP1fxzqBUWkWks9mIflmFpJvZiHsXcDIsopRPLW0ODc9tdgoL7Vc
        rzgxt7g0L10vOT93EyMwPZ3+d/zLDsZdf5IOMQpwMCrx8P645xIjxJpYVlyZe4hRgoNZSYT3
        tbtrjBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQbGvo2X
        WtzMp2k+WpG1uUH9qHfb401H0mPnLeb7zs3Ed+fLq7nen/jnnJSP4l+gsPYh08HgvxUiDSrM
        E1wad0ne3nzSp7uQK7f9yZmM9L8Bgnf+B70UCT2iHbJqbuOG6xUcTpMupYYpLBZKFhLxFay9
        sOKgW3mm54tNwqtNTC7vvp8bsefb00mFSizFGYmGWsxFxYkAUKKT50sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7r/a11jDPZf1rPYOGM9q8X1L89Z
        LeYfOcdq0f/4NbPF+fMb2C0+9txjtZhxfh+Txdojd9ktll6/yGTRuvcIu8XhN+2sDtwea+at
        YfTYtKqTzaNvyypGj8+b5AJYovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
        9O1sUlJzMstSi/TtEvQy3kzbx1Kwir3ix+sm1gbGL6xdjJwcEgImEjfObmbpYuTiEBJYyigx
        7eQDdoiEtETj6dVMELawxJ9rXWwQRa8ZJT5O6WfuYuTgEBawk+jclw1SIyKgKXH973dWkBpm
        gRZmie27PzNCNHxnlJg+bRbYVDYBc4lH288wgTTzCrhJLNxUCRJmEVCVePv0LQuILSoQIXH2
        5TpGEJtXQFDi5MwnYHFOAT2J4wd2gsWZBdQl/sy7xAxhi0vcejKfCcKWl9j+dg7zBEahWUja
        ZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECY3LbsZ9bdjB2vQs+xCjA
        wajEw/vjnkuMEGtiWXFl7iFGCQ5mJRHe1+6uMUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqc
        D0wXeSXxhqaG5haWhubG5sZmFkrivOcNKqOEBNITS1KzU1MLUotg+pg4OKUaGF3YWyevCItu
        XhbFEt3Ut/Ifc287+4X4aUtSAsU+ckxduVRlYdWrPf/ficUHsm++9EXi5b4vlxaWRwTn3d5x
        3pzN7be7C8cEv0X31SUObilT9Jp/+sGe6x7Gl/MKJktu28j5s1L1/fxfG2bqf9pjdF5dImy9
        28umgDyX9dtePzmzRsghKtFS+rYSS3FGoqEWc1FxIgCoF0Uo3wIAAA==
X-CMS-MailID: 20190121080832eucas1p2aa0c22a6c4f8291388b9044e91a21477
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275@eucas1p1.samsung.com>
        <20181204165248.17572-5-k.konieczny@partner.samsung.com>
        <20181213211009.GA5444@kozik-lap>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13.12.2018 22:10, Krzysztof Kozlowski wrote:
> On Tue, Dec 04, 2018 at 05:52:47PM +0100, Kamil Konieczny wrote:
>> Add description for imem clock in the Samsung Exynos5433. The users can use
>> compatibility "samsung,exynos5433-cmu-imem".
> 
> Thanks, applied but the commit message above is not matching contents at all.
> You did not add the description. Mentioning some users and compatibility
> also seems unrelated. Instead:
> 1. You added DT node for IMEM clock controller on Exynos5433.
> 2. Because it is necessary for SSS to work (beside obvious reasons: for
>    DTS completeness and allowing to gate them when not used).
> Also, please use SoC name in commit title (for example at the end) to
> differentiate from Exynos7 or any other future SoCs.

Thank you for your work and insightfull comments, I hope to improve my
commit messages.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland

