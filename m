Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F297AC282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 13:30:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B608C218AF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 13:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZnGJEP7i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbfBANa7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 08:30:59 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:55970 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfBANa7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 08:30:59 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20190201133056epoutp02b2f5340c65e88517148189023b444780~-QKDJUL0c0185801858epoutp02L;
        Fri,  1 Feb 2019 13:30:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20190201133056epoutp02b2f5340c65e88517148189023b444780~-QKDJUL0c0185801858epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1549027856;
        bh=855UjWAX5uORV8fs9lIdBdjTsOeQ/k4YApUi002F/uI=;
        h=Subject:To:Cc:From:Date:In-reply-to:References:From;
        b=ZnGJEP7i/QTpn5Fxkm54xAS5Dn+bkiwe/zSZA8NoGYVi8mQ+bWVjH6uUqzfywYgat
         aa0BIROu4b0LH0bePufIwTcZCAqrdTdSll4m88Satd6oM+JQ4Jl3yBYkpYNucknIZA
         Mry0TIdWIHUq5a5EzOCdE98Sfj75/vwMHD44oyAg=
Received: from epsmges1p2.samsung.com (unknown [182.195.42.54]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190201133055epcas1p217295536354060ebcbe9ee4a7dd15697~-QKC1OECm1258212582epcas1p2p;
        Fri,  1 Feb 2019 13:30:55 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3A.54.04173.F0A445C5; Fri,  1 Feb 2019 22:30:55 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190201133055epcas1p4a2c93a21cb44bd0c9a5452eef43a5053~-QKCYRIXw0960709607epcas1p4F;
        Fri,  1 Feb 2019 13:30:55 +0000 (GMT)
X-AuditID: b6c32a36-5c1ff7000000104d-6f-5c544a0f43af
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p1new.samsung.com
        (Symantec Messaging Gateway) with SMTP id 27.23.04015.F0A445C5; Fri,  1 Feb
        2019 22:30:55 +0900 (KST)
Received: from [106.116.147.40] by mmp2.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PM900E3W1JEX590@mmp2.samsung.com>; Fri, 01 Feb 2019 22:30:55 +0900 (KST)
Subject: Re: [PATCH v5 0/5] Add imem clock for Exynos 5433
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <b4bee5f1-8063-28d8-da56-31338581896c@samsung.com>
Date:   Fri, 01 Feb 2019 14:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.4.0
MIME-version: 1.0
In-reply-to: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7bCmgS6/V0iMwcYTBhYbZ6xntbj+5Tmr
        xfwj51gt+vb9Z7Tof/ya2eL8+Q3sFh977rFazDi/j8li7ZG77BZLr19ksmjde4Tdgdtjzbw1
        jB6bVnWyeRx8t4fJo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDKmbt7KUvCCpWJjwxPmBsYL
        zF2MnBwSAiYSCzb/Zuxi5OIQEtjBKNE1YxaU851R4uLmfUwwVQvX3GCHSGxglJh26CUThHOf
        UWL9yemMIFXCAlYSnY0bwDpEBEwlHq1uYAUpYhb4wyTxeO59dpAEm4ChRO/RPrAGXgE7idX3
        rrGC2CwCqhKntr8EO0pUIELicO87qBpBiR+T77GA2JwCrhJ/J38Ds5kFNCVefJkEZYtLHLt/
        kxHClpfYvOYtM8hiCYHPbBKXrr5kh/jBRaJ5zn4gmwPIlpa4dNQWIlwtsWt7N1R9B6NEy4Xt
        0JCxljh8/CIrxFA+iXdfe1ghenklOtqEIEo8JA4e2ccGCYkZjBLvl01jm8AoMwvJ3bOQ3DoL
        ya2zkNy6gJFlFaNYakFxbnpqsWGBkV5xYm5xaV66XnJ+7iZGcELRMtvBuOiczyFGAQ5GJR7e
        Db+CYoRYE8uKK3MPMUpwMCuJ8K5wCYkR4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrvewTlGSCA9
        sSQ1OzW1ILUIJsvEwSnVwCh04ENaaIDKmXx5n8KpQVH2dis/yiT+ura24fgDizyrzKI7FoGn
        7kwzfpR4+VyDnXmW+UKDgJvTg88ZPnL6Kvho3y5LnZUFW6/0nrjUVF7KVqlWKyRlEZubHCGv
        wjPjRef3t49+HN8klbC5Se32SlUFvcq4pVvnacRO2705KfDopZN9lU8+qiuxFGckGmoxFxUn
        AgCMIKggJAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42I5/e+xoC6/V0iMwcL7PBYbZ6xntbj+5Tmr
        xfwj51gt+vb9Z7Tof/ya2eL8+Q3sFh977rFazDi/j8li7ZG77BZLr19ksmjde4Tdgdtjzbw1
        jB6bVnWyeRx8t4fJo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDKmbt7KUvCCpWJjwxPmBsYL
        zF2MnBwSAiYSC9fcYO9i5OIQEljHKNH2/jcbhPOQUeJx+1pWkCphASuJzsYNTCC2iICpxKPV
        DawgRcwCf5gkjn1pZIXomMUoseLlBUaQKjYBQ4neo31gNq+AncTqe9fAJrEIqEqc2v4SbLeo
        QITEx6f7mCBqBCV+TL7HAmJzCrhK/J38DcjmANqgLjFlSi5ImFlAXOLY/ZuMELa8xOY1b5kn
        MAItReiehdAxC0nHLCQdCxhZVjFKphYU56bnFhsVGOallusVJ+YWl+al6yXn525iBMbLtsNa
        fTsY7y+JP8QowMGoxMO74VdQjBBrYllxZe4hRgkOZiUR3hUuITFCvCmJlVWpRfnxRaU5qcWH
        GKU5WJTEeW/nHYsUEkhPLEnNTk0tSC2CyTJxcEo1MM5IzDE8NfEi18ekzd+22+7tztDMKZwc
        WKYQWxOndGd/g2X4p/JjPmLztaVS93x//ZHR/qSsRlLziQ37Xp7/615az334/D6D5azJzJkb
        3nla/JzIf4TP1O9RWMZf5Vmyc72v/lE8MinJ6QuTh1D2F1MZ7bQlKtvPZGunPj2UvPZ32uUr
        +wUrTymxFGckGmoxFxUnAgB95k5bkwIAAA==
X-CMS-MailID: 20190201133055epcas1p4a2c93a21cb44bd0c9a5452eef43a5053
CMS-TYPE: 101P
X-CMS-RootMailID: 20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500
References: <CGME20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500@eucas1p1.samsung.com>
        <20190122090232.29194-1-k.konieczny@partner.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

I applied whole series with minor commit message edits and change as
below squashed to patch 4/5.

diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 52652aaabc06..25ffa53573a5 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -1410,6 +1410,6 @@
 #define CLK_ACLK_SLIMSSS               2
 #define CLK_PCLK_SLIMSSS               35
 
-#define IMEM_NR_CLK                    52
+#define IMEM_NR_CLK                    36
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */


-- 
Thanks,
Sylwester
