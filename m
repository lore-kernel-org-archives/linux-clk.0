Return-Path: <SRS0=r4nj=MU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4440C65C20
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 14:51:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02EF72087D
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 14:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BpGdAOMn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02EF72087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbeJHWDk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Oct 2018 18:03:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37164 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbeJHWDj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Oct 2018 18:03:39 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181008145132euoutp0158d5eb6bea04761bd62909101cc79f1d~bqbUWOJue2008320083euoutp01i
        for <linux-clk@vger.kernel.org>; Mon,  8 Oct 2018 14:51:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181008145132euoutp0158d5eb6bea04761bd62909101cc79f1d~bqbUWOJue2008320083euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1539010292;
        bh=jnh2FzCRn4RsqVghZJKriWBFQ5hgPCEFwXYEbz73ODk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=BpGdAOMn8n9ZVDUhVn9qD7F2YKxtdESRl/0yUMkvrT1BYFYrxcrujtX9pVVWWyvAV
         Tv9LiVURxvdxiklXCVS8FeGem0IYPPPxNrZizb9DWL2oCFST3sfDoUHH2ax+jVm3Qj
         sGp5P1fhegYMOWNti9EUAtNCxedyU+/fr/FwnVwo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181008145132eucas1p1e2404be7fd2209c44ba9fd8a5fea1b9b~bqbT5usI11166811668eucas1p1k;
        Mon,  8 Oct 2018 14:51:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 51.F6.04441.4FE6BBB5; Mon,  8
        Oct 2018 15:51:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181008145131eucas1p1d8c3544989d03855e2c19a315fd55bd5~bqbS3B-Kg1166811668eucas1p1h;
        Mon,  8 Oct 2018 14:51:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20181008145131eusmtrp22b4aa55a59f6657d724d4e53ee896b77~bqbSl-b6W1435414354eusmtrp2c;
        Mon,  8 Oct 2018 14:51:31 +0000 (GMT)
X-AuditID: cbfec7f2-5e3ff70000001159-51-5bbb6ef4c6b8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 83.5D.04284.2FE6BBB5; Mon,  8
        Oct 2018 15:51:30 +0100 (BST)
Received: from [106.116.147.30] (unknown [106.116.147.30]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20181008145130eusmtip13fc225dd6cecd2cf6b2a4b9b32c341ef~bqbSR-igX2655826558eusmtip14;
        Mon,  8 Oct 2018 14:51:30 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: Use clk_hw API for calling clk framework
 from clk notifiers
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Date:   Mon, 8 Oct 2018 16:51:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
        Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <153896685140.119890.3664164252562492456@swboyd.mtv.corp.google.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUhTcRTlt/e291xN3jbFm0nSyshgfmDQyCiFKKGilCKYUj7dQyU3ZXNL
        /Usx1JaIVNBao/lRtpa0FNPlynKK0xauRmgoZJhRCivMSY7A8vm0/O+ec++55x64JCZp5keT
        RZoyRquhi2UCId4zHBqTBzWu7CTTCqHoNDn4iongV77C53tCKBYaPvIVJl8/T7Ey3okr6r7M
        YWlERpf9qiCjsduOMha7dpzBlMJDKqa4yMBoEw/nCguf1/qI0mVBuXf8Hl6FXHwjCiOB2g+W
        liHciISkhLIhcA59F3AgiOBmyxLGgUUEb2wjxIbk27yf4BoPEPSPveJz4AcCn8XPMyKSlFK5
        8KtdwwoiqHxwd3xG7AxGdSMYnrSvmQuoZDAGjAK2xqnd4K2eJFhtJJUDv/tSWVpEiWH09izO
        0mFUJnisWSyNUbHQG7BgXB0Fk7NWHrseqFYCHMvTOKc1wGCbDXFHH4UJl0nA1VKY93Svh4mB
        P882xDUI6kxmggMNCJ5anOuKVBj0vOOzV2BUPDj6Ejk6He5Yl9ZooMLhQ0DMHRQO13tuYRwt
        gvpaCTe9B8yex/9sB976sSYkM29Kad4Uzbwpmvm/bzPC7SiK0evUBYwuWcNcTtDRap1eU5CQ
        X6LuQqt/413x/HSiJX+eG1Ekkm0VmVZ/SMKnDboKtRsBickiRJG9fdkSkYquqGS0JRe1+mJG
        50bbSVwWJWq/25ktoQroMuYSw5Qy2o0ujwyLrkJx9erzp+3B+LFQ4ELNgnWXLTMmf0rVei6n
        /VG0wRXqmdniOT59ZODUtaSAMuV+XFblXum2RVWKdORlgsctLrfTbcrpE/qd7x2EJl3+6eRU
        b1pTf+UNdwjN7CqtVj8cKskaea08Gytv9I5eKTyQNCefPXhsvKOlQ/SiYT6v1imW4bpCOnkf
        ptXRfwFdKAPIMwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7qf8nZHG3y9Y2OxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVn8u7aRxaL96UtmB3aPTas62Tz6tqxi9Pi8SS6AOUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY0/befaCH2wVp68t
        YWlg3M3axcjJISFgIvHi1SX2LkYuDiGBpYwSp57+ZIZIyEicnNYAVSQs8edaFxtE0VtGicXr
        zwM5HBzCAgkS35flgdSICCRL7Lm+CayGWWALo8TEN22sEA03GCW2XFzIBFLFJmAo0fUWZBIn
        B6+AncSarjYwm0VAReJ04y12EFtUIEbi6OQWqBpBiZMzn7CALOMUCJQ4Pj8IJMwsoC7xZ94l
        ZghbXmL72zlQtrjErSfzmSYwCs1C0j0LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqX
        rpecn7uJERhh24793LyD8dLG4EOMAhyMSjy8AX67ooVYE8uKK3MPMUpwMCuJ8IpuBwrxpiRW
        VqUW5ccXleakFh9iNAX6bSKzlGhyPjD680riDU0NzS0sDc2NzY3NLJTEec8bVEYJCaQnlqRm
        p6YWpBbB9DFxcEo1MFZZiS8pUbke+YqPU/WzVUWL5OG7gsGuSqsqxdt2c7RcvnFtiptf6867
        s6NU1sjemcIjlry4ivfErKPRwQav/1QIqG1t4OfJWfk7VOG/esbkyom3n6xc66Ac9WrG56Bp
        LN+iL1QfC2HIOlDIYNYafumpl6qK5V+xiAkL3/fvauvlmsWt+EWgTYmlOCPRUIu5qDgRAGBs
        GAbGAgAA
Message-Id: <20181008145131eucas1p1d8c3544989d03855e2c19a315fd55bd5~bqbS3B-Kg1166811668eucas1p1h@eucas1p1.samsung.com>
X-CMS-MailID: 20181008145131eucas1p1d8c3544989d03855e2c19a315fd55bd5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181002115219eucas1p23816d543c4dedb233406869c22713a95
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181002115219eucas1p23816d543c4dedb233406869c22713a95
References: <CGME20181002115219eucas1p23816d543c4dedb233406869c22713a95@eucas1p2.samsung.com>
        <20181002115210.15541-1-m.szyprowski@samsung.com>
        <153896685140.119890.3664164252562492456@swboyd.mtv.corp.google.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On 2018-10-08 04:47, Stephen Boyd wrote:
> Quoting Marek Szyprowski (2018-10-02 04:52:10)
>> @@ -432,7 +432,7 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>>         else
>>                 cpuclk->clk_nb.notifier_call = exynos_cpuclk_notifier_cb;
>>  
>> -       cpuclk->alt_parent = __clk_lookup(alt_parent);
>> +       cpuclk->alt_parent = __clk_get_hw(__clk_lookup(alt_parent));
> It would be nice to get rid of __clk_lookup() from here too. Please try
> to do that if at all possible.

So far it won't be possible to get rid of __clk_lookup() completely from
samsung/clk-cpu.c, because there is a need to register clk notifier for
CPU clock, but there is no clk_hw_notifier_register() api. I'm not sure if
this is the right way to add it.

> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

