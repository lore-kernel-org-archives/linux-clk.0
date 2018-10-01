Return-Path: <SRS0=O2Xu=MN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC4FC43143
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 12:34:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEC66208E7
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 12:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="u1agddsb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC66208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbeJATLp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Oct 2018 15:11:45 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39644 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729186AbeJATLp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Oct 2018 15:11:45 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181001123408euoutp01ba16116bd4b4688b13b1e519ddde557b~ZfCWMyoP32489224892euoutp01Z
        for <linux-clk@vger.kernel.org>; Mon,  1 Oct 2018 12:34:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181001123408euoutp01ba16116bd4b4688b13b1e519ddde557b~ZfCWMyoP32489224892euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1538397248;
        bh=w4ATn8Nf/jSxpRwZll5NnwMuY1KcZh2frMz890lofqw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=u1agddsbLM4BsgFNDKYA/cLv6ENfJ3P8yuZaT9fBfxpctzeM2d80Hh+u3PKTYQhiY
         Pkd3ZhzvU129rjtl6LVyonnAuViC6gKDAk8InWFkzLFhsh3376U4fFVKg8SO3mqXC/
         CxYwanyxsLRL2SMUwZl7Qe7c8iDek35jiuJ9wWUg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181001123407eucas1p273b9806ada5abeca2f37108615dee490~ZfCVZHODu0377303773eucas1p2n;
        Mon,  1 Oct 2018 12:34:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id FD.B6.04441.F3412BB5; Mon,  1
        Oct 2018 13:34:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181001123406eucas1p2c94cf1d1e4674d45c95a9ba9853a965b~ZfCUbgmeC1880918809eucas1p2N;
        Mon,  1 Oct 2018 12:34:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181001123406eusmtrp11c3ae5b3d8818ef086d0cca64e057128~ZfCUCS32L2912129121eusmtrp1h;
        Mon,  1 Oct 2018 12:34:06 +0000 (GMT)
X-AuditID: cbfec7f2-5c9ff70000001159-88-5bb2143fee96
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 05.6F.04128.D3412BB5; Mon,  1
        Oct 2018 13:34:06 +0100 (BST)
Received: from [106.116.147.30] (unknown [106.116.147.30]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181001123405eusmtip2c7529bcec5fa14b450e75a0dc82a7711~ZfCTjT-by3046430464eusmtip2F;
        Mon,  1 Oct 2018 12:34:05 +0000 (GMT)
Subject: Re: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume
 support
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Date:   Mon, 1 Oct 2018 14:34:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
        Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFok_Fc=9EDOvKByyuOYhHbejXKRT9+a+nRDEJ_YAjP2Aw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7djP87r2IpuiDSau47bYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvF594jjBYzzu9jsjhz+hKrRfvTl8wWx9eGO3B6bFrVyeZx59oeNo8tV9tZ
        PPq2rGL0+LxJLoA1issmJTUnsyy1SN8ugSvj4pOUgtMqFRP7jrI0ML6S7WLk5JAQMJH43P+O
        qYuRi0NIYAWjxPRHv9ggnC+MEi/u/maEcD4zSpxe0sgC03Lg1DwWiMRyRokHK09A9b9nlJg9
        +zcrSJWwQKjEybM32UFsEQENiT0Pz7OCFDELPGeSWLNoC9goNgFDia63XWwgNouAisTi+TeA
        9nFwiArESPzeZQ0S5hUQlDg58wlYOadAoMSW91MYQWxmAXmJ7W/nMEPY4hK3nswHO0JCYB+7
        xJ6bW5kgmsskdszbywxxtovElCX3oWxhiVfHt7BD2DISpyf3sEA0NzNKtM+YxQ7h9DBKbJ2z
        gw2iylri8PGLrCDXMQtoSqzfpQ8RdpRY8fkIE0hYQoBP4sZbQYiD+CQmbZvODBHmlehoE4Ko
        VpOYdXwd3NqDFy4xT2BUmoXkzVlIXpuF5LVZCHsXMLKsYhRPLS3OTU8tNsxLLdcrTswtLs1L
        10vOz93ECExLp/8d/7SD8eulpEOMAhyMSjy8AYfWRwuxJpYVV+YeYpTgYFYS4Q26siFaiDcl
        sbIqtSg/vqg0J7X4EKM0B4uSOO+yeRujhQTSE0tSs1NTC1KLYLJMHJxSDYyrdCqzFRNWn/gz
        lbPFXm+9Dct5Wy3pY/NFDwjyXJ+w2CjN4/fcL2sPhka22HFdkH+Ropx43UeQzy3lz9PGT6F3
        VM7W3HCZ/zKMu37zZJuZT2dHWmdPq2Rney8hVMD38XLoometF4Ne7ps5Q+m/xyyLgujM29x8
        87b9kwrexmRS0SxWIcS7P0SJpTgj0VCLuag4EQA1So1RRwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xe7p2IpuiDZauY7TYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvF594jjBYzzu9jsjhz+hKrRfvTl8wWx9eGO3B6bFrVyeZx59oeNo8tV9tZ
        PPq2rGL0+LxJLoA1Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
        syy1SN8uQS/j4pOUgtMqFRP7jrI0ML6S7WLk5JAQMJE4cGoeSxcjF4eQwFJGiavvZrJBJGQk
        Tk5rYIWwhSX+XOtigyh6yyhx4vRaRpCEsECoxMmzN9lBbBEBDYk9D8+zghQxCzxnklhxvIUR
        oqOHWeJx706wUWwChhJdb7vAVvAK2En0/ZjHDGKzCKhILJ5/A2yqqECMxNHJLVA1ghInZz5h
        AbE5BQIltryfAlbDLKAu8WfeJWYIW15i+9s5ULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBk
        WcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYiduO/dyyg7HrXfAhRgEORiUe3oBD66OFWBPL
        iitzDzFKcDArifAGXdkQLcSbklhZlVqUH19UmpNafIjRFOi5icxSosn5wCSRVxJvaGpobmFp
        aG5sbmxmoSTOe96gMkpIID2xJDU7NbUgtQimj4mDU6qBUeZcXq679pNs5gJXq9iDP9irNlie
        i4yOmthQuHbXxGjLn348LH3rF9Xdmfo+v2NOEKs5s/cP16ylLPPaGcoZOGt+p8+3uXZE1nHh
        iYiPcf2SDH42F89fDQrclX/t3Y+eGZqLWa6p7Vuhy73v2PprlkuqVpadZ94e1BRwfnYWS/H2
        t03OM+YLKLEUZyQaajEXFScCAEkEkybaAgAA
Message-Id: <20181001123406eucas1p2c94cf1d1e4674d45c95a9ba9853a965b~ZfCUbgmeC1880918809eucas1p2N@eucas1p2.samsung.com>
X-CMS-MailID: 20181001123406eucas1p2c94cf1d1e4674d45c95a9ba9853a965b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20180919121357eucas1p19717351c40697483d3bf467c55e46f51
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20180919121357eucas1p19717351c40697483d3bf467c55e46f51
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
        <20180919121342.18288-1-m.szyprowski@samsung.com>
        <CAPDyKFpcs8VgPcBF4fta=tLPUatxbhvSN3TLrxm1qqDN=OS29Q@mail.gmail.com>
        <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
        <CAPDyKFok_Fc=9EDOvKByyuOYhHbejXKRT9+a+nRDEJ_YAjP2Aw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rafael and Ulf,

I understand your position on using runtime PM during system
suspend/resume, but
I would like add a few more words on why I need it.

On 2018-09-20 19:29, Ulf Hansson wrote:
> [...]
>>>> The unconditional calls to pm_runtime_enable and pm_runtime_enable
>>>> in device_suspend_late and device_resume_early core functions were a bit
>>>> surprising for me, because they make NOIRQ phase a special case from
>>>> the perspective of runtime PM handling. Using LATE system sleep phase
>>>> to call pm_runtime_enable/disable looks like a workaround for me, but right
>>>> now I have no other idea how to ensure proper behavior of the Exynos5433
>>>> CMU driver.
>>>>
>>>> The most strange thing is that I didn't observe this initially after
>>>> switching to NOIRQ phase. The CMU device (FSYS_CMU) which is not under
>>>> any power domain behaved correctly and was properly available for DWMMC
>>>> device, which needs to enable clocks in its noirq_resume callback.
>>>>
>>>> However, in case of AUD_CMU and its clients (for example serial_3 device,
>>>> which is a part of audio-subsytem), the pm_runtime_get_sync() called from
>>>> clk_prepare() failed, because AUD_CMU device had still disabled runtime PM
>>>> support. The only difference between FSYS_CMU and AUD_CMU, is the fact
>>>> that AUD_CMU is under AUD power domain, while FSYS_CMU device has no power
>>>> domain assigned (for completely other reasons FSYS power domains is not yet
>>>> instantiated in exynos5433.dtsi).
>>>>
>>>> Ulf/Rafael: could You comment a bit on this issue? How it should be solved
>>>> properly?
>>> In general, this sounds like the classical problem of
>>> suspending/resuming devices in a correct order. The long term solution
>>> is to use device links to address this problem.
>> Device links won't help in this case. This is not a problem of correct
>> order of suspending/resuming devices. exynos5433 cmu device is already
>> suspended after its client's and resumed before them. The problem here
>> is using runtime PM in exynos5433 CMU driver during NOIRQ suspend/resume
>> stage.
>>
> I see.
>
> However, I am guessing that one of the reason to why the client's are
> also using the noirq phase is because of getting a the correct order.
> The point is, the different level of PM callbacks (prepare, suspend,
> suspend_late, suspend_noirq etc) aren't really the right solution to
> get a correct order, even if that is what works for most cases.

Nope, in both cases clients (dw-mmc-exynos and samsung serial/uart driver)
use NOIRQ resume stage, because they want to play with interrupts (avoid
interrupt storm) on resume. The only way to avoid NOIRQ phase in them is
to manually mask their irqs on suspend and unmask after fixing interrupts
related registers, but using NOIRQ was preferred solution.

The main problem is that both clients needs to enable clocks to access
their registers in NOIRQ resume, thus their clock provider has to be able
to runtime resume as well. clk_prepare() will call pm_runtime_get_sync()
on clock provider device, but first someone has to call pm_runtime_enable()
on it, otherwise pm_runtimge_get_sync() fails.

> In principle, if all devices dependencies were hooked up correctly
> with device links, we would in principle only need one level of
> suspend/resume callbacks.
>
>>> However, as a simple fix, I would try to add a ->prepare() callback
>>> and call pm_runtime_get_sync() from it and then in a new corresponding
>>> ->complete() callback, call pm_runtime_put().
>>>
>>> This means that the device will stay runtime resumed until the
>>> suspend_noirq phase. It would also means the pm_runtime_force_resume()
>>> will resume the device at resume_noirq phase. Would that work?
>> Yes, this will work, but it will unnecessarily wake all instances of
>> exynos5433 cmu and their power domains during the system suspend/resume
>> cycle, what I would like to avoid.
> I guess what you are saying is that it's not at every suspend sequence
> that the client's needs to runtime resume the exynos5433 cmu device -
> and in those cases when not  needed, runtime resuming it becomes a
> waste in regards to both time and energy. Right?

Exactly. The other problem is that clock provider has to ensure that
calling pm_runtime_get_sync() on its device during NOIRQ phase will
not fail to let clients to properly prepare+enable their clocks.

> Anyway, I fully agree that this isn't very nice, but unfortunate
> that's the best I can think of as a simple solution.

> [...]
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

