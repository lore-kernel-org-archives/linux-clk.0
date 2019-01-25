Return-Path: <SRS0=Vu82=QB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E650AC282C0
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 12:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD2B4218FE
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 12:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AKoITTun"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbfAYMlG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jan 2019 07:41:06 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46465 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbfAYMlF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jan 2019 07:41:05 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190125124104euoutp010dd01d32e08a53b916d901804b50bfef~9F9g7gEOZ2013520135euoutp01e
        for <linux-clk@vger.kernel.org>; Fri, 25 Jan 2019 12:41:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190125124104euoutp010dd01d32e08a53b916d901804b50bfef~9F9g7gEOZ2013520135euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548420064;
        bh=GWx6WzhxTbItMZYFwpJOuN6j90WVuUYxBBQb3W2/xk0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=AKoITTunVQZXkFP6Je+tvwcOTUVQsCRCcr543vT2Dba1YeaDO+5xyRAbvJxl0hhgF
         M/A0F66ON3Rc+oHiDPLEUsqanB2HFhdkkgujSTQ8JFwgBClmDHTc61qkwPXMXEY02q
         eV6y2VQ9KatFRDUaIliSS06sqJTRyTUrCDCSdiUM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190125124103eucas1p1d0a21ab60b5ff8a6be11d515e8b39995~9F9gIGGSL0982809828eucas1p1u;
        Fri, 25 Jan 2019 12:41:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A9.7E.04294.FD30B4C5; Fri, 25
        Jan 2019 12:41:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190125124102eucas1p2bd3db47afecfb7c7134877f5eefcd9c3~9F9fOSiEz1122411224eucas1p2l;
        Fri, 25 Jan 2019 12:41:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190125124102eusmtrp128cce4fcf60f43cc7a88e21b6a21ecc3~9F9e-i6z00438204382eusmtrp1Y;
        Fri, 25 Jan 2019 12:41:02 +0000 (GMT)
X-AuditID: cbfec7f4-84fff700000010c6-56-5c4b03df8f10
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id EF.7D.04128.ED30B4C5; Fri, 25
        Jan 2019 12:41:02 +0000 (GMT)
Received: from [106.120.51.18] (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190125124101eusmtip2581a8dcf97420c93976645374f7f5a0d~9F9eYMa-j1324213242eusmtip2C;
        Fri, 25 Jan 2019 12:41:01 +0000 (GMT)
Subject: Re: [PATCH v5 1/5] clk: samsung: exynos5433: fix typo in imem
 divider
To:     Greg KH <greg@kroah.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        stable@vger.kernel.org
From:   Kamil Konieczny <k.konieczny@partner.samsung.com>
Message-ID: <9725eefc-2f2b-5fe1-326f-59f377999e17@partner.samsung.com>
Date:   Fri, 25 Jan 2019 13:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190122093313.GA21774@kroah.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG/XZ2tqN05HMZe7tQtDAqmJcIOmB0gZBZ/0j90c20kx5sODfZ
        aalFZHSzeS2JbJhKGdbSNDUNUxnb2PKCJoqV3XRZeWmVTUq7WdtR8r/f937Pw/M+Hx9FyJzk
        EkqtPcrptaxGIQkQNzimu5RviJ2x4T+maOZ+UTXJPJ38QDKl9i6S6SorQkz+23GC6e6ukTIT
        Oa9Jpqi7VcRU2V9JmVtPe0TMuRa7lLF9vEAyZfddaCutqiypRKpa80WJyj0Uo8qrNyOVp3Z5
        DLk/YFMip1Ef4/Rhmw8FHDn/Fqf2kelnWtuJTNQuNiJ/CvAG6D3dTxhRACXDtxE8MLmRcJhE
        4LR3EF6VDHsQjAzvnnMMPpuSCqIKBBZXw6zDjeD3pd8ir2ohjoFRy4TEy8F4GWSVN/scBLYR
        UPrmtk8kwRvB1djpYxpHwYzJ6IsT4xCYLs+SenkR3gu23E9I0ARB27Vh3+L+OAzGB22+AALL
        YWC4VCTwCmh0F/sKAR6QQlFJn0jYezvUOWxI4IUw5qyXCrwMOgpzZl8jDR49eC8VzGcRXC+8
        MWuOBJuzhzQi6l/CWqhuChPG26DY3Cz2jgEHwjN3kLBDIFxuuEoIYxqyzssEtRJKZjpJgZeC
        ceYeWYAUpnnNTPPamOa1Mf3PLUNiM5JzBj4liePXa7m0UJ5N4Q3apNAEXUot+ve9Ov44Jx+i
        pl+HrQhTSLGAzrJGx8pI9hifkWJFQBGKYNrj2BEroxPZjOOcXhevN2g43oqWUmKFnD7hN3hA
        hpPYo1wyx6Vy+rlbEeW/JBOdqon89mSxJ3EkuyBb9wFfiRgbNoTHu0ssA54vudM1bmX/0J+f
        Bxsffg+pWpUW8i5brs4Pfp6ex1vUaE1dAj+0ufzT3jiJ7vRdVxRr6j3+9Ut0cksivetxmyNz
        dV2k3C9/33ZD7JRfTNzJlxOft7y4yd8Z1KzzrKxoHbUpPXvq7yjE/BE2Yh2h59m/PUATBFoD
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xe7r3mL1jDP5d5bXYOGM9q8X1L89Z
        LeYfOcdqcW7BDEaL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWe1
        WLDxEaMDr8eaeWsYPTat6mTzePswwKNvyypGj8+b5AJYo/RsivJLS1IVMvKLS2yVog0tjPQM
        LS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy2h4LFFxhrWjed4q5gfEUSxcjJ4eEgInE
        gxs/2LsYuTiEBJYyShxq28AKkZCWaDy9mgnCFpb4c62LDaLoNaPEmVWTwIqEBfwkDjS2MYPY
        IgIyEh1L9oBNYhY4zCzxf8UCVoiOH4wSLV0zwPaxCZhLPNp+Bmwsr4CbxP9ZXWDdLAKqEj+X
        dLCD2KICERIfn+6DqhGUODnzCVgvp4C+xOsHh9lAbGYBdYk/8y4xQ9jiEreezGeCsOUltr+d
        wzyBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMCI3Xbs55Yd
        jF3vgg8xCnAwKvHwdhzyjBFiTSwrrsw9xCjBwawkwvv5mFeMEG9KYmVValF+fFFpTmrxIUZT
        oOcmMkuJJucDk0leSbyhqaG5haWhubG5sZmFkjjveYPKKCGB9MSS1OzU1ILUIpg+Jg5OqQZG
        7YmOPuuvsFwu2jijQ1Pzs0bSdv++54fmNp3udVTN2LpLy+bNHYYzeWscJP9tMf+28tq154q5
        Trw8XUdjJk000LzuXvs2/P4PZv6eurptDq8ZWJ/Ysiox58ic+3w9eouuydll0+JkF+bvn1rD
        dJjv99S7eT8Lr2fdrHBYdHVy3fNFKy1l+gNKlFiKMxINtZiLihMBbb8XRu4CAAA=
X-CMS-MailID: 20190125124102eucas1p2bd3db47afecfb7c7134877f5eefcd9c3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b@eucas1p1.samsung.com>
        <20190122090232.29194-2-k.konieczny@partner.samsung.com>
        <20190122093313.GA21774@kroah.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22.01.2019 10:33, Greg KH wrote:
> On Tue, Jan 22, 2019 at 10:02:28AM +0100, Kamil Konieczny wrote:
>> Fix typo in imem clock divider 200 switched with 266.
>>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5433.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read: [...]
After reconsideration that there are no users of imem clock in old kernels,
please drop this patch from stable.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland

